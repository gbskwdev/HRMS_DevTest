<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscLeavePlanner.ascx.cs" Inherits="HCM10.Web.UserControls.uscLeavePlanner" ClientIDMode="Static" %>
<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.XtraScheduler.v17.2.Core, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraScheduler" tagprefix="cc1" %>

<div class="dxpnlControl_XafTheme GroupContent Adaptivity AdaptivityEditorContainer FirstEditorContainer" style="width: 50%; ">
    <div class="item">
        <dx:ASPxLabel ID="lblDepartment" runat="server" Text="Department" CssClass="Caption"></dx:ASPxLabel>
        <dx:ASPxComboBox ID="cmbDepartment" ClientInstanceName="cmbDepartment" runat="server" AutoPostBack="false" CssClass="dxeEditArea_XafTheme" Width="95%">
            <ClientSideEvents KeyDown="function(s, e) { 
        if(e.htmlEvent.keyCode == 46 /* Delete */);
            s.SetValue(null);
    }" />
            <ClientSideEvents SelectedIndexChanged="function(s, e) { SetLeavePlannerParams();CallbackPanelPeriod.PerformCallback();ASPxClientScheduler1.Refresh(); }" />
        </dx:ASPxComboBox>
    </div>
</div>

<div class="dxpnlControl_XafTheme GroupContent Adaptivity AdaptivityEditorContainer lastEditorContainer" style="width: 50%;padding-bottom: 10px;">
    <div class="item">
        <dx:ASPxLabel ID="lblEmployee" runat="server" Text="Employee" CssClass="Caption"></dx:ASPxLabel>
       <dx:ASPxCallbackPanel ID="ASPxCallbackPanelPeriod" runat="server"
                ClientInstanceName="CallbackPanelPeriod"
                OnCallback="ASPxCallbackPanelPeriod_Callback" 
           >
                <PanelCollection>
                    <dx:PanelContent runat="server">
        <dx:ASPxComboBox ID="cmbEmployee" ClientInstanceName="cmbEmployee" runat="server" AutoPostBack="false" CssClass="dxeEditArea_XafTheme" Width="95%" >
            <ClientSideEvents KeyDown="function(s, e) { 
        if(e.htmlEvent.keyCode == 46 /* Delete */);
            s.SetValue(null);
    }" />
            <ClientSideEvents SelectedIndexChanged="function(s, e) {SetLeavePlannerParams(); CallbackPanelPeriod.PerformCallback();ASPxClientScheduler1.Refresh();   }" />
        </dx:ASPxComboBox>
                  </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
    </div>

</div>
                    
<div class="dxpnlControl_XafTheme GroupContent Adaptivity AdaptivityEditorContainer FirstEditorContainer" style="width: 50%;">

    <div class="item">
        <dx:ASPxCheckBox ID="chkLeaveApprove" runat="server" Text="Show Actual Leave Approved" Checked="true" CssClass="Caption" OnCheckedChanged="chkLeaveApprove_CheckedChanged" ClientSideEvents-CheckedChanged="function(s, e) {ASPxClientScheduler1.Refresh();}">
        </dx:ASPxCheckBox>
    </div>
    <div class="item">
        <dx:ASPxCheckBox ID="chkLeaveUnapproved" runat="server" Text="Show Actual Leave Unapproved" Checked="false" CssClass="Caption" OnCheckedChanged="chkLeaveUnapproved_CheckedChanged" ClientSideEvents-CheckedChanged="function(s, e) {ASPxClientScheduler1.Refresh();}">
        </dx:ASPxCheckBox>
    </div>
    <div class="item">
        <dx:ASPxCheckBox ID="hideDateNavigator" runat="server" Text="Hide DateNavigator" Checked="false" CssClass="Caption" ClientSideEvents-CheckedChanged="function(s, e) {var obj = document.getElementById('NavigatorPanel');
                if(obj.style.display=='block')
                    obj.style.display='none';
                else
                    obj.style.display='block';
                }">
        </dx:ASPxCheckBox>
    </div>
</div>
<div class="dxpnlControl_XafTheme GroupContent Adaptivity AdaptivityEditorContainer lastEditorContainer" style="width: 50%; padding-bottom: 10px;">
    <div class="item">
        <dx:ASPxCheckBox ID="chkPlannedLeaveApprove" runat="server" Text="Show Leave Planner Approved" Checked="false" CssClass="Caption" OnCheckedChanged="chkPlannedLeaveApprove_CheckedChanged" ClientSideEvents-CheckedChanged="function(s, e) {ASPxClientScheduler1.Refresh();}">
        </dx:ASPxCheckBox>
    </div>
    <div class="item">
        <dx:ASPxCheckBox ID="chkPlannedLeaveUnApprove" runat="server" Text="Show Leave Planner Unapproved" Checked="false" CssClass="Caption" OnCheckedChanged="chkPlannedLeaveUnApprove_CheckedChanged" ClientSideEvents-CheckedChanged="function(s, e) {ASPxClientScheduler1.Refresh();}">
        </dx:ASPxCheckBox>
    </div>
</div>
<div id="NavigatorPanel" class="options" style="display: block;">

    <div class="options-item">
        <dx:ASPxDateNavigator runat="server" ID="ASPxDateNavigator1" MasterControlID="ASPxScheduler1" ClientIDMode="Static">
            <Properties Columns="2" DayNameFormat="FirstLetter" />
        </dx:ASPxDateNavigator>
    </div>

