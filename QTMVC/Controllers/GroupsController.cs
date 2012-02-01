using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QTMVC.Models;

namespace QTMVC.Controllers
{ 
    public class GroupsController : Controller
    {
        private CoursesContainer db = new CoursesContainer();

        //
        // GET: /Groups/

        public ViewResult Index()
        {
            var coursegroups = db.CourseGroups.Include("Course").Include("Instructor").Include("Employees");
            return View(coursegroups.ToList());
        }

        //
        // GET: /Groups/Details/5

        public ViewResult Details(int id)
        {
            CourseGroup coursegroup = db.CourseGroups.Single(c => c.Id == id);
            return View(coursegroup);
        }

        //
        // GET: /Groups/Create

        public ActionResult Create()
        {
            ViewBag.CourseId = new SelectList(db.Courses, "Id", "Name");
            ViewBag.InstructorId = new SelectList(db.Instructors, "Id", "Fio");
            return View();
        } 

        //
        // POST: /Groups/Create

        [HttpPost]
        public ActionResult Create(CourseGroup coursegroup)
        {
            if (ModelState.IsValid)
            {
                db.CourseGroups.AddObject(coursegroup);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.CourseId = new SelectList(db.Courses, "Id", "Name", coursegroup.CourseId);
            ViewBag.InstructorId = new SelectList(db.Instructors, "Id", "Fio", coursegroup.InstructorId);
            return View(coursegroup);
        }
        
        //
        // GET: /Groups/Edit/5
 
        public ActionResult Edit(int id)
        {
            CourseGroup coursegroup = db.CourseGroups.Single(c => c.Id == id);
            ViewBag.CourseId = new SelectList(db.Courses, "Id", "Name", coursegroup.CourseId);
            ViewBag.InstructorId = new SelectList(db.Instructors, "Id", "Fio", coursegroup.InstructorId);
            return View(coursegroup);
        }

        //
        // POST: /Groups/Edit/5

        [HttpPost]
        public ActionResult Edit(CourseGroup coursegroup)
        {
            if (ModelState.IsValid)
            {
                db.CourseGroups.Attach(coursegroup);
                db.ObjectStateManager.ChangeObjectState(coursegroup, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CourseId = new SelectList(db.Courses, "Id", "Name", coursegroup.CourseId);
            ViewBag.InstructorId = new SelectList(db.Instructors, "Id", "Fio", coursegroup.InstructorId);
            return View(coursegroup);
        }

        //
        // GET: /Groups/Delete/5
 
        public ActionResult Delete(int id)
        {
            CourseGroup coursegroup = db.CourseGroups.Single(c => c.Id == id);
            return View(coursegroup);
        }

        //
        // POST: /Groups/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            CourseGroup coursegroup = db.CourseGroups.Single(c => c.Id == id);
            db.CourseGroups.DeleteObject(coursegroup);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}