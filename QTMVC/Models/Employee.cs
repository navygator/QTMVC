using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QTMVC.Models
{
	public partial class Employee
	{
		private static CoursesContainer db = new CoursesContainer();

		public static List<Employee> All()
		{
			return db.Employees.ToList();
		}

		public static Employee Find(int id)
		{
			var employee = db.Employees.Single(e => e.Id == id);
			return employee;
		}

		public static List<Employee> FindByOrganization(int organizationId)
		{
			return db.Employees.Where(e => e.OrganizationId == organizationId).ToList();
		}
	}
}