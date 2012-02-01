<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<QTMVC.Models.CourseGroup>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

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
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.Id }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
