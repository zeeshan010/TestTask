using System;
using System.Linq;
using TestTask.Core.Entities;
using System.Data.SqlClient;
using System.Threading.Tasks;
using System.Collections.Generic;
using TestTask.Core.Interfaces;
using Microsoft.Extensions.Configuration;
using Dapper;
using TestTask.Core.DTO;
using System.Data;

namespace TestTask.Infrastructure.Repositories
{
    public class HotelRepository : IHotelRepository
    {
        private readonly string _connectionString;

        public HotelRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        public async Task<IReadOnlyList<dynamic>> Search(SearchHotel search)
        {
             string sql = $"Select H.HotelId, H.Name as HotelName, H.Rating, H.Address, R.CurrentPrice, R.RoomId from TestTask.dbo.Hotels(nolock) H inner join TestTask.dbo.Room(nolock) R on H.HotelId=R.hotelId inner join TestTask.dbo.RoomType(nolock) RT on RT.RoomTypeId=R.RoomTypeId inner join TestTask.dbo.City(nolock) C on C.CityId=H.CityId where (H.Name like '%{search.Search}%' or H.Address like '%{search.Search}%' or c.CityName like '%{search.Search}%') AND RT.TypeName='{search.RoomType}' and r.RoomId  not in( select rr.RoomId from TestTask.dbo.RoomReserved(nolock) RR  inner join  TestTask.dbo.Reservation(nolock) R on RR.ReservationId=R.ReservationId WHERE R.StartDate NOT BETWEEN CAST('{search.StartDate}' AS DATE) and CAST('{search.EndDate}' AS DATE) AND R.EndDate NOT BETWEEN CAST('{search.StartDate}' AS DATE) and CAST('{search.EndDate}' AS DATE) )";
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                var result = await connection.QueryAsync<dynamic>(sql);
                return result.ToList();
            }
        }

        public async Task<IReadOnlyList<dynamic>> GetRoomDetailsById(int id)
        {
            string sql = $"Select H.HotelId, H.Name AS HotelName, H.Description as HotelDescription, H.Address, c.CityName,r.CurrentPrice, r.Description as RoomDescription, r.RoomId, r.RoomName,rt.TypeName from TestTask.dbo.Hotels(nolock) H  inner join TestTask.dbo.Room(nolock) R on H.HotelId=R.hotelId  inner join TestTask.dbo.HotelPics(nolock) HP on H.HotelId=HP.HotelId  inner join TestTask.dbo.City(nolock) C on C.CityId=H.CityId  inner join TestTask.dbo.RoomType(nolock) RT on RT.RoomTypeId=R.RoomTypeId  where r.RoomId={id}";
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                var result = await connection.QueryAsync<dynamic>(sql);
                return result.ToList();
            }
        }

        public async Task<IReadOnlyList<dynamic>> GetRoomPicsById(int Id)
        {
            string sql = $"select  * from TestTask.dbo.RoomPics(nolock) where RoomId={Id}";
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                var result = await connection.QueryAsync<dynamic>(sql);
                return result.ToList();
            }
        }

        public async Task<IReadOnlyList<dynamic>> GetHotelPicsById(int Id)
        {
            string sql = $"select  * from TestTask.dbo.HotelPics(nolock) where HotelId={Id}";
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                var result = await connection.QueryAsync<dynamic>(sql);
                return result.ToList();
            }
        }

        public async Task<dynamic> ReserveRoom(ReserveRoom model)
        {
            string sql = $"select GuestId from TestTask.dbo.Guest(nolock) where Mobile='{model.Mobile}' or Email='{model.Email}'";
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                var guestId = 0;
                var result = await connection.QueryAsync<int>(sql);
                if (result.FirstOrDefault() != null)
                {
                     guestId = result.FirstOrDefault();
                }
                if (guestId == 0)
                {
                    sql = $"Insert into TestTask.dbo.Guest values('{model.FirstName}','{model.LastName}','{model.Email}','{model.Mobile}')";
                    var neGuestId = await connection.QueryAsync<int>(sql);
                    guestId = neGuestId.FirstOrDefault();
                }

                sql = $"insert into TestTask.dbo.Reservation values({guestId}, '{model.StartDate}', '{model.EndDate}', {model.DiscountPercentage}, {model.TotalPrice}, '{Guid.NewGuid().ToString()}', '{DateTime.Now}', {model.RoomId}, {model.PriceAfterDiscount})";
                var reservation = await connection.QueryAsync<int>(sql);
                var reservationId = reservation.FirstOrDefault();

                if (reservationId == 0)
                {
                     sql = $"select * from Reservation where ReservationId={reservationId}";
                    var resevationDetials = await connection.QueryAsync<dynamic>(sql);
                    if(resevationDetials.FirstOrDefault() != null)
                    {
                        var reserved = resevationDetials.FirstOrDefault();
                        return new { ReservationNo = reserved.ReservationNo, Message="Reservation done successful!" };
                    }
                }

                return new {ErrorMessage="Something went wront, try again later"};
            }
        }
    }
}
