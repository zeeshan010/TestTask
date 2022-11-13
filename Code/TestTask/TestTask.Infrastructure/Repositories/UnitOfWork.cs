using TestTask.Core.Interfaces;

namespace TestTask.Infrastructure.Repositories
{
    public class UnitOfWork : IUnitOfWork
    {
        public UnitOfWork(IHotelRepository hotelRepository)
        {
            Hotel = hotelRepository;
        }
        public IHotelRepository Hotel { get; }
    }
}
