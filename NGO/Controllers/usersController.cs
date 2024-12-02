using NGO.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace NGO.Controllers
{
    public class usersController : Controller
    {
        // GET: users
        NGO_FoundationEntities9 db = new NGO_FoundationEntities9();
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Register()
        {   
            return View();
        }

        [HttpPost]
        public ActionResult Register(user us)
        {
            user u = new user();
            u.u_name = us.u_name;
            u.u_email = us.u_email;
            u.u_password = us.u_password;
            u.u_phone = us.u_phone;
            u.u_address = us.u_address;
            u.u_city = us.u_city;

            db.users.Add(u);
            db.SaveChanges();

            return RedirectToAction("index");

        }
        public ActionResult user_login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult user_login(user usr)
        {

            user u = db.users.Where(x => x.u_name == usr.u_name && x.u_password == usr.u_password).SingleOrDefault();
            if (u != null)
            {
                Session["u_id"] = u.u_id;
                Session["u_name"] = u.u_name;

                return RedirectToAction("Index");
            }
            else
            {
                ViewBag.error = "Invalid User and Password";
            }
            return View();
        }
        public ActionResult Signout()
        {
            Session.Abandon();
            Session.RemoveAll();

            return RedirectToAction("Index");

        }
        [HttpGet]
        public ActionResult donation()
        {
            if (Session["u_id"]==null)
            {
                return RedirectToAction("user_login");
            }
            List<foundation> dep_list = db.foundations.ToList();
            ViewBag.f_list = new SelectList(dep_list, "n_id", "n_name");
            return View();
        }
        [HttpPost]
        public ActionResult donation(donation dtn)
        {
       
                List<foundation> dep_list = db.foundations.ToList();
                ViewBag.f_list = new SelectList(dep_list, "n_id", "n_name");

                donation d = new donation();

                d.d_amount = dtn.d_amount;
                d.d_cause = dtn.d_cause;
                d.u_id_fk = Convert.ToInt32(Session["u_id"].ToString());
                d.n_id_fk = dtn.n_id_fk;

                db.donations.Add(d);
                db.SaveChanges();

                return RedirectToAction("donation");

            }
        public ActionResult About()
        {
            return View();
        }
        public ActionResult Services()
        {
            return View();
        }
        public ActionResult Blog()
        {
            return View();
        }
        public ActionResult Contact()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Contact(contact cs)
        {
            contact c = new contact();
            c.c_name = cs.c_name;
            c.c_email = cs.c_email;
            c.c_phone = cs.c_phone;
            c.c_feedback = cs.c_feedback;

            db.contacts.Add(c);
            db.SaveChanges();

            return RedirectToAction("Index");

        }
        public ActionResult Gallery()
        {
            return View();
        }
        public ActionResult Donate()
        {
            return View();
        }

    }
}