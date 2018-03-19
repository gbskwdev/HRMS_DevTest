<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscRptLoanByDept.ascx.cs" Inherits="HCM10.Web.UserControls.Reports.Analysis.Employees.uscRptLoanByDept" %>
<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraCharts.v17.2.Web, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="dx" %>

<dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" CssClass="dxgvtbl" runat="server" ClientInstanceName="CallbackPanel1" OnCallback="ASPxCallbackPanel1_Callback"
    ClientSideEvents-EndCallback="function(s,e){ CallbackPanel2.PerformCallback(); }">

    <ClientSideEvents EndCallback="function(s,e){ CallbackPanel2.PerformCallback(); }"></ClientSideEvents>
    <PanelCollection>
        <dx:PanelContent runat="server">
            <table>
                <tr>
                    <td style="margin-left: 5px">From</td>
                    <td style="margin-left: 5px">To</td>
                </tr>

                <tr>
                    <td>
                        <dx:ASPxDateEdit ID="dtFrom" CssClass="dtFrom_analysis" ClientInstanceName="dtFrom" runat="server" Height="42px" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
                    </td>
                    <td>
                        <dx:ASPxDateEdit ID="dtTo" CssClass="dtTo_analysis" ClientInstanceName="dtTo" runat="server" Height="42px" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
                    </td>
                    <td>
                        <dx:ASPxButton ID="btnGet" CssClass="btnGet_analysis" ClientInstanceName="btnGetData" runat="server" AutoPostBack="false">
                            <ClientSideEvents Click="function(s,e){ SetCustomFilterParamsLeave(); CallbackPanel1.PerformCallback(0+'|page'); }" />
                            <Image Height="24px" Url="~/Images/Newdata.png" Width="24px"></Image>
                        </dx:ASPxButton>

                        <dx:ASPxButton CssClass="btnDrillUp_analysis" ID="ASPxButton1" runat="server" AutoPostBack="False">
                            <ClientSideEvents Click="function(s,e){ SetCustomFilterParamsLeave(); CallbackPanel1.PerformCallback(0+'|prev'); }" />
                            <Image Height="24px" Url="~/Images/drillup3.png" Width="24px"></Image>
                        </dx:ASPxButton>

                        <dx:ASPxButton CssClass="btnExportToPDF_analysis" ID="btnShowCustomisation" runat="server" AutoPostBack="false">
                            <ClientSideEvents Click="ShowCustomisation_Click" />
                            <Image Height="24px" Url="~/Images/ColumnChooser2.png" Width="24px"></Image>
                        </dx:ASPxButton>

                        <dx:ASPxButton CssClass="btnExportToExcel_analysis" ID="ASPxButton2" runat="server" OnClick="btnExportXlsx_Click">
                            <Image Height="24px" Url="~/Images/Excel3.png" Width="24px"></Image>
                        </dx:ASPxButton>

<%--                        <dx:ASPxButton CssClass="btnExportToPDF_analysis" ID="ASPxButton3" runat="server" OnClick="btnExportPDF_Click">
                            <Image Height="24px" Url="~/Images/PDF2.png" Width="24px"></Image>
                        </dx:ASPxButton>--%>
                    </td>
                </tr>
            </table>

            <br />

            <asp:Label ID="lblRecordsCount" CssClass="lblRecordsCount" runat="server"></asp:Label>

            <br />
            <br />
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" Theme="MetropolisBlue" OnDataBinding="ASPxGridView1_DataBinding" EnableCallBacks="true" EnableViewState="false"
                ClientSideEvents-EndCallback="function(s,e){ CallbackPanel2.PerformCallback(); }">
                <SettingsPager AlwaysShowPager="True"></SettingsPager>
                <ClientSideEvents BeginCallback="function(s,e){ SetCustomFilterParamsLeave(); }" />
                <ClientSideEvents Init="function(s,e){ CallbackPanel2.PerformCallback(); }" />
                <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />

            </dx:ASPxGridView>

            <dx:ASPxGridViewExporter ID="gridExport1" runat="server" GridViewID="ASPxGridView1"></dx:ASPxGridViewExporter>

            <br />

        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>

<dx:ASPxCallbackPanel ID="ASPxCallbackPanel2" runat="server" ClientInstanceName="CallbackPanel2" OnCallback="ASPxCallbackPanel2_Callback">
    <PanelCollection>
        <dx:PanelContent>
            <dx:WebChartControl ID="WebChartControl1" runat="server" CrosshairEnabled="True" Height="200px" Width="600px">
                <Legend Name="Default Legend"></Legend>
            </dx:WebChartControl>
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>
