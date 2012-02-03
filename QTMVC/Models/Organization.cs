using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QTMVC.Models
{
	public partial class Organization
	{
		private static CoursesContainer db = new CoursesContainer();

		public static List<Organization> All()
		{
			return db.Organizations.ToList();
		}

		public static Organization Find(int id)
		{
			var organization = db.Organizations.Single(o => o.Id == id);
			return organization;
		}
	}
}