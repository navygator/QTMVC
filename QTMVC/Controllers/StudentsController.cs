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
			student.GroupId = groupId;
			ViewBag.Instructor = student.Group.Instructor;
			ViewBag.OrganizationId = new SelectList(Organization.All(), "Id", "Name");
			ViewBag.EmployeeId = new SelectList(Employee.FindByOrganization(-1));

			return View(student);
		}

		[HttpPost]
		public ActionResult Create(Student student)
		{
			if (ModelState.IsValid && student.Save())
			{
				return RedirectToAction("Edit", "Groups", new { id=student.GroupId});
			}
			else
			{
				ViewBag.Group = student.Group;
				ViewBag.Instructor = student.Group.Instructor;
				ViewBag.OrganizationId = new SelectList(Organization.All(), "Id", "Name");
				ViewBag.EmployeeId = new SelectList(Employee.FindByOrganization(-1));
				return View(student);
			}
		}

		public ActionResult Delete(int groupId, int Id)
		{
			Student.Delete(groupId, Id);
			return RedirectToAction("Edit", "Groups", new { Id = groupId });
		}

		public JsonResult Employees(int organizationId, int groupId)
		{
			//var group = CourseGroup.Find(groupId);
			var employees = Employee.FindByOrganization(organizationId).Where(e => e.CourseGroups.All(g => g.Id != groupId));
			var json = Json(new SelectList(employees , "Id", "Fio", 0), JsonRequestBehavior.AllowGet);
			return json;
		}
	}
}
;