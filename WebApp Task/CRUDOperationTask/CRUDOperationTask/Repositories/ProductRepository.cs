using CRUDOperationTask.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace CRUDOperationTask.Repositories
{
    public class ProductRepository : IProductRepository
    {
        private readonly InventoryEntities _dbContext;

        public ProductRepository()
        {
            _dbContext = new InventoryEntities();
        }
        public ProductRepository(InventoryEntities context)
        {
            _dbContext = context;
        }

        public IEnumerable<Product> GetProduct()
        {
            return _dbContext.Products.ToList();
        }

        public Product GetProductById(int id)
        {
            return _dbContext.Products.Find(id);
        }

        public void NewProduct(Product  employee)
        {
            _dbContext.Products.Add(employee);
            Save();
        }

        public void UpdateProduct(Product product)
        {
            _dbContext.Entry(product).State = EntityState.Modified;
        }

        public void DeleteProduct(int id)
        {
            var employee = _dbContext.Products.Find(id);
            if (employee != null) _dbContext.Products.Remove(employee);
        }

        public void Save()
        {
            _dbContext.SaveChanges();
        }

        private bool _disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this._disposed)
            {
                if (disposing)
                {
                    _dbContext.Dispose();
                }
            }
            this._disposed = true;
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}