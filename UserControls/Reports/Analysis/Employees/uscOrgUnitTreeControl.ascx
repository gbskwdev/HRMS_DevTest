<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscOrgUnitTreeControl.ascx.cs" Inherits="HCM10.Web.UserControls.Reports.Analysis.Employees.uscOrgUnitTreeControl" %>
<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<div style="text-align:center; margin:0 auto; width:50%">

    <table>
    <tr>
        <td>
            <dx:ASPxComboBox ID="cmbSearch" style="margin-left:80px;" runat="server" Width="170px" CssClass="roundedBorders"></dx:ASPxComboBox>
        </td>
        <td >
            &nbsp;&nbsp;
        </td>

        <td>
            <dx:ASPxButton ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"></dx:ASPxButton>
        </td>
    </tr>
</table>
<br />
    <br />
    <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server"
    ClientInstanceName="CallbackPanel1"
    OnCallback="ASPxCallbackPanel1_Callback" >
    <PanelCollection>
        <dx:PanelContent runat="server">
    <dx:ASPxGridView ID="gridManager" ClientInstanceName="gridManager" runat="server" 
        KeyFieldName="Code" Width="400px" EnableRowsCache="False" CssClass="maintable" ClientSideEvents-RowClick="function(s,e){
  CallbackPanel1.PerformCallback(s.GetRowKey(e.visibleIndex));
         }" >
       <%-- <Columns>
            <dx:GridViewDataColumn FieldName="FullName" VisibleIndex="1" />
            <dx:GridViewDataColumn FieldName="Code" VisibleIndex="2" />
            <dx:GridViewDataColumn FieldName="OrgUnit" VisibleIndex="3" />
            <dx:GridViewDataColumn FieldName="Nationality" VisibleIndex="4" />
            <dx:GridViewDataColumn FieldName="HireDate" VisibleIndex="5" />
        </Columns>--%>
        <SettingsPager PageSize="5" />
        <Templates>
            <DataRow>
                <div style="padding: 5px">
                    <table class="templateTable">
                        <tr>
                            <td class="imageCell" rowspan="5">
                                <dx:ASPxBinaryImage ID="ASPxBinaryImage1" runat="server" Value='<%# Eval("Photo") %>' Width="100%"  Height="100%"/>
                            </td>
                            
                            <td>
                                Code
                            </td>
                            <td class="value">
                                <dx:ASPxLabel ID="lblCode" runat="server" Text='<%# Eval("Code") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                FullName
                            </td>
                            <td class="value">
                                <dx:ASPxLabel ID="lblFullName" runat="server" Text='<%# Eval("FullName") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Org Unit
                            </td>
                            <td class="value" colspan="3">
                                <dx:ASPxLabel ID="lblOrgUnit" runat="server" Text='<%# Eval("OrgUnit") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Nationality
                            </td>
                            <td class="value">
                                <dx:ASPxLabel ID="lblNationality" runat="server" Text='<%# Eval("Nationality") %>' />
                            </td>
                            
                        </tr>
                        <tr>
                            <td>
                                Hire Date
                            </td>
                            <td class="value">
                                <dx:ASPxLabel ID="lblHireDate" runat="server" Text='<%# Eval("HireDate", "{0:d}") %>' />
                            </td>
                        </tr>
                      
                    </table>
                </div>
            </DataRow>
        </Templates>
    </dx:ASPxGridView>
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/downarrow.png" Width="5%"></asp:Image>
    <dx:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" 
        KeyFieldName="Code" Width="400px" EnableRowsCache="False"  CssClass="maintable"  ClientSideEvents-RowClick="function(s,e){
  CallbackPanel1.PerformCallback(s.GetRowKey(e.visibleIndex));
         }" >
        <%-- <Columns>
            <dx:GridViewDataColumn FieldName="FullName" VisibleIndex="1" />
            <dx:GridViewDataColumn FieldName="Code" VisibleIndex="2" />
            <dx:GridViewDataColumn FieldName="OrgUnit" VisibleIndex="3" />
            <dx:GridViewDataColumn FieldName="Nationality" VisibleIndex="4" />
            <dx:GridViewDataColumn FieldName="HireDate" VisibleIndex="5" />
        </Columns>--%>
        <SettingsPager PageSize="5" />
        <Templates>
            <DataRow>
                <div style="padding: 5px;border :0px;">
                    <table class="templateTable">
                        <tr>
                            <td class="imageCell" rowspan="5">
                                <dx:ASPxBinaryImage ID="ASPxBinaryImage1" runat="server" Value='<%# Eval("Photo") %>' Width="100%" Height="100%"/>
                            </td>
                            
                            <td>
                                Code
                            </td>
                            <td class="value">
                                <dx:ASPxLabel ID="lblCode" runat="server" Text='<%# Eval("Code") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                FullName
                            </td>
                            <td class="value">
                                <dx:ASPxLabel ID="lblFullName" runat="server" Text='<%# Eval("FullName") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Org Unit
                            </td>
                            <td class="value" colspan="3">
                                <dx:ASPxLabel ID="lblOrgUnit" runat="server" Text='<%# Eval("OrgUnit") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Nationality
                            </td>
                            <td class="value">
                                <dx:ASPxLabel ID="lblNationality" runat="server" Text='<%# Eval("Nationality") %>' />
                            </td>
                            
                        </tr>
                        <tr>
                            <td>
                                Hire Date
                            </td>
                            <td class="value">
                                <dx:ASPxLabel ID="lblHireDate" runat="server" Text='<%# Eval("HireDate", "{0:d}") %>' />
                            </td>
                        </tr>
                      
                    </table>
                </div>
            </DataRow>
        </Templates>
    </dx:ASPxGridView>
      <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/downarrow.png" Width="5%"></asp:Image><asp:Image ID="Image3" runat="server" ImageUrl="~/Images/downarrow.png" Width="5%"></asp:Image><asp:Image ID="Image4" runat="server" ImageUrl="~/Images/downarrow.png" Width="5%"></asp:Image>
     <dx:ASPxGridView ID="gridsubOrdinate" ClientInstanceName="gridsubOrdinate" runat="server" 
        KeyFieldName="Code" Width="400px" EnableRowsCache="False" CssClass="maintable"  ClientSideEvents-RowClick="function(s,e){
  CallbackPanel1.PerformCallback(s.GetRowKey(e.visibleIndex));
         }" >
         <%-- <Columns>
            <dx:GridViewDataColumn FieldName="FullName" VisibleIndex="1" />
            <dx:GridViewDataColumn FieldName="Code" VisibleIndex="2" />
            <dx:GridViewDataColumn FieldName="OrgUnit" VisibleIndex="3" />
            <dx:GridViewDataColumn FieldName="Nationality" VisibleIndex="4" />
            <dx:GridViewDataColumn FieldName="HireDate" VisibleIndex="5" />
        </Columns>--%>
        <SettingsPager PageSize="5" />
        <Templates>
            <DataRow>
                <div style="padding: 5px">
                    <table class="templateTable">
                        <tr>
                            <td class="imageCell" rowspan="5">
                                <dx:ASPxBinaryImage ID="ASPxBinaryImage1" runat="server" Value='<%# Eval("Photo") %>' Width="100%"  Height="100%"/>
                            </td>
                            
                            <td>
                                Code
                            </td>
                            <td class="value">
                                <dx:ASPxLabel ID="lblCode" runat="server" Text='<%# Eval("Code") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                FullName
                            </td>
                            <td class="value">
                                <dx:ASPxLabel ID="lblFullName" runat="server" Text='<%# Eval("FullName") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Org Unit
                            </td>
                            <td class="value" colspan="3">
                                <dx:ASPxLabel ID="lblOrgUnit" runat="server" Text='<%# Eval("OrgUnit") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Nationality
                            </td>
                            <td class="value">
                                <dx:ASPxLabel ID="lblNationality" runat="server" Text='<%# Eval("Nationality") %>' />
                            </td>
                            
                        </tr>
                        <tr>
                            <td>
                                Hire Date
                            </td>
                            <td class="value">
                                <dx:ASPxLabel ID="lblHireDate" runat="server" Text='<%# Eval("HireDate", "{0:d}") %>' />
                            </td>
                        </tr>
                      
                    </table>
                </div>
            </DataRow>
        </Templates>
    </dx:ASPxGridView>
   <%-- <dx:ASPxVerticalGrid ID="VerticalGrid" runat="server">
    <Rows>
        <dx:VerticalGridBinaryImageRow FieldName="Photo" Height="20"/>
        <dx:VerticalGridDataRow FieldName="Code" Caption="Code" >
            <Rows>
                <dx:VerticalGridDataRow FieldName="FullName" />
                <dx:VerticalGridDataRow FieldName="OrgUnit" />
                <dx:VerticalGridDataRow FieldName="Nationality" />
                <dx:VerticalGridDataRow FieldName="HireDate" />
            </Rows>
        </dx:VerticalGridDataRow>
      
    </Rows>
</dx:ASPxVerticalGrid>--%>
              </dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>
</div>
