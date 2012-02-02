using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Objects;

namespace QTMVC.Models
{
	public partial class CourseGroup
	{
		private static CoursesContainer db = new CoursesContainer();

		public static List<CourseGroup> All()
		{
			return db.CourseGroups.ToList();
		}

		public static CourseGroup Find(int id)
		{
			var group = db.CourseGroups.First(g => g.Id == id);
			return group;
		}
	}
}