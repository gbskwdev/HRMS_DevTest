<%@ Page Language="C#" AutoEventWireup="true" Inherits="Default" EnableViewState="false" ValidateRequest="false" CodeBehind="Default.aspx.cs" %>

<%@ Register Assembly="DevExpress.Dashboard.v17.2.Web, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.ExpressApp.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.ExpressApp.Web.Templates" TagPrefix="cc3" %>
<%@ Register Assembly="DevExpress.ExpressApp.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.ExpressApp.Web.Controls" TagPrefix="cc4" %>
<%@ Register Assembly="DevExpress.Web.v17.2" Namespace="DevExpress.Web"
    TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.ExpressApp.Web.v17.2" Namespace="DevExpress.ExpressApp.Web.Templates.ActionContainers"
    TagPrefix="cc2" %>
<%@ Register Assembly="DevExpress.ExpressApp.Web.v17.2" Namespace="DevExpress.ExpressApp.Web.Templates.Controls"
    TagPrefix="tc" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Main Page</title>
    <meta http-equiv="Expires" content="0" />
    <%-- This Style is given for Employee Master Detail Form. - Shabbir 01-03-2018  --%>
    <!-- #region Employee-Master-Detail-Style -->
    <style>
        .centerMargin {
            margin: 0 auto !important;
            width: 30%;
        }

        .Employee_Column7 {
            padding-top: 2rem;
        }

            .Employee_Column7 .GroupContent {
                padding-top: 0.5rem !important;
            }

            .Employee_Column7 .GroupHeader {
                border-bottom: 1px solid lightgrey;
                margin-left: 10px;
                padding-bottom: 10px;
            }


        .Employee_Column6 {
            padding-top: 2rem;
        }

            .Employee_Column6 .GroupContent {
                padding-top: 0.5rem !important;
            }

            .Employee_Column6 .GroupHeader {
                border-bottom: 1px solid lightgrey;
                margin-left: 10px;
                padding-bottom: 10px;
            }

        .Employee_Column10 {
            padding-top: 2rem;
        }

            .Employee_Column10 .GroupContent {
                padding-top: 0.5rem !important;
            }

            .Employee_Column10 .GroupHeader {
                border-bottom: 1px solid lightgrey;
                margin-left: 10px;
                padding-bottom: 10px;
            }
    </style>
    <!-- #endregion -->

    <%-- Custom Filter For uscRpt by Shabbir on 13-05-2017 --%>

    <link href="Contents/Scripts/getorgchart.css" rel="stylesheet" />
    <script src="Contents/Scripts/UscRptCustomScript.js"></script>
    <script src="Contents/Scripts/getorgchart.js"></script>
    <%-- End of Custom Filter For uscRpt by Shabbir on 13-05-2017 
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>--%>
    <script src="Contents/Scripts/jquery.min.js"></script>

    <style type="text/css">
        #people {
            width: 100%;
            height: 100%;
        }

        .dxm-item.accountItem.dxm-subMenu .dx-vam {
            padding-left: 10px;
        }

        .dxm-item.accountItem.dxm-subMenu .dxm-image.dx-vam {
            border-radius: 32px;
            -moz-border-radius: 32px;
            -webkit-border-radius: 32px;
            padding-right: 0px !important;
            padding-left: 0px !important;
            max-height: 32px;
            max-width: 32px;
        }

        .mycell {
        }
    </style>
    <script type="text/javascript">
        function ShowCustomisation_Click(s, e) {

            if (ASPxGridView1.IsCustomizationWindowVisible())
                ASPxGridView1.HideCustomizationWindow();
            else
                ASPxGridView1.ShowCustomizationWindow();
        }

        function UscPayrollAnalysisByDeptOnSelectionChanged(s, e) {
            SetCustomFilterParams();
            CallbackPanel1.PerformCallback(e.visibleIndex + '|next');
        }

        function UscTimeAnalysisByDeptOnSelectionChanged(s, e) {
            SetCustomFilterParamsTime();
            CallbackPanel1.PerformCallback(e.visibleIndex + '|next');
        }

        function uscAnnualLeaveOnSelectionChanged(s, e) {
            SetCustomFilterParamsStatus();
            CallbackPanel1.PerformCallback(e.visibleIndex + '|next');
        }

        function uscTimeScheduleOnSelectionChanged(s, e) {
            SetCustomFilterParamsLeave();
            CallbackPanel1.PerformCallback(e.visibleIndex + '|next');
        }

        function SetCustomFilterParams() {
            var txtMonthValue = txtMonth.GetValue();
            var txtYearValue = txtYear.GetValue();
            ClientServerParams.Set("txtMonthValue", txtMonthValue);
            ClientServerParams.Set("txtYearValue", txtYearValue);
        }
        function SetLeavePlannerParams() {
            var cmbDepartmentVal = cmbDepartment.GetValue();

            var cmbEmployeeVal = cmbEmployee.GetValue();
            ClientServerParams.Set("cmbDepartment", cmbDepartmentVal);
            ClientServerParams.Set("cmbEmployee", cmbEmployeeVal);
        }

        function SetCustomFilterParamsLeave() {
            var dtFromValue = dtFrom.GetValue();
            var dtToValue = dtTo.GetValue();

            ClientServerParams.Set("dtFromValue", formatDate(dtFromValue));
            ClientServerParams.Set("dtToValue", formatDate(dtToValue));
        }
        function SetCustomFilterParamsTime() {
            var dtFromValue = dtFrom.GetValue();
            var dtToValue = dtTo.GetValue();

            ClientServerParams.Set("dtFromValue", formatDate(dtFromValue));
            ClientServerParams.Set("dtToValue", formatDate(dtToValue));
        }


        function SetCustomFilterParamsDocument() {
            var dtExpireUptoValue = dtExpireUpto.GetValue();


            ClientServerParams.Set("dtExpireUpto", formatDate(dtExpireUptoValue));

        }
        function uscDocumentfilterOnSelectionChanged(s, e) {
            SetCustomFilterParamsDocument();
            CallbackPanel1.PerformCallback(e.visibleIndex + '|next');
        }
        function SetCustomFilterParamsNews() {
            var oid = lblOid.GetValue();
            ClientServerParams.Set("Oid", oid);

        }

        function formatDate(date) {
            var d = new Date(date),
                month = '' + (d.getMonth() + 1),
                day = '' + d.getDate(),
                year = d.getFullYear();

            if (month.length < 2) month = '0' + month;
            if (day.length < 2) day = '0' + day;

            return [day, month, year].join('/');
        }

        function OnInit(s, e) {
            AdjustSize();
            document.getElementById("gridContainer").style.visibility = "";
        }

        function OnEndCallback(s, e) {
            AdjustSize();
        }
        function OnControlsInitialized(s, e) {
            ASPxClientUtils.AttachEventToElement(window, "resize", function (evt) {
                AdjustSize();
            });
        }
        function AdjustSize() {
            var Width = Math.max(200, document.documentElement.clientWidth);

            document.getElementById("gridContainer").style.width = (Width * 0.55).toString() + 'px';

        }

        var focusedCell;
        function onCellDoubleClick(ind, fieldName) {
            grid.PerformCallback(ind + "|" + fieldName);
        }
        //by mustafa, for popupeditclick.
        function onCellClick(ind, fieldName) {
            grid.PerformCallback(ind + "|" + fieldName);
        }
        //by adnan : this is for what ?
        //function onCellClick(index, fieldName) {
        //    if (focusedCell)
        //        focusedCell.style.backgroundColor = "white";
        //    var mainGrid = grid.GetMainElement();
        //    var allElements = mainGrid.getElementsByClassName("mycell");
        //    var matchingElements = [];
        //    for (var i = 0; i < allElements.length; i++) {
        //        var cell = allElements[i];
        //        if (cell.getAttribute("visibleIndex") == index) {
        //            matchingElements.push(cell);
        //        }
        //    }
        //    var cell;
        //    for (var i = 0; i < matchingElements.length; i++) {
        //        cell = matchingElements[i];
        //        if (cell.getAttribute("fieldName") == fieldName) {
        //            cell.style.backgroundColor = "wheat"
        //            focusedCell = cell;
        //            return;
        //        }
        //    }
        //}

    </script>
</head>
<body class="VerticalTemplate">
    <form id="form2" runat="server">
        <cc3:XafUpdatePanel ID="UPPopupWindowControl" runat="server">
            <cc4:XafPopupWindowControl runat="server" ID="PopupWindowControl" />
        </cc3:XafUpdatePanel>
        <cc4:ASPxProgressControl ID="ProgressControl" runat="server" />
        <div runat="server" id="Content" />
    </form>
    <script src="Contents/Scripts/site.js"></script>

</body>
</html>
