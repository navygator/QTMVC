$(function () {
    $("#OrganizationId").change(function () {
        var selectedOrg = $(this).val();
        if (selectedOrg != null && selectedOrg != '') {
            $.getJSON('<%:Url.Action("Employees") %>', { organizationId: selectedOrg }, function (employees) {
                var employeeSelect = $('#EmployeeId');
                employeeSelect.empty();
                $.each(employees, function (index, employee) {
                    employeeSelect.append($('<option/>', {
                        value: employee.value,
                        text: employee.text
                    }));
                });
            });
        }
    });
});