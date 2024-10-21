using Catedra.Data;
using Catedra.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Text.Json;


namespace Catedra.Controllers
{
    public class ProductController : Controller
    {
        // No lo hago de solo lectura porque los datos al ser actualizados mueren
        Producto _product = new Producto();

        // Metodo para listar los datos
        public IActionResult List()
        {
            var ObjList = _product.Shown();
            return View(ObjList);
        }

        public IActionResult Index()
        {
            // Render principal
            return View();
        }

        [HttpGet]
        public IActionResult SaveData() {
            // Para crear la vista
            return View();
        }        
        [HttpPost]
        // Actualizad Datos
        public IActionResult SaveData(ProductModelo PrSend) { 
            // Validamos que el estado sea valido en el Modelo para poder mostrar los datos
             if (!ModelState.IsValid)
                return View();

            var response = _product.SaveData(PrSend);
            if (response) {
                return RedirectToAction("List");
            } else {
                return View();
            }
        }


        public IActionResult UpdateData(int IdProduct) {

            var ObjProducto = _product.GetDataByID(IdProduct);
            return View(ObjProducto);

            // Se suponía que era para llenar datos pero F jajaja
            // var Country = _product.GetData;
            // ViewData["Paises"] = Country;
        }
        [HttpPost]
        public IActionResult UpdateData(ProductModelo PrSend)
        {
            if (!ModelState.IsValid)
                return View();

            var response = _product.UpdateData(PrSend);
            if (response) {
                return RedirectToAction("List");
            } else {
                return View();
            }
            // var Country = _product.GetData;
            // ViewData["Paises"] = Country;
        }


        [HttpGet]
        public IActionResult Delete(int IdProduct) {
            var ObjProducto = _product.GetDataByID(IdProduct);
            return View(ObjProducto);            
        }
        [HttpPost]
        public IActionResult Delete(ProductModelo PrSend) {
            // Validamos que el estado sea valido en el Modelo para poder mostrar los datos
            if (!ModelState.IsValid)
                return View();
            var response = _product.DeleteData(PrSend);
            if (response) {
                return RedirectToAction("List");
            }
            else {
                return View();
            }
        }


        // Nueva acción para mostrar el gráfico        
        public IActionResult Dashboard()
        {            
            // var user = await _userManager.GetUserAsync(User);
            // ViewBag.UserName = user?.UserName;

            Producto _product = new Producto();
            var productos = _product.ChartData1(); // Este es tu método para obtener los datos
            var ObjList = _product.Shown();

            // Verifica si los datos existen
            if (productos == null || !productos.Any())
            {
                Console.WriteLine("No se encontraron datos.");
            }

            var dataProductos = productos.Select(p => new { Titulo = p.DateAdded, Unidades = p.Cantidad }).ToList();

            // Serializar los datos a JSON
            ViewBag.DataProductos = JsonSerializer.Serialize(dataProductos, new JsonSerializerOptions { PropertyNamingPolicy = JsonNamingPolicy.CamelCase });

            return View(ObjList);
        }

    }
}
