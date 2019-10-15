﻿using Bridge.Html5;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Common.Extensions
{
    public static class HtmlElement
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
    }
}
