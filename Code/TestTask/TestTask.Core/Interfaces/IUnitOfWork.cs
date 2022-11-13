namespace TestTask.Core.Interfaces
{
    public interface IUnitOfWork
    {
        IHotelRepository Hotel { get; }
    }
}
