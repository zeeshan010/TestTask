using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestTask.Core.DTO
{
    public class SearchHotel
    {
        public string Search { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string RoomType { get; set; }

    }
}
