using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using WebApplication6.Models;

namespace WebApplication6.Controllers
{
    public class HomeController : Controller
    {

        ProductDbContext _context;
        public HomeController(ProductDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            List<Product> stList = _context.Products.ToList();
            return View(stList);
        }
        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create(Product obj)
        {
            _context.Products.Add(obj);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]

        public IActionResult Edit(int id)
        {
            Product Obj = _context.Products.Find(id);
            return View(Obj);
        }

        [HttpPost]
        public IActionResult Edit(Product Obj)
        {
            _context.Products.Update(Obj);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Details(int id)
        {
            Product Obj = _context.Products.Find(id);
            return View(Obj);
        }
        [HttpGet]
        public IActionResult Delete(int id)
        {
            Product Obj = _context.Products.Find(id);
            return View(Obj);
        }
        [HttpPost,ActionName("Delete")]

        public IActionResult Deleteconfirm(int id)
        {
            var product = _context.Products.Find(id);
            //if (product != null)
            
                _context.Products.Remove(product);
                _context.SaveChanges();
            
            //_context.Products.Remove(obj);
            //_context.SaveChanges();
            return RedirectToAction("Index");
        }
        public IActionResult Privacy()
        {
            return View();
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
