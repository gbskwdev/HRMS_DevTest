<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="UscRptEmpAttendanceLog.ascx.cs" Inherits="HCM10.Web.UserControls.Reports.Analysis.TimeReport.UscRptEmpAttendanceLog" %>
<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v17.2.Web, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="dx" %>

<dx:ASPxCallbackPanel ID="ASPxCallbackPanel" CssClass="dxgvtbl" runat="server" ClientInstanceName="CallbackPanel">
    <PanelCollection>
        <dx:PanelContent runat="server">
            <table>
                <tr>
                    <td style="margin-left: 5px">From</td>
                    <td style="margin-left: 5px">To</td>
                </tr>

                <tr>
                    <td>
                        <dx:ASPxDateEdit ID="dtFrom" CssClass="dtFrom_analysis" ClientInstanceName="dtFrom" runat="server" Height="42px" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" AutoPostBack="false"></dx:ASPxDateEdit>
                    </td>
                    <td>
                        <dx:ASPxDateEdit ID="dtTo" CssClass="dtTo_analysis" ClientInstanceName="dtTo" runat="server" Height="42px" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" AutoPostBack="false"></dx:ASPxDateEdit>
                    </td>
                    <td>
                        <dx:ASPxButton ID="btnGet" CssClass="btnGet_analysis" ClientInstanceName="btnGetData" runat="server" OnClick="btnGet_Click">
                            <ClientSideEvents Click="function(s,e){ Set1CustomFilterParams(); }" />
                            <Image Height="24px" Url="~/Images/newdata.png" Width="24px"></Image>
                        </dx:ASPxButton>

                       <%-- <dx:ASPxButton CssClass="btnDrillUp_analysis" ID="btnDrillUp" runat="server" AutoPostBack="False">
                            <ClientSideEvents Click="function(s,e){ Set1CustomFilterParams(); CallbackPanel1.PerformCallback(0+'|prev'); }" />
                            <Image Height="24px" Url="~/Images/drillup3.png" Width="24px"></Image>
                        </dx:ASPxButton>

                        <dx:ASPxButton CssClass="btnExportToPDF_analysis" ID="btnShowCustomisation" runat="server" AutoPostBack="false">
                            <ClientSideEvents Click="ShowCustomisation_Click" />
                            <Image Height="24px" Url="~/Images/ColumnChooser2.png" Width="24px"></Image>
                        </dx:ASPxButton>

                        <dx:ASPxButton CssClass="btnExportToExcel_analysis" ID="btnExportToExcel" runat="server" OnClick="btnExportXlsx_Click">
                            <Image Height="24px" Url="~/Images/Excel3.png" Width="24px"></Image>
                        </dx:ASPxButton>--%>

                        <%--                        <dx:ASPxButton CssClass="btnExportToPDF_analysis" ID="btnExportToPDF" runat="server" OnClick="btnExportPDF_Click">
                            <Image Height="24px" Url="~/Images/PDF2.png" Width="24px"></Image>
                        </dx:ASPxButton>--%>
                    </td>
                </tr>
            </table>

            <br />


            <asp:Label ID="lblRecordsCount" CssClass="lblRecordsCount" runat="server"></asp:Label>
            <br />
            <br />

            <dx:ASPxGridView ID="ASPxGridView" runat="server" Theme="MetropolisBlue"
                EnableCallBacks="True" EnableViewState="false"
                EnableCallbackAnimation="false" ClientInstanceName="ASPxGridView" Settings-VerticalScrollBarStyle="Standard">
                <%--<ClientSideEvents BeginCallback="function(s,e){ Set1CustomFilterParams(); }" />--%>
                <SettingsCustomizationDialog Enabled="True" />
                <SettingsBehavior EnableCustomizationWindow="true" />
                <SettingsPager AlwaysShowPager="True"></SettingsPager>
                <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            </dx:ASPxGridView>

            <dx:ASPxGridViewExporter ID="gridExport1" runat="server" GridViewID="ASPxGridView"></dx:ASPxGridViewExporter>

            <br />
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>