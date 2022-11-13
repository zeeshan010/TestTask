using System.Collections.Generic;
using System.Threading.Tasks;

namespace TestTask.Core.Interfaces
{
    public interface IGenericRepository<T> where T : class
    {
        Task<dynamic> GetByIdAsync(int id);
        Task<IReadOnlyList<dynamic>> GetAllAsync();
        Task<int> AddAsync(T entity);
        Task<int> UpdateAsync(T entity);
        Task<int> DeleteAsync(int id);
    }
}
