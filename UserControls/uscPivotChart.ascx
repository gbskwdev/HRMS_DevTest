<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscPivotChart.ascx.cs" Inherits="HCM10.Web.UserControls.uscPivotChart" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v17.2.Web, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxcharts" %>
<%@ Register Assembly="DevExpress.XtraCharts.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="dxcharts" %>
<%@ Register Assembly="DevExpress.Charts.v17.2.Core, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Charts" TagPrefix="dxcharts" %>
<%@ Register Assembly="DevExpress.PivotGrid.v17.2.Core, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.PivotGrid" TagPrefix="dx" %>
<asp:ScriptManager ID="scrpitmanager" runat="server">

</asp:ScriptManager>
<asp:UpdatePanel ID="update1" runat="server"><ContentTemplate>
<input runat="server" id="ColumnIndex" type="hidden" enableviewstate="true" />
    <input runat="server" id="RowIndex" type="hidden" enableviewstate="true" /></ContentTemplate></asp:UpdatePanel>
<script type="text/javascript">
        function ShowDrillDown() {
            var mainElement = PivotGrid.GetMainElement();
            DrillDownWindow.ShowAtPos(ASPxClientUtils.GetAbsoluteX(mainElement), ASPxClientUtils.GetAbsoluteY(mainElement));
        }
    </script>
 <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server"
                ClientInstanceName="CallbackPanel"
                OnCallback="ASPxCallbackPanel_Callback">
                <PanelCollection>
                    <dx:PanelContent runat="server">
<dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server"  ClientInstanceName="PivotGrid"
     OnPreRender="ASPxPivotGrid_PreRender" >
     <Fields>
           <dx:PivotGridField FieldName="Department" ID="fieldEmployee0" Area="RowArea"
                        AreaIndex="0" Caption="Department" />
                    <dx:PivotGridField FieldName="Employee" ID="fieldEmployee1" Area="RowArea"
                        AreaIndex="1" Caption="Employee"   />
                    <dx:PivotGridField FieldName="Amount" ID="fieldAmount" Area="DataArea"
                        AreaIndex="0" Caption="Amount" />
                    <dx:PivotGridField FieldName="Code" ID="fieldCode" Area="FilterArea" AreaIndex="-1"
                        Caption="Code" />
         <dx:PivotGridField FieldName="BillingType" ID="fieldBillingType0" Area="ColumnArea" AreaIndex="0"
                      Caption="Billing Type" />
                    <dx:PivotGridField FieldName="WageType" ID="fieldBillingType1" Area="ColumnArea" AreaIndex="1"
                      Caption="Wage Type" />
                    <dx:PivotGridField FieldName="ForPeriod" ID="fieldForPeriod" Area="FilterArea" AreaIndex="-1"
                        Caption="ForPeriod" />
                  
                </Fields>
    <OptionsView HorizontalScrollBarMode="Auto" />
    <OptionsFilter NativeCheckBoxes="False" />
    <OptionsChartDataSource DataProvideMode="UseCustomSettings" />
    
  
</dx:ASPxPivotGrid>
                        <asp:UpdatePanel ID="update2" runat="server"><ContentTemplate>
                        <dx:ASPxPopupControl ID="ASPxPopupControl1" Modal="true" runat="server" Height="1px"
        AllowDragging="True" ClientInstanceName="DrillDownWindow" Left="200" Top="200"
        CloseAction="CloseButton" Width="153px" HeaderText="Drill Down Window">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridView"
                    OnCustomCallback="ASPxGridView1_CustomCallback">
                    <ClientSideEvents EndCallback="function(s, e) {
                            if( s.cpShowDrillDownWindow )
                                GridView.SetVisible(true);
                        }" />
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Department" FieldName="Department" VisibleIndex="0" />
                        <dx:GridViewDataTextColumn Caption="Employee" FieldName="Employee" VisibleIndex="1" />
                        <dx:GridViewDataTextColumn Caption="Amount" FieldName="Amount" VisibleIndex="2" />
                        <dx:GridViewDataTextColumn Caption="BillingType" FieldName="BillingType" VisibleIndex="3">
                            
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ForPeriod" FieldName="ForPeriod" VisibleIndex="4" />
                    </Columns>
                    <SettingsLoadingPanel Mode="ShowOnStatusBar" />
                    <Styles>
                        <Header ImageSpacing="5px" SortingImageSpacing="5px" />
                    </Styles>
                </dx:ASPxGridView>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
                            </ContentTemplate></asp:UpdatePanel>
 <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" ASPxPivotGridID="ASPxPivotGrid1" Visible="False" />
                        <dx:ASPxButton ID="btnExport" runat="server" Text="Export" AutoPostBack="true" OnClick="btnExport_Click"></dx:ASPxButton>
<dx:ASPxComboBox ID="ChartType" runat="server" 
    AutoPostBack="false" ValueType="System.String" Caption="Chart Type">
    <ClientSideEvents ValueChanged="function(s,e){
         CallbackPanelChart.PerformCallback();
         }" />
</dx:ASPxComboBox>
<dx:ASPxCheckBox ID="PointLabels" runat="server" Text="Show Point Labels"
   AutoPostBack="false"  Wrap="False">  <ClientSideEvents CheckedChanged="function(s,e){
         CallbackPanelChart.PerformCallback();
         }" /></dx:ASPxCheckBox>

                         </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
 <dx:ASPxCallbackPanel ID="ASPxCallbackPanelChart" runat="server"
                ClientInstanceName="CallbackPanelChart"
                OnCallback="ASPxCallbackPanelChart_Callback">
                <PanelCollection>
                    <dx:PanelContent runat="server">
<dxcharts:WebChartControl ID="WebChart" runat="server"  
     Height="450px" width="823px" SeriesDataMember="Series" CssClass="TopMargin">
    <Legend MaxHorizontalPercentage="80"></Legend>
    <SeriesTemplate ArgumentDataMember="Arguments" ValueDataMembersSerializable="Values">
        <ViewSerializable>
            <dxcharts:SideBySideBarSeriesView />
        </ViewSerializable>
        <LabelSerializable>
            <dxcharts:SideBySideBarSeriesLabel>
                <FillStyle>
                    <OptionsSerializable>
                        <dxcharts:SolidFillOptions />
                    </OptionsSerializable>
                </FillStyle>
                <PointOptionsSerializable>
                    <dxcharts:PointOptions />
                </PointOptionsSerializable>
            </dxcharts:SideBySideBarSeriesLabel>
        </LabelSerializable>
    </SeriesTemplate>
    <DiagramSerializable>
        <dxcharts:XYDiagram>
            <AxisX VisibleInPanesSerializable="-1">
                <Label Staggered="True" />
            </AxisX>
            <AxisY VisibleInPanesSerializable="-1">
            </AxisY>
        </dxcharts:XYDiagram>
    </DiagramSerializable>
    <FillStyle>
        <OptionsSerializable>
            <dxcharts:SolidFillOptions />
        </OptionsSerializable>
    </FillStyle>
    <Legend MaxHorizontalPercentage="80" />
    <BorderOptions Visibility="False"></BorderOptions>
</dxcharts:WebChartControl>
                             </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
<%--<script type="text/javascript">
    $(document).ready(function (s, e) {
        CallbackPanel.PerformCallback();
    });
</script>--%>