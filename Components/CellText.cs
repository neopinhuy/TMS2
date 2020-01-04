using Bridge.Html5;
using Common.Extensions;
using Components.Extensions;
using MVVM;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Components
{
    public class CellText : Component
    {
        private readonly IEnumerable<IEnumerable<object>> _refData;
        private readonly Header<object> _header;
        private readonly Element _htmlCell;

        public CellText(Header<object> header, IEnumerable<IEnumerable<object>> refData)
        {
            _header = header;
            _refData = refData;
            _htmlCell = Html.Context;
        }

        public override void Render()
        {
            var cellData = Entity.GetComplexPropValue(_header.FieldName);
            var cellText = GetCellText(_header, cellData, Entity);
            _header.TextAlign = CalcTextAlign(_header, cellData);
            Html.Instance.TextAlign(_header.TextAlign);
            if (cellData is bool cellBool)
            {
                // Render checkbox instead of simple true false
                Html.Instance.Padding(Direction.bottom, 0).SmallCheckbox(string.Empty, cellBool).Disabled(true).End.Render();
            }
            else
            {
                Html.Instance.Span.ClassName("cell-text");
                if (_header.Component == "Image")
                    Html.Instance.Img.Src(cellText).End.Render();
                else if (_header.Component == "Link")
                {
                    AddChild(new EditableLink(_header.MapToComponent(Entity)));
                }
                else Html.Instance.Text(cellText).End.Render();
            }
        }

        private static TextAlign? CalcTextAlign(Header<object> header, object cellData)
        {
            var textAlign = header.TextAlign;
            if (textAlign != null || cellData is null) return textAlign;
            if (header.Reference.HasAnyChar() || cellData is string) return TextAlign.left;
            if (cellData.GetType().IsNumber()) return TextAlign.right;
            if (cellData is bool || cellData is bool?) return TextAlign.center;
            return TextAlign.center;
        }

        private string GetCellText(Header<object> header, object cellData, object row)
        {
            if (header.FormatRow.HasAnyChar()) return Utils.FormatWith(header.FormatRow, row);
            else if (cellData == null) return string.Empty;
            else if (header.FieldName == IdField && (int)cellData <= 0) return string.Empty;
            else if (cellData is DateTime)
            {
                return string.Format(header.FormatCell ?? "{0:dd/MM/yyyy}", cellData as DateTime?);
            }
            else if (header.Reference != null)
            {
                var source = _refData.GetSourceByTypeName(header.Reference);
                var found = source.FirstOrDefault(x => (int)x[IdField] == (int)cellData);
                if (found == null) return string.Empty;
                if (header.FormatCell.HasAnyChar())
                {
                    return Utils.FormatWith(header.FormatCell, found);
                }
                else
                {
                    Console.WriteLine($"Format of {header.FieldName} is null");
                    throw new InvalidOperationException($"Format of {header.FieldName} is null");
                }
            }
            else if (header.FormatCell.HasAnyChar()) return string.Format(header.FormatCell, cellData);
            else return cellData.ToString();
        }

        public override void UpdateView()
        {
            var cellData = Entity.GetComplexPropValue(_header.FieldName);
            var cellText = GetCellText(_header, cellData, Entity);
            Html.Take(_htmlCell).Clear().Text(cellText);
        }
    }
}
