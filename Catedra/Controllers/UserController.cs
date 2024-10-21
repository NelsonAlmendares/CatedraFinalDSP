using Catedra.Data;
using Catedra.Models;
using Microsoft.AspNetCore.Mvc;

namespace Catedra.Controllers
{
    public class UserController : Controller
    {
        Usuario _userObj = new Usuario();

        public IActionResult List()
        {
            var ObjList = _userObj.Shown();
            return View(ObjList);
        }

        public IActionResult LogIn()
        {
            // Return the view with an initialized UsuariosModelo
            var model = new UsuariosModelo();
            return View(model);
        }

        // Para abrir sesiones
        [HttpPost]
        public IActionResult LogIn(string user, string pwd)
        {
            var ObjList = _userObj.LogIn(user, pwd);

            // Check if the login was successful (list should contain one user)
            if (ObjList.Count == 1)
            {
                return RedirectToAction("Dashboard", "Product");
            }
            else
            {
                // Invalid login
                ModelState.AddModelError("", "Invalid username or password.");
                return View(); // Return the view with the error
            }
        }

        // Para cerrar sesiones
        public IActionResult Logout() {
            // Clear the session or authentication cookies If using session
            // HttpContext.Session.Clear();
            // For authentication cookies, use HttpContext.SignOutAsync();

            // Redirect to login page
            return RedirectToAction("LogIn", "User");
        }

        [HttpGet]
        public IActionResult SaveData()
        {
            // Para crear la vista
            return View();
        }
        [HttpPost]
        // Actualizad Datos
        public IActionResult SaveData(UsuariosModelo PrSend)
        {
            // Validamos que el estado sea valido en el Modelo para poder mostrar los datos
            if (!ModelState.IsValid)
                return View();

            var response = _userObj.SaveData(PrSend);
            if (response)
            {
                return RedirectToAction("List");
            }
            else
            {
                return View();
            }
        }
    }
}
