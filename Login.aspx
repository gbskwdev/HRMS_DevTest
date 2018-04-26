.<%@ Page Language="C#" AutoEventWireup="true" Inherits="LoginPage" EnableViewState="false" CodeBehind="Login.aspx.cs" %>

<%@ Register Assembly="DevExpress.ExpressApp.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.ExpressApp.Web.Templates.ActionContainers" TagPrefix="cc2" %>
<%@ Register Assembly="DevExpress.ExpressApp.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.ExpressApp.Web.Templates.Controls" TagPrefix="tc" %>
<%@ Register Assembly="DevExpress.ExpressApp.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.ExpressApp.Web.Controls" TagPrefix="cc4" %>
<%@ Register Assembly="DevExpress.ExpressApp.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.ExpressApp.Web.Templates" TagPrefix="cc3" %>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Logon</title>
    <link href="Contents/Styles/login.css" rel="stylesheet" />
</head>
<body class="Dialog LoginBody">
    <div class="logo_div">
        <img src="Images/GBS_LOGO.png" alt="GBS" />
    </div>

    <div id="PageContent" class="PageContent DialogPageContent">
        <form id="form1" runat="server">
            <cc4:ASPxProgressControl ID="ProgressControl" runat="server" />
            <div id="Content" runat="server" />
        </form>
    </div>

    <script>
        var test = $('.dxm-main > ul >li').attr("title");

        if (test == "الإنجليزية") {
            $('html').attr("dir", "rtl");

            $('.dxeTAR.dxeBase_XafTheme .dxichTextCellSys').css('padding', '5px 4px 4px 0');
            var captionValue = $('.Caption').text();
            var captionValue2 = $('.dxichTextCellSys> label').text();

            if (captionValue2 = "Use Active Directory") {
                $('.dxichTextCellSys> label').text("استخدم الدليل النشط");
            }
            if (captionValue = "User Name:") {
                $('.CardGroupContent .Item:nth-child(3) .Caption').text("اسم المستخدم:");
            }

            if (captionValue = "Password:") {
                $('.CardGroupContent .Item:nth-child(4) .Caption').text("كلمه السر:");
            }
        }
        if (test == "Arabic") {
            $('html').attr("dir", "ltr");
            $(".rhtCL > tbody > tr:first-child").css("display", "flex").css("flex-direction", "column-reverse");


        }
    </script>
</body>
</html>
