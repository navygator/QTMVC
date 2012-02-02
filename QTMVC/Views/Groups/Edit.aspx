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
    <legend>Учебная группа</legend>
        <div class="editor-label">
            <%: 
                Html.LabelFor(model => model.InstructorId, "Преподаватель:")
            %>
        </div>

        <%: Html.HiddenFor(model => model.Id) %>

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
        <% Html.RenderPartial("StudentsList", Model.Employees); %>
    </fieldset>
<% } %>
<div>
    <a href="<%: Url.Action("Create", "Students", new { groupId=Model.Id }) %>">
        <button class="link-button">Добавить студента</button>
    </a>
</div>

</asp:Content>
