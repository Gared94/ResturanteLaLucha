using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Lucha.Controllers
{
    public class IniciarController : Controller
    {
        // GET: Iniciar
        public ActionResult Iniciar()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(Models.Users objUser)
        {
            if (ModelState.IsValid)
            {
                using (Models.RestauranteEntities2 db = new Models.RestauranteEntities2())
                {
                    var obj = db.Users.Where(a => a.Usuario.Equals(objUser.Usuario) && a.Password.Equals(objUser.Password)).FirstOrDefault();
                    if (obj != null)
                    {
                        Session["idUser"] = obj.idUser.ToString();
                        Session["Usuario"] = obj.Usuario.ToString();
                        return RedirectToAction("Index2", "Inciar");
                    }
                }
            }
            return View(objUser);
        }

        public ActionResult UserDashBoard()
        {
            if (Session["UserID"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Login");
            }
        }
    }
}