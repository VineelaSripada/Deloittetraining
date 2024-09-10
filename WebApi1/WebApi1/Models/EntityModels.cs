using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;

namespace WebApi1.Models
{
    public class EntityModels
    {
        public class Product
        {

            [Key]
            public int pId { get; set; }
            public string Name { get; set; }
            public string Course { get; set; }
            public string Email { get; set; }
        }


        // DbContext used to perform operations on database tables
        public class ProductDbContext : DbContext
        {
            // This property refer the databse table 
            // Multiple tables required multiple properties
            public DbSet<Product> Products { get; set; }
            protected override void OnModelCreating(ModelBuilder modelBuilder)
            {
                modelBuilder.Entity<Product>()
                    .HasKey(p => p.pId);

                // Other configurations
            }
            public ProductDbContext(DbContextOptions<ProductDbContext> options)
             : base(options)
            {

            }


        }
    }
}
