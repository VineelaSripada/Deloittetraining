using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using static WebApi1.Models.EntityModels;

namespace WebApi1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductApiController : ControllerBase
    {
       
       
        public ProductDbContext _context;

        public ProductApiController(ProductDbContext context)
        {
            _context = context;
        }


        [HttpGet]
        public IActionResult GetAllProducts()
        {
            List<Product> products = _context.Products.ToList();
            return Ok(products);
        }

        [HttpGet("{id}")]
        public IActionResult GetProductById(int id)
        {
            Product obj = _context.Products.Find(id);

            if (obj != null)
            {
                return Ok(obj);
            }
            else
            {
                return NotFound(new { status = "product details donot exists." });
            }
        }

        [HttpPost]
        public IActionResult CreateStudent(Product obj)
        {
            _context.Products.Add(obj);
            _context.SaveChanges();
            return Ok(new { status = "New product details added." });
        }

        [HttpPut]
        public IActionResult EditStudent(Product obj)
        {
            _context.Products.Update(obj);
            _context.SaveChanges();
            return Ok(new { status = "Product details updated in server." });
        }


        [HttpDelete("{id}")]
        public IActionResult DeleteStudentById(int id)
        {
            Product obj = _context.Products.Find(id);

            if (obj != null)
            {
                _context.Products.Remove(obj);
                _context.SaveChanges();
                return Ok(new { status = "Product details are deleted from server." });
            }
            else
            {
                return NotFound(new { status = "Requested student details does not exists." });
            }
        }

    }
}
