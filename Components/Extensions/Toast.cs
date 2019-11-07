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
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Style", "IDE0060:Remove unused parameter", Justification = "<Pending>")]
        public static void Create(ToastOptions options)
        {

        }

        public static void Success(string message)
        {
            Create(new ToastOptions
            {
                clsToast = "success",
                timeout = 2000,
                Message = message,
                showTop = true
            });
        }

        public static void Warning(string message)
        {
            Create(new ToastOptions
            {
                clsToast = "warning",
                timeout = 2000,
                Message = message,
                showTop = true
            });
        }
    }
}
