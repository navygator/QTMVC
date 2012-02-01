<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<QTMVC.Models.CourseGroup>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>CourseGroup</legend>

    <div class="display-label">Course</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Course.Name) %>
    </div>

    <div class="display-label">Instructor</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Instructor.Fio) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
