<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrgChartIFrame.aspx.cs" Inherits="HCM10.Web.OrgChartIFrame" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register src="UserControls\uscOrgChart.ascx" tagname="uscOrgChart" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <%--  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="http://www.getorgchart.com/GetOrgChart/getorgchart/getorgchart.js"></script>
    <link href="http://www.getorgchart.com/GetOrgChart/getorgchart/getorgchart.css" rel="stylesheet" />--%>
    <link href="Contents/Scripts/getorgchart.css" rel="stylesheet" />
  <script src="Contents/Scripts/jquery.min.js"></script>
    <script src="Contents/Scripts/getorgchart.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>   
     <uc1:uscOrgChart ID="uscOrgChart1" runat="server" />
    </div>
       <dx:ASPxLabel ID="UserName" runat="server" ClientIDMode="Static" ClientInstanceName="UserName" ClientVisible="false" ></dx:ASPxLabel>
    </form>
    <script type="text/javascript">
        var readUrl = "WebServices/OrgControlServices.asmx/Read";
        
      
        $.getJSON(readUrl, function (readUrl) {
           
            var peopleElement = document.getElementById("people");
     
            var orgChart = new getOrgChart(peopleElement, {
                theme: "sara",
                linkType: "B",
                expandToLevel: 2,
                scale: 0.5,
                primaryFields: ["Name", "JobTitle","Department","Mobile"],
                photoFields: ["PhotoUrl"],
                idField: "Id",
                enableEdit: false,
                enableDetailsView: false,
                secondParentIdField: "secondParenId",
                enableSearch: true,
                dataSource: readUrl
            });
          
            orgChart.highlightNode(UserName.GetText());
        });
      
    </script>
</body>
</html>
