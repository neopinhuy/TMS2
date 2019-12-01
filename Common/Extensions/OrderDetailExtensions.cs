using Common.Enums;
using TMS.API.Models;
using static Retyped.googlemaps.google.maps;

namespace Common.Extensions
{
    public static class OrderDetailExtensions
    {
        public static void CalcDefaultAndPrice(this OrderDetail detail)
        {
            if (detail is null) return;
            detail.CurrencyId = detail.Order.CurrencyId;
            detail.Vat = detail.Order.Vat;
            detail.TotalWeight = detail.BoxWeight * detail.TotalBox;
            if (detail.BoxVolume is null)
                detail.BoxVolume = detail.BoxLength * detail.BoxWidth * detail.BoxHeight;
            if (detail.TotalVolume is null)
                detail.TotalVolume = detail.BoxVolume * detail.TotalBox;
            if ((detail.TransportDistance is null || detail.TransportDistance <= 0)
                && detail.From != null && detail.To != null)
            {
                // Not to calc distance right now as google map is not free
                //var from = new LatLng(detail.From.Lat, detail.From.Long);
                //var to = new LatLng(detail.To.Lat, detail.To.Long);
                //var distance = geometry.spherical.computeDistanceBetween(from, to);
                //detail.TransportDistance = (decimal)distance;
            }
            CalcOrderDetailPrice(detail);
        }

        private static void CalcOrderDetailPrice(OrderDetail detail)
        {
            if (detail is null) return;
            if (detail.QuotationId is null)
                throw new InvalidOperationException($"Quotation of order detail OD{detail.Id:00000} is null");
            var price = detail.Quotation.Price;
            var priceType = (PriceTypeEnum)detail.Quotation.PriceTypeId;
            if (price is null)
                throw new InvalidOperationException($"No price has been set for the order detail OD{detail.Id:00000}");
            switch (priceType)
            {
                case PriceTypeEnum.Distance:
                    detail.TotalPriceBeforeDiscount = price * detail.TransportDistance;
                    break;
                case PriceTypeEnum.Weight:
                    detail.TotalPriceBeforeDiscount = price * detail.TotalWeight;
                    break;
                case PriceTypeEnum.Container:
                    detail.TotalPriceBeforeDiscount = price * detail.TotalContainer;
                    break;
                case PriceTypeEnum.Volume:
                    detail.TotalPriceBeforeDiscount = price * detail.TotalVolume;
                    break;
                default:
                    detail.TotalPriceBeforeDiscount = price;
                    break;
            }
            CalcDiscountAndTax(detail);
        }

        private static void CalcDiscountAndTax(OrderDetail detail)
        {
            if (detail.DiscountMoney.HasValue)
                detail.TotalPriceAfterDiscount = detail.TotalPriceBeforeDiscount - detail.DiscountMoney;
            else if (detail.DiscountPercentage.HasValue)
                detail.TotalPriceAfterDiscount = detail.TotalPriceBeforeDiscount * (100 - detail.DiscountPercentage) / 100;
            else detail.TotalPriceAfterDiscount = detail.TotalPriceBeforeDiscount;
            detail.TotalDiscountAfterTax = detail.TotalPriceAfterDiscount * (100 + detail.Order.Vat ?? detail.Vat) / 100;
        }
    }
}
