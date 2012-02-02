﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<QTMVC.Models.Student>"%>


<asp:Content ID="newTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Добавить студента
</asp:Content>

<asp:Content ID="newContent" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript">
    $(function () {
        $("#OrganizationId").change(function () {
            var selectedOrg = $(this).val();
            if (selectedOrg != null && selectedOrg != '') {
                $.getJSON('<%:Url.Action("Employees") %>', { organizationId: selectedOrg, groupId:  }, function (employees) {
                    var employeeSelect = $('#EmployeeId');
                    employeeSelect.empty();
                    $.each(employees, function (index, employee) {
                        employeeSelect.append($('<option/>', {
                            value: employee.Value,
                            text: employee.Text
                        }));
                    });
                });
            }
        });
    });
</script>

<h2>Добавить студента в учебную группу</h2>
<p><%: Html.MvcSiteMap().SiteMapPath() %></p>

<div class="editor-label">
    <%: Html.Label("GroupId", "Учебная группа:") %>
    <%: Html.Label("OrganizationId", "Организация:") %>
</div>
<div class="editor-label">
    <%: Html.Label("OrganizationId", "Организация:") %>
</div>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>Студент</legend>

        <div class="editor-label">
            <%: Html.Label("OrganizationId", "Организация:") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("OrganizationId", "Выберите организацию")%>
        </div>

        <div class="editor-label">
            <%: Html.Label("EmployeeId", "Сотрудник:")%>
            <%: Html.ValidationMessageFor(model => model.EmployeeId) %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("EmployeeId", "Выберите сотрудника") %>
        </div>

        <p>
            <input type="submit" value="Добавить студента в учебную группу" />
        </p>
    </fieldset>
<% } %>
</asp:Content>
