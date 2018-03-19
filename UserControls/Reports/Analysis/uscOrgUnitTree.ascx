<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscOrgUnitTree.ascx.cs" Inherits="HCM10.Web.UserControls.uscOrgUnitTree" %>
<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<table>
    <tr>
        <td>
            <dx:ASPxTextBox ID="txtSearch" runat="server" Width="170px"></dx:ASPxTextBox>
        </td>
        <td >
            &nbsp;&nbsp;
        </td>

        <td>
            <dx:ASPxButton ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"></dx:ASPxButton>
        </td>
    </tr>
</table>
<dx:ASPxTreeView ID="treeView" runat="server" ClientInstanceName="treeView" ShowTreeLines="true" AllowSelectNode="true">
</dx:ASPxTreeView>

