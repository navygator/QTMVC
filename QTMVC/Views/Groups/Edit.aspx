<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<QTMVC.Models.CourseGroup>" %>

<asp:Content ID="editTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Редактировать учебнную группу
</asp:Content>

<asp:Content ID="editContent" ContentPlaceHolderID="MainContent" runat="server">

<h2>Редактировать учебнную группу</h2>
<p><%: Html.MvcSiteMap().SiteMapPath() %></p>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>CourseGroup</legend>

        <%: Html.HiddenFor(model => model.Id) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Instructor.Fio, "Преподаватель:")%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Name, "Название учебной группы") %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Name) %>
            <%: Html.ValidationMessageFor(model => model.Name) %>
        </div>

        <p>
            <input type="submit" value="Сохранить изменения" />
        </p>
    </fieldset>
<% } %>
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

<% foreach (var item in Model.Employees) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Fio) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Organization.Name) %>
        </td>
        <td>
            <%: Html.ActionLink("удалить из группы", "Delete", new { id=Model.Id, emplId=item.Id }) %>
        </td>
    </tr>
<% } %>

</table>

<div>
    <a href="<%: Url.Action("Create", "Groups") %>">
        <button>Добавить студента</button>
    </a>
</div>

</asp:Content>
