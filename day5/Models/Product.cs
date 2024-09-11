using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;

namespace WebApplication6.Models
{
    public class Product
    {
        [Key]
        public int pId { get; set; } 
        public string pName { get; set; }
        public string Category { get; set; }
        public string price { get; set; }
        public string quantity { get; set; }
    }
    public class ProductDbContext : DbContext
    {
        public DbSet<Product> Products { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Product>()
          
                .HasKey(p => p.pId);

          
        }
        public ProductDbContext(DbContextOptions<ProductDbContext> options)
        : base(options)
        {

        }


    }
}
