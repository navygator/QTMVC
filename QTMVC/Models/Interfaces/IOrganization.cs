using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QTMVC.Models.Interfaces
{
	public class IOrganization
	{
		int Id { get; set; }
		string Name { get; set; }
		int INN { get; set; }
	}
}