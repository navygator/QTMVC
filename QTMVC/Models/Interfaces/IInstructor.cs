using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QTMVC.Models.Interfaces
{
	public class IInstructor
	{
		int Id { get; set; }
		string Fio { get; set; }
		string EMail { get; set; }
	}
}