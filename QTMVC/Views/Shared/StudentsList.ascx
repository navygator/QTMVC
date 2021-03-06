﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<QTMVC.Models.Employee>>" %>

<table>
    <tr>
        <th>
            Название
        </th>
        <th>
            Организация
        </th>
        <th>
        </th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Fio) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Organization.Name) %>
        </td>
        <td>
            <%: Html.ActionLink("удалить из группы", "Delete", "Students", new { groupId = ViewData["groupId"], Id=item.Id }, null) %>
        </td>
    </tr>
<% } %>

</table>
