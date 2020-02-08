using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CRUDOperationTask.Models;

namespace CRUDOperationTask.Repositories
{
    public interface IProductRepository
    {
        IEnumerable<Product> GetProduct();
        Product GetProductById(int id);
        void NewProduct(Product product);
        void UpdateProduct(Product product);
        void DeleteProduct(int id);
        void Save();
    }
}
