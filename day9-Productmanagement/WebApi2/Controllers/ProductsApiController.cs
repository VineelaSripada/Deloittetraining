using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApi2.Services;
using static ProductManager.Models.EntityModels;

namespace ProductManager.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class ProductsApiController : ControllerBase
    {
        public IProductService _service;
        public ProductsApiController(IProductService service)
        {
            _service = service;
        }
        [HttpGet]
        public IActionResult GetAllProducts()
        {
            return Ok(_service.GetAllProducts());
        }
        [HttpGet("{id}")]
        public IActionResult GetProductById(int id)
        {
            Product obj = _service.GetProductById(id);

            if (obj == null)
            {
                return NotFound(new { result = "Requested employee details are not available." });
            }
            else
            {
                return Ok(obj);
            }
        }
        [HttpPost]
        public IActionResult AddProduct(Product studentObj)
        {
            _service.AddProduct(studentObj);
            return Ok(new { result = "added" });
        }
        [HttpPut]

        public IActionResult UpdateProduct(Product Obj)

        {
            _service.UpdateProduct(Obj);
            return Ok(new { result = "updated" });
        }
        [HttpDelete]
        public IActionResult DeleteProductbyId(int id)
        {
            _service.DeleteProductbyId(id);
            return Ok(new { result = "deleted" });
        }
        [HttpGet("category/{category}")]
        public IActionResult GetProductsByCategory(string category)
        {
             List<Product> ob =_service.GetProductsByCategory(category);
            if (ob == null)
            {
                return NotFound(new { result = "Requested employee details are not available." });
            }
            else
            {
                return Ok(ob);
            }
        }
        [HttpGet("OutOfStock")]
        public IActionResult OutOfStock()
        {
            return Ok(_service.OutOfStock());
        }

        [HttpGet("InRange/{a},{b}")]
        public IActionResult InRange(int a,int b)
        {
            return Ok(_service.InRange(a, b));
        }
        [HttpGet("CategoryNames")]
        public IActionResult CategoryNames()
        {
            return Ok(_service.CategoryNames());
        }
    }
}
