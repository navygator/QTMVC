<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<QTMVC.Models.CourseGroup>>" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Учебные группы
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">

<h2>Учебные группы</h2>

<p><%: Html.MvcSiteMap().SiteMapPath() %></p>
<table>
    <tr>
        <th>
            Название
        </th>
        <th>
            Преподаватель
        </th>
        <th>
            Количество студентов
        </th>
        <th>
        </th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Name) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Instructor.Fio) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Employees.Count) %>
        </td>
        <td>
            <%: Html.ActionLink("редактировать", "Edit", new { id=item.Id }) %>
        </td>
    </tr>
<% } %>

</table>
<p>
    <a href="<%: Url.Action("Create", "Groups") %>">
        <button class="link-button">Создать учебную группу</button>
    </a>
</p>

</asp:Content>
