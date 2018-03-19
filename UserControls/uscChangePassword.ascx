<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscChangePassword.ascx.cs" Inherits="HCM10.Web.UserControls.uscChangePassword" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<link href="Contents/Styles/login.css" rel="stylesheet" />
 <div id="PageContent" >
        
     <dx:ASPxLabel ID="lblUser" runat="server" Text="Select User" Width="120px" Visible="false"
          ></dx:ASPxLabel>
   
      <dx:ASPxComboBox ID="cmbUser" ClientInstanceName="cmbUser" runat="server" CssClass="dxeEditArea_XafTheme" Width="170px" OnSelectedIndexChanged="cmbUser_SelectedIndexChanged" Visible="false">
            
         
        </dx:ASPxComboBox>
                      
     <br />
        <dx:ASPxLabel ID="Label1" runat="server" Text="Current password" Width="120px"
          ></dx:ASPxLabel>
        <dx:ASPxTextBox ID="txt_cpassword" runat="server" Password="True" Width="170px" ></dx:ASPxTextBox>

        <br />
         <dx:ASPxLabel ID="Label2" runat="server" Text="New password" Width="120px"
            ></dx:ASPxLabel>
        <dx:ASPxTextBox ID="txt_npassword" runat="server" Password="True" Width="170px"></dx:ASPxTextBox>
  
        <br />
       
         <dx:ASPxLabel ID="Label3" runat="server" Text="Confirm password" Width="120px"
            ></dx:ASPxLabel>

        <dx:ASPxTextBox ID="txt_ccpassword" runat="server" Password="True" Width="170px" ></dx:ASPxTextBox>   

  <br />
    <asp:Button ID="btn_update" runat="server"  onclick="btn_update_Click" Text="Update"  Width="120px"/>
      <br />
    <asp:Label ID="lbl_msg" Font-Bold="True" ForeColor="Red"  runat="server" Text=""></asp:Label>
     
    </div>