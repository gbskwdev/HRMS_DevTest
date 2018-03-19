<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscBasicSalaryRegister.ascx.cs" Inherits="HCM10.Web.UserControls.Reports.Analysis.PayrollReport.uscBasicSalaryRegister" %>
<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraCharts.v17.2.Web, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="dx" %>

<dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server"
    ClientInstanceName="CallbackPanel1"
    OnCallback="ASPxCallbackPanel1_Callback" ClientSideEvents-EndCallback="function(s,e){ CallbackPanel2.PerformCallback();}">
    <PanelCollection>
        <dx:PanelContent runat="server">
            <table>
                <tr>
                    <td>
                        <dx:ASPxDateEdit ID="dtFrom" CssClass="dtFrom_analysis" ClientInstanceName="dtFrom" runat="server" Height="42px" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
                    </td>
                    <td>
                        <dx:ASPxDateEdit ID="dtTo" CssClass="dtTo_analysis" ClientInstanceName="dtTo" runat="server" Height="42px" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
                    </td>
                    <td>
                        <dx:ASPxComboBox ID="cmbSearch" runat="server" Width="170px" CssClass="combo_analysis">
                            <ClearButton DisplayMode="OnHover"></ClearButton>
                        </dx:ASPxComboBox>
                    </td>
                    <td>
                        <dx:ASPxButton ID="btnGet" CssClass="btnGet_analysis" ClientInstanceName="btnGetData" runat="server" AutoPostBack="false">
                            <ClientSideEvents Click="function(s,e){ SetCustomFilterParamsLeave(); CallbackPanel1.PerformCallback(0+'|page'); }" />
                            <Image Height="24px" Url="~/Images/Newdata.png" Width="24px">
                            </Image>
                        </dx:ASPxButton>
                    </td>
                    <td>

                        <dx:ASPxButton ID="btnDrillUp" CssClass="btnDrillUp_analysis" runat="server" AutoPostBack="False">
                            <ClientSideEvents Click="function(s,e){SetCustomFilterParamsLeave();CallbackPanel1.PerformCallback(0+'|prev');}" />
                            <Image Height="24px" Url="~/Images/drillup3.png" Width="24px">
                            </Image>
                        </dx:ASPxButton>

                        <dx:ASPxButton CssClass="btnExportToPDF_analysis" ID="btnShowCustomisation" runat="server" AutoPostBack="false">
                            <ClientSideEvents Click="ShowCustomisation_Click" />
                            <Image Height="24px" Url="~/Images/ColumnChooser2.png" Width="24px"></Image>
                        </dx:ASPxButton>
                    </td>
                    <td>
                        <dx:ASPxButton ID="btnExportToExcel" CssClass="btnExportToExcel_analysis" runat="server" OnClick="btnExportXlsx_Click">
                            <Image Height="24px" Url="~/Images/excel3.png" Width="24px">
                            </Image>
                        </dx:ASPxButton>
                    </td>
<%--                    <td>
                        <dx:ASPxButton ID="btnExportToPDF" CssClass="btnExportToPDF_analysis" runat="server" OnClick="btnExportPDF_Click">
                            <Image Height="24px" Url="~/Images/PDF2.png" Width="24px">
                            </Image>
                        </dx:ASPxButton>
                    </td>--%>
                </tr>
            </table>
            <br />
            <div id="gridContainer" style="overflow: auto; visibility: hidden;">
                <dx:ASPxGridView ID="ASPxGridView1" ClientInstanceName="grid" runat="server" OnDataBinding="ASPxGridView1_DataBinding" EnableCallBacks="true"
                    EnableViewState="false" Width="100%" ClientSideEvents-EndCallback="function(s,e){CallbackPanel2.PerformCallback();}">
                    <ClientSideEvents BeginCallback="function(s,e){ SetCustomFilterParamsLeave();}" />
                    <ClientSideEvents Init="function(s,e){CallbackPanel2.PerformCallback();}" />
                    <ClientSideEvents Init="OnInit" EndCallback="OnEndCallback" />
                    <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                </dx:ASPxGridView>
                <dx:ASPxGridViewExporter ID="gridExport1" runat="server" GridViewID="ASPxGridView1"></dx:ASPxGridViewExporter>

            </div>
            <dx:ASPxGlobalEvents ID="ge" runat="server">
                <ClientSideEvents ControlsInitialized="OnControlsInitialized" />
            </dx:ASPxGlobalEvents>
            <br />
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>
<dx:ASPxCallbackPanel ID="ASPxCallbackPanel2" runat="server" ClientInstanceName="CallbackPanel2"
    OnCallback="ASPxCallbackPanel2_Callback">
    <PanelCollection>
        <dx:PanelContent>
            <dx:WebChartControl ID="WebChartControl1" runat="server" CrosshairEnabled="True" Height="200px" Width="600px">
                <Legend Name="Default Legend"></Legend>
            </dx:WebChartControl>
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>
