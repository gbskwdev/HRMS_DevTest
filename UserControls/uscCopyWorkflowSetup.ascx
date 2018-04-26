<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscCopyWorkflowSetup.ascx.cs" Inherits="HCM10.Web.UserControls.uscCopyWorkflowSetup" %>
<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:ScriptManager ID="scrpitmanager" runat="server">
</asp:ScriptManager>

<script type="text/javascript">
    function OnEndCallBack(s, e) {
        if (s.cpIsUpdated) {
            //lblmsg.SetText();
            
            alert(document.getElementById('lblmsg').innerText);
            lblmsg.GetMainElement().style.backgroundColor = 'green';
            //lblmsg.GetMainElement().style.color = 'white';
            alert('Updated');
        }
        else {
            lblmsg.SetText('Error');
            alert('Unchanged');
        }
    }
</script>
<dx:ASPxCallbackPanel runat="server" ID="ASPxCallbackPanelSubmit" ClientInstanceName="CallbackPanel1" Enabled="true"
                OnCallback="ASPxCallbackPanel1_Callback" >
                <PanelCollection>
                        <dx:PanelContent>
<table style="border-spacing: 10px;">
    
    
    <tr>
        <td>
            <dx:ASPxLabel ID="lblSrcWorkflow" runat="server" Text="Source Workflow Request"></dx:ASPxLabel>
        </td>
        <td>:</td>
        <td>
            <dx:ASPxComboBox ID="ddsrcRequest" runat="server" OnCallback="ddsrcRequest_Callback">
            </dx:ASPxComboBox>            
        </td>
        </tr>
     <tr>  
        <td>
            <dx:ASPxLabel ID="lblRequestCode" runat="server" Text="Request Code"></dx:ASPxLabel>
        </td>
        <td>:</td>
        <td>
            <dx:ASPxTextBox ID="txtRequestCode" runat="server"></dx:ASPxTextBox>
        </td>
    </tr>
      <tr>  
        <td>
            <dx:ASPxLabel ID="lblRequestName" runat="server" Text="Request Name"></dx:ASPxLabel>
        </td>
        <td>:</td>
        <td>
            <dx:ASPxTextBox ID="txtRequestName" runat="server"></dx:ASPxTextBox>
        </td>
    </tr>
    <tr>
        <td colspan="2"></td>
        <td>
            
                              <dx:ASPxButton ID="btnSubmit" runat="server" Text ="Create" AutoPostBack="false">
                                 <ClientSideEvents Click="function(s,e){
           CallbackPanel1.PerformCallback('btnSubmit');           }" />
                              </dx:ASPxButton>
                              
        </td>
        <td>
         <%-- <dx:ASPxCallbackPanel runat="server" ID="ASPxCallbackPanel2" ClientInstanceName="CallbackPanel2"
               EndCallback="OnEndCallBack" >
                <PanelCollection>
                        <dx:PanelContent>--%>
                                <dx:ASPxLabel ID="lblmsg" runat="server" ForeColor="#FF6600" ></dx:ASPxLabel>
                       <%-- </dx:PanelContent>
                </PanelCollection>
          </dx:ASPxCallbackPanel>  
              --%>
        </td>
    </tr>
 </table>

                             </dx:PanelContent>
                </PanelCollection>                
            </dx:ASPxCallbackPanel>     

