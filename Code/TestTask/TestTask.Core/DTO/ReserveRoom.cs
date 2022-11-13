using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestTask.Core.DTO
{
    public class ReserveRoom
    {
        public int HotelId { get; set; }
        public int RoomId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
        public decimal TotalPrice { get; set; }
        public decimal DiscountPercentage { get; set; }
        public decimal PriceAfterDiscount { get; set; }

    }
}
