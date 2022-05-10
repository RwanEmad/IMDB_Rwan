using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMDB_Rwan.Models;
using System.Data.Entity;
using System.IO;

namespace IMDB_Rwan.Controllers
{
    public class movieController : Controller
    {


        private IMDbEntities db = new IMDbEntities();
    
     public ActionResult CreatMovie()
     {

         return View();
     }

     [HttpPost]
     public ActionResult CreatMovie(FormCollection form, HttpPostedFileBase photo)
     {

        Movy movie = new Movy();
         HttpPostedFileBase postedFile = Request.Files["photo"];
         string path = Server.MapPath("~/Uploads/");
         if (!Directory.Exists(path))
         {
             Directory.CreateDirectory(path);
         }
         postedFile.SaveAs(path + Path.GetFileName(postedFile.FileName));
         movie.name = form["name"].ToString();
         // movie.= form["name"].ToString();
         movie.Movie_images.image = "/Uploads/" + Path.GetFileName(postedFile.FileName);
         db.Movies.Add(movie);
         db.SaveChanges();
         return View();
     }

    }
}

