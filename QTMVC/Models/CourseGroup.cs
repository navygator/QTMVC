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

		public static CourseGroup Find(int id)
		{
			var group = db.CourseGroups.Single(g => g.Id == id);
			return group;
		}

		public bool Save()
		{
			bool retVal = false;

			if (db.SaveChanges() > 0) retVal = true;

			return retVal;
		}
	}
}