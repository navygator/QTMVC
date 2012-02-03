using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QTMVC.Models
{
	public class Student
	{
		private static CoursesContainer db = new CoursesContainer();

		public static bool Delete(int groupId, int employeeId)
		{
			bool retVal = false;

			var group = db.CourseGroups.First(g => g.Id == groupId);
			var employee = db.Employees.First(e => e.Id == employeeId); ;
			group.Employees.Remove(employee);

			if (db.SaveChanges() > 0) retVal = true;
			
			return retVal;
		}

		public int GroupId
		{
			get
			{
				if (Group != null) return Group.Id;
				else return -1;
			}
			set
			{
				Group = CourseGroup.Find(value);
			}
		}

		public int EmployeeId
		{
			get
			{
				if (Employee != null) return Employee.Id;
				else return -1;
			}
			set
			{
				Employee = Employee.Find(value);
			}
		}

		public CourseGroup Group
		{ 
			get; 
			set; 
		}

		public Employee Employee
		{
			get;
			set;
		}

		public bool Save()
		{
			bool retVal = false;
			// Создаем ссылки на объекты в одном контексте
			Employee = db.Employees.First(e => e.Id == EmployeeId);
			Group = db.CourseGroups.First(g => g.Id == GroupId);

			if (Employee != null && Group != null)
			{
				Group.Employees.Add(Employee);
				if (db.SaveChanges() > 0)
				{
					retVal = true;
				}
			}

			return retVal;
		}
	}
}