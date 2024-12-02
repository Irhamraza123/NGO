using NGO.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NGO.Controllers
{
    public class adminController : Controller
    {
        // GET: admin
        NGO_FoundationEntities9 db = new NGO_FoundationEntities9();
  
        [HttpGet]
        public ActionResult admin()
        {
            return View();
        }
        [HttpPost]
        public ActionResult admin(admin adm)
        {
            admin a = new admin();
            admin ad = db.admins.Where(x => x.a_name == adm.a_name && x.a_password == adm.a_password).SingleOrDefault();
            if (ad != null)
            {
                Session["a_id"] = ad.a_id;
                Session["a_name"] = ad.a_name;

                return RedirectToAction("adminPanel");
            }
            else
            {
                ViewBag.error = "Invalid User and Password";
            }
            return View();
        }
        public ActionResult adminPanel()
        {
            if (Session["a_id"] == null)
            {
                return RedirectToAction("admin");
            }
            TempData["Foundations"] = db.foundations.Count();
            TempData.Keep();

            TempData["Donations"] = db.donations.Count();
            TempData.Keep();


            TempData["Users"] = db.users.Count();
            TempData.Keep();
            

            TempData["Contact"] = db.contacts.Count();
            TempData.Keep();
            return View();
        }
        [HttpGet]
        public ActionResult add_foundations()
        {
            return View();
        }
        [HttpPost]
        public ActionResult add_foundations(foundation fdn)
        {
            foundation fd = new foundation();
            fd.n_name = fdn.n_name;
            fd.a_id_fk = Convert.ToInt32(Session["a_id"].ToString());

            db.foundations.Add(fd);
            db.SaveChanges();

            return RedirectToAction("admin");
        }
        public ActionResult view_foundations()
        {
            List<foundation> li = db.foundations.ToList();
            List<modelclass> m = li.Select(x => new modelclass
            {
                n_name = x.n_name,
                a_name = x.admin.a_name
            }).ToList();
            return View(m);

        }


        public ActionResult Logout()
        {
            Session.Abandon();
            Session.RemoveAll();

            return RedirectToAction("admin");

        }

        public ActionResult view_feedback()
        {
            List<contact> li = db.contacts.ToList();
            List<modelclass> cs = li.Select(x => new modelclass
            {
                c_name = x.c_name,
                c_email=x.c_email,
                c_phone=x.c_phone,
                c_feedback = x.c_feedback
            }).ToList();
            return View(cs);

        }
        public ActionResult View_users()
        {
            if (Session["a_id"] == null)
            {
                return RedirectToAction("admin");
            }
            List<user> li1 = db.users.ToList();
            return View(li1);
        }
        public ActionResult view_donation()
        {
            if (Session["a_id"] == null)
            {
                return RedirectToAction("admin");
            }
            List<donation> li2 = db.donations.ToList();
            List<modelclass> m = li2.Select(x => new modelclass
            {
                d_amount = x.d_amount,
                d_cause = x.d_cause,
                u_name = x.user.u_name,
                n_name = x.foundation.n_name
            }).ToList();
            return View(m);
        }

        
    }
}