<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscRosterSchedule.ascx.cs" Inherits="HCM10.Web.UserControls.uscRosterSchedule" %>
<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<table>
    <tr>
        <td colspan="2">
            <asp:Label ID="lbl_msg" Font-Bold="True" ForeColor="Red" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr>
        <td>
            <dx:ASPxLabel ID="lblRosterDutySchedule" runat="server" Text="Roster Duty Schedule" >
            </dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtRosterDutySchedule" runat="server" TextMode="Password" CssClass="roundedBorders" Height="36px"></dx:ASPxTextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxLabel ID="lblMonthStart" runat="server" Text="Month Start (MMyyyy)" ></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtMonthStart" runat="server" TextMode="MMyyyy" CssClass="roundedBorders" Height="36px"></dx:ASPxTextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxLabel ID="lblMonthEnd" runat="server" Text="Month End (MMyyyy)" ></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtMonthEnd" runat="server" TextMode="MMyyyy" CssClass="roundedBorders" Height="36px"></dx:ASPxTextBox>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Button ID="btnGenerate" CssClass="dxbButton_XafTheme dxbButtonSys dxbTSys" style="background-color: transparent;" runat="server" OnClick="btnGenerate_Click" Text="Generate" Width="120px" Height="36px" />
    </tr>
</table>
