<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<QTMVC.Models.CourseGroup>" %>

<asp:Content ID="createTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Создать учебную группу
</asp:Content>

<asp:Content ID="createContent" ContentPlaceHolderID="MainContent" runat="server">

<h2>Создать учебную группу</h2>
<p><%: Html.MvcSiteMap().SiteMapPath() %></p>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>Учебная группа</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.InstructorId, "Преподаватель") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("InstructorId", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.InstructorId) %>
        </div>


        <div class="editor-label">
            <%: Html.LabelFor(model => model.Name, "Название учебной группы") %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Name) %>
            <%: Html.ValidationMessageFor(model => model.Name) %>
        </div>

        <p>
            <input type="submit" value="Создать учебную группу" />
        </p>
    </fieldset>
<% } %>
</asp:Content>
