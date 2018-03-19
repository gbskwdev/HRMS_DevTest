<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscNews.ascx.cs" Inherits="HCM10.Web.UserControls.uscNews" %>
<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:ScriptManager ID="scrpitmanager" runat="server">
</asp:ScriptManager>
<dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server"
    ClientInstanceName="CallbackPanel1"
    OnCallback="ASPxCallbackPanel1_Callback" >
    <PanelCollection>
        <dx:PanelContent runat="server">
            <dx:ASPxSplitter ID="ASPxSplitter1" runat="server" Height="100%" Orientation="Vertical" ClientInstanceName="ASPxSplitter1">
                <Styles>
                    <Pane>
                        <Paddings Padding="0px" />
                    </Pane>
                </Styles>
                <Panes>
                    <dx:SplitterPane MinSize="120px" Size="30%" Name="listBoxContainer" ShowCollapseBackwardButton="false">
                        <ContentCollection>
                            <dx:SplitterContentControl runat="server">
                                <dx:ASPxLabel runat="server" ID="ASPxLabel1" ClientInstanceName="ASPxLabel1"  EncodeHtml="False" Text="<h3><strong>Latest News</strong></h3>">
                                </dx:ASPxLabel>
                                <hr />
                        
                                <dx:ASPxLabel runat="server" ID="lblOid" ClientInstanceName="lblOid"  EncodeHtml="False">
                                </dx:ASPxLabel> <div style="padding: 5px">
                                <dx:ASPxLabel runat="server" ID="lblDesc" ClientInstanceName="lblDesc"  EncodeHtml="False" CssClass="NewsFont" >
                                </dx:ASPxLabel></div>
                                <dx:ASPxLabel runat="server"  EncodeHtml="False"  id="lblHTML" ClientVisible="false">
                                </dx:ASPxLabel>
                            </dx:SplitterContentControl>
                        </ContentCollection>
                    </dx:SplitterPane>
                    <dx:SplitterPane  MinSize="270px"  >
                        <Panes>
                            <dx:SplitterPane Name="gridContainer" MinSize="200px">
                                <ContentCollection>
                                    <dx:SplitterContentControl runat="server">
                                        <dx:ASPxGridView runat="server" Width="100%"   ID="ASPxGridView1" ClientInstanceName="ASPxGridView1" EnableCallBacks="true" EnableViewState="false"
                                            AutoGenerateColumns="False" KeyFieldName="OID" ClientSideEvents-RowClick="function(s,e){
                                            SetCustomFilterParamsNews();
        // CallbackPanel1.PerformCallback('top|'+e.visibleIndex+ '|1');
         }">
                                            <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="270" ShowColumnHeaders="false" />
                                            <Border BorderWidth="0px"></Border>
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="OID" VisibleIndex="0" Visible="false">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>

                                                <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="1" Width="200px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="DocumentHtml" VisibleIndex="2 " Visible="false">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="IssueDate" VisibleIndex="2 " Visible="false">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsBehavior AllowFocusedRow="True" />
                                            <SettingsPager Mode="ShowAllRecords" />
                                            <SettingsBehavior AllowSelectByRowClick="true" />
                                             <Templates>
                                                <DataRow>
                                                    <div style="padding: 5px">
                                                        <table class="templateTable2">
                                                            <tr>                                                              
                                                               
                                                                <td colspan="3" class="NewsFont">
                                                                    <dx:ASPxLabel ID="lblDescription" runat="server" Text='<%# Eval("Description") %>' />
                                                                </td>
                                                                
                                                            </tr>
                                                            <tr>
                                                                <td  class="NewsFontSmall" >
                                                                    Date

                                                                </td>
                                                                <td class="NewsFontSmall" colspan="2">
                                                                    <dx:ASPxLabel ID="lblDate" runat="server" Text='<%# Eval("IssueDate") %>' />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </DataRow>
                                            </Templates>

                                        </dx:ASPxGridView>
                                    </dx:SplitterContentControl>
                                </ContentCollection>
                            </dx:SplitterPane>
                          <%--  <dx:SplitterPane Name="editorsContainer" Size="50%" MinSize="100px" ShowCollapseForwardButton="false">
                                <ContentCollection>
                                    <dx:SplitterContentControl runat="server">
                                        <dx:ASPxGridView runat="server" Width="100%" ID="ASPxGridView2" ClientInstanceName="ASPxGridView2" EnableCallBacks="true" EnableViewState="false"
                                            AutoGenerateColumns="False" KeyFieldName="OID" ClientSideEvents-RowClick="function(s,e){
                                            SetCustomFilterParamsNews();
         CallbackPanel1.PerformCallback('top|'+e.visibleIndex+'|2');
         }">
                                            <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="100" />
                                            <Border BorderWidth="0px"></Border>
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="OID" VisibleIndex="0" Visible="false">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>

                                                <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="DocumentHtml" VisibleIndex="2" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsBehavior AllowFocusedRow="True" />
                                            <SettingsPager Mode="ShowAllRecords" />
                                             <SettingsBehavior AllowSelectByRowClick="true" />
                                        </dx:ASPxGridView>
                                    </dx:SplitterContentControl>
                                </ContentCollection>
                            </dx:SplitterPane>--%>
                        </Panes>
                        <ContentCollection>
                            <dx:SplitterContentControl runat="server"></dx:SplitterContentControl>
                        </ContentCollection>
                    </dx:SplitterPane>
                </Panes>

            </dx:ASPxSplitter>
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>
