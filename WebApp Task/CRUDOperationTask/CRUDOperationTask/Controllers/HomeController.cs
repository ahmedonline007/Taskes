using CRUDOperationTask.Models;
using CRUDOperationTask.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CRUDOperationTask.Controllers
{
    public class HomeController : Controller
    {
        private readonly IProductRepository _productRepository;

        public HomeController()
        {
            _productRepository = new ProductRepository(new InventoryEntities());
        }

        public HomeController(IProductRepository productRepository)
        {
            _productRepository = productRepository;
        }

        // GET: Home
        public ActionResult Index()
        {
            var product = _productRepository.GetProduct();
            return View(product);
        }

        public ActionResult Details(int id)
        {
            var product = _productRepository.GetProductById(id);
            return View(product);
        }

        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Product product)
        {
            if (ModelState.IsValid)
            {
                _productRepository.NewProduct(product);
                _productRepository.Save();
                return RedirectToAction("Index");
            }
            return View();
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var product = _productRepository.GetProductById(id);
            return View(product);
        }

        [HttpPost]
        public ActionResult Edit(Product product)
        {
            if (ModelState.IsValid)
            {
                _productRepository.UpdateProduct(product);
                _productRepository.Save();
                return RedirectToAction("Index", "Home");

            }
            else
            {
                return View(product);
            }
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            var employee = _productRepository.GetProductById(id);
            return View(employee);
        }

        [HttpPost]
        public ActionResult ConfirmDelete(int id)
        {
            _productRepository.DeleteProduct(id);
            _productRepository.Save();
            return RedirectToAction("Index", "Home");
        }
    }
}