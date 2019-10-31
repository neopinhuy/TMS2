using Bridge;
using System;

namespace Components.Extensions
{
    public class ToastOptions
    {
        public Action callback { get; set; }
        public int timeout { get; set; }
        public double distance { get; set; }
        public bool showTop { get; set; }
        public string clsToast { get; set; }
        public string Message { get; set; }
    }
    public static class Toast
    {
        [Template("Metro.toast.create({options}.Message, null, null, null, {options})")]
        public static void Create(ToastOptions options)
        {

        }
    }
}
