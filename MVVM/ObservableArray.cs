using System;
using System.Collections.Generic;

namespace MVVM
{
    public enum ObservableAction
    {
        Render,
        Push,
        Add,
        Update,
        Remove,
        Move
    }

    public class ObservableArray<T> : Observable<T[]>
    {
        public ObservableArray() : base(new T[] { })
        {
        }

        public ObservableArray(T[] data) : base(data)
        {
        }

        public void Subscribe(Action<ObservableArrayArgs<T>> subscriber)
        {
            var action = subscriber.As<Action<object>>();
            if (!_subscribers.Contains(action))
            {
                _subscribers.Add(action);
            }
        }

        public void UnsubscribeAll()
        {
            _subscribers?.Clear();
        }

        protected override void Notify()
        {
            NotifyArrayChanged(new ObservableArrayArgs<T>
            {
                Array = NewValue.As<T[]>(),
                Item = default,
                Index = -1,
                Action = ObservableAction.Render
            });
        }

        public void NotifyArrayChanged(ObservableArrayArgs<T> arg)
        {
            var isBeingExecuted = _exeStack.Contains(this);
            if (isBeingExecuted)
                return;
            _exeStack.Add(this);
            _subscribers.ForEach((subscriber) => {
                subscriber(arg);
            });
            _dependencies.ForEach((dpc) => {
                dpc.NotifyChange();
            });
            _exeStack.Remove(this);
        }

        public void Add(T item, int? index = null)
        {
            var array = Data;
            var position = index ?? array.Length;
            array.Splice(position, 0, item);
            NotifyArrayChanged(new ObservableArrayArgs<T>
            {
                Array = array,
                Item = item,
                Index = position,
                Action = ObservableAction.Add
            });
        }

        public void AddRange(params T[] items)
        {
            items.ForEach(x => Add(x));
        }

        public void Remove(T item)
        {
            var array = Data;
            var index = Array.IndexOf(array, item);
            RemoveAt(index);
        }

        public void RemoveAt(int index)
        {
            var array = Data;
            var item = array[index];
            array.Splice(index, 1);
            NotifyArrayChanged(new ObservableArrayArgs<T>
            {
                Array = array,
                Item = item,
                Index = index,
                Action = ObservableAction.Remove
            });
        }

        public void Replace(T item, T itemUpdated)
        {
            var array = Data;
            var index = Array.IndexOf(array, item);
            RemoveAt(index);
            Add(itemUpdated, index);
        }

        public void Update(T item, int index)
        {
            var array = Data;
            array[index] = item;
            NotifyArrayChanged(new ObservableArrayArgs<T>
            {
                Array = array,
                Item = item,
                Index = index,
                Action = ObservableAction.Update
            });
        }
    }
}