</div>


<dx:ASPxScheduler ID="ASPxScheduler1" ClientInstanceName="ASPxClientScheduler1" runat="server" GroupType="Resource" ActiveViewType="Month" OnAppointmentViewInfoCustomizing="ASPxScheduler1_AppointmentViewInfoCustomizing">
    <ResourceNavigator EnableIncreaseDecrease="false" />
    <Views>
        <DayView Enabled="true" />
        <WorkWeekView Enabled="false" />
        <WeekView Enabled="true" />
        <MonthView ResourcesPerPage="1">
            <AppointmentDisplayOptions StartTimeVisibility="Never" EndTimeVisibility="Never" StatusDisplayType="Bounds" ShowRecurrence="true" />
            <CellAutoHeightOptions MinHeight="160" MaxHeight="160" />
        </MonthView>
        <TimelineView Enabled="true" />
        <AgendaView Enabled="false" />
    </Views>
    <OptionsBehavior ShowViewSelector="true" />
    <Storage EnableReminders="false">
        <Appointments ResourceSharing="True">
            <Mappings
                AppointmentId="Oid"
                AllDay="AllDay"
                Description="Description"
                End="EndTime"
                Label="Label"
                Location="Location"
                RecurrenceInfo="RecurrenceInfo"
                ReminderInfo="ReminderInfo"
                ResourceId="firmId"
                Start="StartTime"
                Status="Status"
                Subject="Subject"
                Type="EventType" />
        </Appointments>
        <Resources>
            <Mappings
                ResourceId="ID"
                Caption="Model" />
        </Resources>
    </Storage>
</dx:ASPxScheduler>

<%--    <asp:SqlDataSource  
  ID="efAppointmentDataSource" 
  runat="server" 
  ConnectionString="<%$ ConnectionStrings:HCM10ConnectionString %>"
   SelectCommand=""/>
    <asp:SqlDataSource 
  ID="efResourceDataSource" 
  runat="server" 
  ConnectionString="<%$ ConnectionStrings:HCM10ConnectionString %>"
   SelectCommand="SELECT 1 as Id, 'Test' as Model " />--%>

<%-- <dx:ASPxFormLayout ID="OptionsFormLayout" runat="server">
        <Items>
            <dx:LayoutGroup Caption="Month View Options">
                <Items>
                    <dx:LayoutItem Caption="Week Count">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxComboBox ID="cbWeekCount" runat="server" ValueType="System.Int32" SelectedIndex="3">
                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { ASPxClientScheduler1.Refresh(); }" />
                                    <Items>
                                        <dx:ListEditItem Text="1" Value="1" />
                                        <dx:ListEditItem Text="2" Value="2" />
                                        <dx:ListEditItem Text="3" Value="3" />
                                        <dx:ListEditItem Text="4" Value="4" />
                                        <dx:ListEditItem Text="5" Value="5" />
                                        <dx:ListEditItem Text="6" Value="6" />
                                        <dx:ListEditItem Text="7" Value="7" />
                                        <dx:ListEditItem Text="8" Value="8" />
                                        <dx:ListEditItem Text="9" Value="9" />
                                        <dx:ListEditItem Text="10" Value="10" />
                                    </Items>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Show Weekend">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxCheckBox ID="chkShowWeekend" runat="server" Checked="True">
                                    <ClientSideEvents CheckedChanged="function(s, e) { ASPxClientScheduler1.Refresh(); }" />
                                </dx:ASPxCheckBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Compress Weekend">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxCheckBox ID="chkCompressWeekend" runat="server" Checked="True">
                                    <ClientSideEvents CheckedChanged="function(s, e) { ASPxClientScheduler1.Refresh(); }" />
                                </dx:ASPxCheckBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Show More Buttons">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxCheckBox ID="chkShowMoreButtons" runat="server" Checked="True">
                                    <ClientSideEvents CheckedChanged="function(s, e) { ASPxClientScheduler1.Refresh(); }" />
                                </dx:ASPxCheckBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Common options">
                <Items>
                    <dx:LayoutItem Caption="AppointmentSelection Appearance Mode">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxComboBox ID="SelectionAppearanceModeComboBox" runat="server" SelectedIndex="0" ValueType="System.Int32">
                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { ASPxClientScheduler1.Refresh(); }" />
                                    <Items>
                                        <dx:ListEditItem Text="Auto" Value="0" />
                                        <dx:ListEditItem Text="BackgroundOpacity" Value="1" />
                                        <dx:ListEditItem Text="BoundaryFrame" Value="2" />
                                    </Items>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Show View Navigator">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxCheckBox ID="ShowViewNavigatorCheckBox" runat="server" Checked="true">
                                    <ClientSideEvents CheckedChanged="function(s, e) { ASPxClientScheduler1.Refresh(); }" />
                                </dx:ASPxCheckBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Show View Visible Interval">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxCheckBox ID="ShowViewVisibleIntervalCheckBox" runat="server" Checked="true">
                                    <ClientSideEvents CheckedChanged="function(s, e) { ASPxClientScheduler1.Refresh(); }" />
                                </dx:ASPxCheckBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Highlight Selection Headers">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxCheckBox ID="HighlightSelectionCheckBox" runat="server" Checked="true">
                                    <ClientSideEvents CheckedChanged="function(s, e) { ASPxClientScheduler1.Refresh(); }" />
                                </dx:ASPxCheckBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
        </Items>
    </dx:ASPxFormLayout>--%>

  


