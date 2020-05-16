using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Lucha.Models;

namespace Lucha.Controllers
{
    public class Productos_PedidosController : Controller
    {
        private RestauranteEntities2 db = new RestauranteEntities2();

        // GET: Productos_Pedidos
        public ActionResult Index()
        {
            var productos_Pedidos = db.Productos_Pedidos.Include(p => p.Pedido).Include(p => p.Producto);
            return View(productos_Pedidos.ToList());
        }

        // GET: Productos_Pedidos/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Productos_Pedidos productos_Pedidos = db.Productos_Pedidos.Find(id);
            if (productos_Pedidos == null)
            {
                return HttpNotFound();
            }
            return View(productos_Pedidos);
        }

        // GET: Productos_Pedidos/Create
        public ActionResult Create()
        {
            ViewBag.IdPedido = new SelectList(db.Pedido, "ID", "Detalle");
            ViewBag.IDPRod = new SelectList(db.Producto, "IDPRod", "Nombre");
            return View();
        }

        // POST: Productos_Pedidos/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,IdPedido,IDPRod,Observacion,Cantidad")] Productos_Pedidos productos_Pedidos)
        {
            if (ModelState.IsValid)
            {
                db.Productos_Pedidos.Add(productos_Pedidos);
                db.SaveChanges();
                return RedirectToAction("Create");
            }

            ViewBag.IdPedido = new SelectList(db.Pedido, "ID", "Detalle", productos_Pedidos.IdPedido);
            ViewBag.IDPRod = new SelectList(db.Producto, "IDPRod", "Nombre", productos_Pedidos.IDPRod);
            return View(productos_Pedidos);
        }

        // GET: Productos_Pedidos/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Productos_Pedidos productos_Pedidos = db.Productos_Pedidos.Find(id);
            if (productos_Pedidos == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdPedido = new SelectList(db.Pedido, "ID", "Detalle", productos_Pedidos.IdPedido);
            ViewBag.IDPRod = new SelectList(db.Producto, "IDPRod", "Nombre", productos_Pedidos.IDPRod);
            return View(productos_Pedidos);
        }

        // POST: Productos_Pedidos/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,IdPedido,IDPRod,Observacion,Cantidad")] Productos_Pedidos productos_Pedidos)
        {
            if (ModelState.IsValid)
            {
                db.Entry(productos_Pedidos).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdPedido = new SelectList(db.Pedido, "ID", "Detalle", productos_Pedidos.IdPedido);
            ViewBag.IDPRod = new SelectList(db.Producto, "IDPRod", "Nombre", productos_Pedidos.IDPRod);
            return View(productos_Pedidos);
        }

        // GET: Productos_Pedidos/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Productos_Pedidos productos_Pedidos = db.Productos_Pedidos.Find(id);
            if (productos_Pedidos == null)
            {
                return HttpNotFound();
            }
            return View(productos_Pedidos);
        }

        // POST: Productos_Pedidos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Productos_Pedidos productos_Pedidos = db.Productos_Pedidos.Find(id);
            db.Productos_Pedidos.Remove(productos_Pedidos);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
