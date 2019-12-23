using Bridge.Html5;

namespace Common.Extensions
{
    public static class HtmlElementExtension
    {
        public static bool HasClass(this Element element, string className)
        {
            if (element is null) throw new InvalidOperationException($"{nameof(element)} is null");
            if (!className.HasAnyChar()) return false;
            return element.ClassName.Contains(className);
        }

        public static void ReplaceClass(this Node node, string oldClass, string newClass)
        {
            if (string.IsNullOrEmpty(oldClass)) return;
            var element = node as Element;
            element.ClassName = element.ClassName.Replace(oldClass, newClass)
                .Trim().Replace(new RegExp(@"\s+"), " ");
        }

        public static void AddClass(this Node node, string className)
        {
            if (node is null || string.IsNullOrEmpty(className)) return;
            var element = node as Element;
            element.ClassName = (element.ClassName + " " + className).Trim();
        }

        public static void RemoveClass(this Node node, string className)
        {
            if (node is null || string.IsNullOrEmpty(className)) return;
            node.ReplaceClass(className, string.Empty);
        }

        public static void ToggleClass(this Node node, string className)
        {
            if (node is null || string.IsNullOrEmpty(className)) return;
            var hasClass = (node as HTMLElement).ClassName.Contains(className);
            if (hasClass) RemoveClass(node, className);
            else AddClass(node, className);
        }

        public static bool Hidden(this Element node)
        {
            if (node is null) throw new InvalidOperationException($"{nameof(node)} is null");
            var x = node.GetBoundingClientRect();
            return x.Bottom == 0 && x.Top == 0 && x.Width == 0 && x.Height == 0;
        }
    }
}
