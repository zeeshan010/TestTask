using TestTask.Core.DTO;
using TestTask.Core.Entities;

namespace TestTask.Core.Interfaces
{
    public interface IHotelRepository
    {
        public  Task<IReadOnlyList<dynamic>> Search(SearchHotel model);
        public Task<IReadOnlyList<dynamic>> GetRoomDetailsById(int Id);
        public Task<IReadOnlyList<dynamic>> GetRoomPicsById(int Id);
        public Task<IReadOnlyList<dynamic>> GetHotelPicsById(int Id);

        public Task<dynamic> ReserveRoom(ReserveRoom model);
    }
}
