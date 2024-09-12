using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
namespace ProductManager.Models
{
    public class EntityModels  
    {
        public class Product
        {
            
            public int ProductId { get; set; }
            public string Name { get; set; }
            public string Category { get; set; }
            public int UnitPrice { get; set; }
            public int Quantity { get; set; }
            public string Description { get; set; }

    }
            public class ProductDbContext : DbContext
            {
                public DbSet<Product> Products { get; set; }

                public ProductDbContext(DbContextOptions<ProductDbContext> options)
                 : base(options)
                {

                }
            
        }
    }
}
