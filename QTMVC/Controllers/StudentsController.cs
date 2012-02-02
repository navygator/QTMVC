using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QTMVC.Models;

namespace QTMVC.Controllers
{
	public class StudentsController : Controller
	{
		//
		// GET: /Students/

		public ActionResult Index()
		{
			return View();
		}


		//
		// GET: /Students/

		public ActionResult Create(int groupId)
		{
			var student = new Student();
			var group = CourseGroup.Find(groupId); 
			ViewBag.Group = group;
			ViewBag.Insructor = group.Instructor;
			ViewBag.OrganizationId = new SelectList(Organization.All(), "Id", "Name");
			ViewBag.EmployeeId = new SelectList(Employee.FindByOrganization(-1));

			return View(student);
		}

		[HttpPost]
		public ActionResult Create(Student student)
		{
			if (ModelState.IsValid)
			{
				return RedirectToAction("Edit", "Groups", new { id=student.GroupId});
			}
			else
			{
				ViewBag.Group = student.Group;
				ViewBag.Insructor = student.Group.Instructor;
				ViewBag.OrganizationId = new SelectList(Organization.All(), "Id", "Name");
				ViewBag.EmployeeId = new SelectList(Employee.FindByOrganization(-1));
				return View(student);
			}
		}

		public JsonResult Employees(int organizationId, int groupId)
		{
			var json = Json(new SelectList(Employee.FindByOrganization(organizationId) , "Id", "Fio", 0), JsonRequestBehavior.AllowGet);
			return json;
		}
	}
}
;