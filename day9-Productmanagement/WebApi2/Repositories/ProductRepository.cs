using Microsoft.EntityFrameworkCore;
using static ProductManager.Models.EntityModels;
namespace WebApi2.Repositories
{
    public class ProductRepository: IProductRepository
    {
        public ProductDbContext _context;
        public ProductRepository(ProductDbContext context)
        {
            _context = context;
        }
       public List<Product> GetAllProducts()
        {
            List<Product> ob=_context.Products.ToList();
            return ob;
        }

        public Product GetProductById(int id)
        {
            Product product = _context.Products.Find(id);
            return product;
        }
        public void AddProduct(Product obj)
        {
            _context.Products.Add(obj);
            _context.SaveChanges();
        }
        public void UpdateProduct(Product ob)
        {
            //Student ob = _context.Students.Find(id);
            _context.Products.Update(ob);
            _context.SaveChanges();

        }
        public void DeleteProductbyId(int id)
        {
            Product ob = _context.Products.Find(id);
            _context.Products.Remove(ob);
            _context.SaveChanges();

        }
        public List<Product> GetProductsByCategory(string category)
        {
            return _context.Products.Where(p => p.Category == category).ToList();
        }
        public List<Product> OutOfStock()
        {
            return _context.Products.Where(p => p.Quantity == 0).ToList();
            
        }
        public List<Product> InRange(int a,int b)
        {
            return _context.Products.Where(p => p.UnitPrice >= a && p.UnitPrice<=b).ToList();
        }
        public List<string> CategoryNames()
        {
            return _context.Products.Select(p =>p.Category).ToList();

        }
    }
}
