using Bridge.Html5;

namespace Common.Extensions
{
    public static class HtmlElementExtension
    {
        public static void ReplaceClass(this Node node, string oldClass, string newClass)
        {
            if (string.IsNullOrEmpty(oldClass)) return;
            var element = node as Element;
            element.ClassName = element.ClassName.Replace(new RegExp("\\s*" + oldClass + "\\s*"), newClass);
        }

        public static void AddClass(this Node node, string className)
        {
            if (string.IsNullOrEmpty(className)) return;
            var element = node as Element;
            element.ClassName = (element.ClassName + " " + className).Trim();
        }

        public static void RemoveClass(this Node node, string className)
        {
            if (string.IsNullOrEmpty(className)) return;
            node.ReplaceClass(className, string.Empty);
        }
    }
}
