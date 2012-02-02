using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QTMVC.Models
{
	public class Student
	{
		private static CoursesContainer db = new CoursesContainer();

		public int GroupId
		{
			get
			{
				if (Employee != null) return Employee.Id;
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
				if (Group != null) return Group.Id;
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

			if (Employee != null && Group != null)
			{
				Group.Employees.Add(Employee);
				if (db.SaveChanges() == 1)
				{
					retVal = true;
				}
			}

			return retVal;
		}
	}
}