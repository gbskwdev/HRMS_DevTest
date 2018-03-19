<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscTimeEngine.ascx.cs" Inherits="HCM10.Web.UserControls.uscTimeEngine" %>
<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:ScriptManager ID="scrpitmanager" runat="server">
</asp:ScriptManager>

<dx:ASPxTimer ID="timer1" Interval="5000" runat="server">
    <ClientSideEvents Tick="function(s,e){{ CallbackPanel.PerformCallback(); }}" />
</dx:ASPxTimer>
<table style="border-spacing: 10px;">
    <tr>
        <td>
            <dx:ASPxLabel ID="lblPayrollArea" runat="server" Text="Payroll Area"></dx:ASPxLabel>
        </td>
        <td colspan="2">
            <dx:ASPxComboBox ID="cmbPayrollArea" runat="server" CssClass="roundedBorders" Height="36px"></dx:ASPxComboBox>
        </td>

    </tr>
    <tr>
        <td>&nbsp;
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <dx:ASPxLabel ID="lblEmpCode" runat="server" Text="Employee Code"></dx:ASPxLabel>
        </td>
        <td colspan="2">
            <dx:ASPxTextBox ID="txtEmpCode" runat="server" CssClass="roundedBorders" Height="36px"></dx:ASPxTextBox>
        </td>
        <tr>
            <td>&nbsp;
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>

    <tr>

        <td>
            <dx:ASPxLabel ID="lblStartDate" runat="server" Text="Start Date"></dx:ASPxLabel>
        </td>
        <td colspan="2">
            <dx:ASPxDateEdit ID="dtstartDate" runat="server" Mask="dd/MM/yyyy" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" CssClass="roundedBorders" Height="36px" UseMaskAsDisplayFormat="true"></dx:ASPxDateEdit>
        </td>
    </tr>
    <tr>
        <td>&nbsp;
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <dx:ASPxLabel ID="lblEndDate" runat="server" Text="End Date"></dx:ASPxLabel>
        </td>
        <td colspan="2">
            <dx:ASPxDateEdit ID="dtEndDate" runat="server" Mask="dd/MM/yyyy" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" CssClass="roundedBorders" Height="36px" UseMaskAsDisplayFormat="true"></dx:ASPxDateEdit>
        </td>

    </tr>
    <tr>
        <td>&nbsp;
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>

   <%-- <tr>
        <td>
            <dx:ASPxCheckBox ID="chkTestRun" runat="server" Text="Test Run"></dx:ASPxCheckBox>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>

    </tr>--%>
    <tr>
        <td>&nbsp;
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>

<table style="border-spacing: 10px;">
    <tr>
        <td>
            <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server"
                ClientInstanceName="CallbackPanel1"
                OnCallback="ASPxCallbackPanel1_Callback">                
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <dx:ASPxButton ID="btnTimeEngine" runat="server" Text="Run Time Engine" AutoPostBack="false">
                            <ClientSideEvents Click="function(s,e){
         CallbackPanel1.PerformCallback('btnTimeEngine');
         }" />
                        </dx:ASPxButton>
                          <dx:ASPxButton ID="btnStopTimeEngine" runat="server" Text="Stop Time Engine" AutoPostBack="false">
                            <ClientSideEvents Click="function(s,e){
         CallbackPanel1.PerformCallback('btnStopTimeEngine');
         }" />
                        </dx:ASPxButton>
                          <dx:ASPxButton ID="btnClearStatus" runat="server" Text="Clear Status" AutoPostBack="false">
                            <ClientSideEvents Click="function(s,e){
         CallbackPanel1.PerformCallback('btnClearStatus');
         }" />
                        </dx:ASPxButton>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </td>
    </tr>
    <tr>
        <td>&nbsp;
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>

    <tr>
        <td colspan="3">
            <dx:ASPxCallbackPanel ID="ASPxCallbackPanel" runat="server"
                ClientInstanceName="CallbackPanel"
                OnCallback="ASPxCallbackPanel_Callback">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <table>
                            <tr>
                                <td colspan="3">
                                    <dx:ASPxLabel ID="lblStatus" runat="server" Text=""></dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="lblSummarySucc" runat="server" Text="Successfull Records"></dx:ASPxLabel>
                                </td>
                                <td>

                                    <dx:ASPxTextBox ID="txtSummarySuccess" runat="server" Text="" ReadOnly="true" CssClass="roundedBorders" Height="36px"></dx:ASPxTextBox>
                                </td>
                                <td>

                                    <dx:ASPxButton ID="btnSuccess" runat="server" Text="Show Details" AutoPostBack="false">
                                        <ClientSideEvents Click="function(s,e){
         CallbackPanelGrid.PerformCallback('btnSuccess');
         }" />
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="lblSummaryFailure" runat="server" Text="Failed Records"></dx:ASPxLabel>
                                </td>
                                <td>

                                    <dx:ASPxTextBox ID="txtSummaryFailed" runat="server" Text="" ReadOnly="true" CssClass="roundedBorders" Height="36px"></dx:ASPxTextBox>
                                </td>
                                <td>

                                    <dx:ASPxButton ID="btnFailed" runat="server" Text="Show Details" AutoPostBack="false">
                                        <ClientSideEvents Click="function(s,e){
         CallbackPanelGrid.PerformCallback('btnFailed');
         }" />
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="lblAll" runat="server" Text="All Records"></dx:ASPxLabel>
                                </td>
                                <td>

                                    <dx:ASPxTextBox ID="txtSummaryAll" runat="server" Text="" ReadOnly="true" CssClass="roundedBorders" Height="36px"></dx:ASPxTextBox>
                                </td>
                                <td>

                                    <dx:ASPxButton ID="btnAll" runat="server" Text="Show Details" AutoPostBack="false">
                                        <ClientSideEvents Click="function(s,e){
         CallbackPanelGrid.PerformCallback('btnAll');
         }" />
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </td>
    </tr>

    <tr>
        <td>&nbsp;
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>

</table>
<dx:ASPxCallbackPanel ID="ASPxCallbackPanelGrid" runat="server"
    ClientInstanceName="CallbackPanelGrid"
    OnCallback="ASPxCallbackPanelGrid_Callback">
    <PanelCollection>
        <dx:PanelContent runat="server">
            <dx:ASPxGridView ID="grid_Payroll" runat="server" Visible="false">

                <SettingsPager PageSize="15" Mode="ShowAllRecords">
                </SettingsPager>
                <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
                <Styles>
                    <RowHotTrack BackColor="#FFE5B3">
                    </RowHotTrack>
                    <AlternatingRow BackColor="#F0F3E2">
                    </AlternatingRow>
                </Styles>
            </dx:ASPxGridView>
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>

