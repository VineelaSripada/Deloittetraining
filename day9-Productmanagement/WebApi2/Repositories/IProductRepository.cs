using static ProductManager.Models.EntityModels;

namespace WebApi2.Repositories
{
    public interface IProductRepository 
    {
        List<Product> GetAllProducts();
        Product GetProductById(int id);
        void AddProduct(Product Obj);

        void UpdateProduct(Product ob);
        void DeleteProductbyId(int id);
        List<Product> GetProductsByCategory(string category);

        List<Product> OutOfStock();

        List<Product> InRange(int a,int b);

        List<string> CategoryNames();
    }
}
