using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TestTask.Core.DTO;
using TestTask.Core.Interfaces;

namespace TestTask.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HotelController : ControllerBase
    {
        private readonly IUnitOfWork _unitOfWork;
        public HotelController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [Route("Search")]
        [HttpPost]
        public async Task<IActionResult> Search(SearchHotel model)
        {
            var data = await _unitOfWork.Hotel.Search(model);
            return Ok(data);
        }

        [Route("GetHotelPicsById/{HotelId}")]
        [HttpGet]
        public async Task<IActionResult> GetHotelPicsById(int HotelId)
        {
            var data = await _unitOfWork.Hotel.GetHotelPicsById(HotelId);
            return Ok(data);
        }

        [Route("GetRoomDetailsById/{RoomId}")]
        [HttpGet]
        public async Task<IActionResult> GetRoomDetailsById(int RoomId)
        {
            var data = await _unitOfWork.Hotel.GetRoomDetailsById(RoomId);
            return Ok(data);
        }
        [Route("GetRoomPicsById/{RoomId}")]
        [HttpGet]
        public async Task<IActionResult> GetRoomPicsById(int RoomId)
        {
            var data = await _unitOfWork.Hotel.GetRoomPicsById(RoomId);
            return Ok(data);
        }

        [Route("ReserveRoom")]
        [HttpPost]
        public async Task<IActionResult> ReserveRoom(ReserveRoom model)
        {
            var data = await _unitOfWork.Hotel.ReserveRoom(model);
            return Ok(data);
        }
    }
}
