<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscBankFile.ascx.cs" Inherits="HCM10.Web.UserControls.uscBankFile" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<table style="border-spacing: 10px;">
    <tr>
        <td>
            <dx:ASPxLabel ID="lblPayrollArea" runat="server" Text="Payroll Area"></dx:ASPxLabel>
        </td>
        <td colspan="2">
            <dx:ASPxComboBox ID="cmbPayrollArea" runat="server" CssClass="roundedBorders" Height="35px">
                <ClientSideEvents SelectedIndexChanged="function(s,e){{ CallbackPanelPeriod.PerformCallback(); }}" />
            </dx:ASPxComboBox>
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
            <dx:ASPxTextBox ID="txtEmpCode" runat="server" CssClass="roundedBorders" Height="35px"></dx:ASPxTextBox>
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
            <dx:ASPxLabel ID="lblPayrollRunType" runat="server" Text="Run Type"></dx:ASPxLabel>
        </td>
        <td colspan="2">
            <dx:ASPxComboBox ID="cmbPayrollRunType" runat="server" CssClass="roundedBorders" Height="35px"></dx:ASPxComboBox>
        </td>
    </tr>    
    <tr>
        <td colspan="3">
            <dx:ASPxCallbackPanel ID="ASPxCallbackPanelPeriod" runat="server"
                ClientInstanceName="CallbackPanelPeriod"
                OnCallback="ASPxCallbackPanelPeriod_Callback">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <table>
                            <tr>
                                <td colspan="2">
                                    <dx:ASPxRadioButton ID="rdCurrent" runat="server" Text="Current Period" GroupName="Dt" Checked="true">
                                        <ClientSideEvents CheckedChanged="function(s,e){{ CallbackPanelPeriod.PerformCallback(); }}" />
                                    </dx:ASPxRadioButton>
                                </td>

                                <td>&nbsp;</td>
                            </tr>


                            <tr>
                                <td>
                                    <dx:ASPxRadioButton ID="rdOtherPeriod" runat="server" Text="Other Period" GroupName="Dt">
                                        <ClientSideEvents CheckedChanged="function(s,e){{ CallbackPanelPeriod.PerformCallback(); }}" />
                                    </dx:ASPxRadioButton>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtMonth" runat="server" Width="30px" CssClass="roundedBorders" Height="35px">
                                        <ClientSideEvents TextChanged="function(s,e){{ CallbackPanelPeriod.PerformCallback(); }}" />
                                    </dx:ASPxTextBox>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtyear" runat="server" Width="70px" CssClass="roundedBorders" Height="35px">
                                        <ClientSideEvents TextChanged="function(s,e){{ CallbackPanelPeriod.PerformCallback(); }}" />
                                    </dx:ASPxTextBox>
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
                                    <dx:ASPxLabel ID="lblStartDate" runat="server" Text="Start Date"></dx:ASPxLabel>
                                </td>
                                <td colspan="2">
                                    <dx:ASPxTextBox ID="txtStartDate" runat="server" ReadOnly="true" Mask="dd/MM/yyyy" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" CssClass="roundedBorders" Height="36px" UseMaskAsDisplayFormat="true"></dx:ASPxTextBox>
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
                                    <dx:ASPxTextBox ID="txtEndDate" runat="server" ReadOnly="true" Mask="dd/MM/yyyy" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" CssClass="roundedBorders" Height="36px" UseMaskAsDisplayFormat="true"></dx:ASPxTextBox>
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
<dx:ASPxLabel ID="lblPaymentBank" runat="server" Text="Payment Bank"></dx:ASPxLabel>
<dx:ASPxRadioButtonList ID="ctlPaymentBank" runat="server" RepeatDirection="Vertical">
    <%--<Items>
        <dx:ListEditItem Text="XLS" Value="XLS" />
        <dx:ListEditItem Text="CSV" Value="CSV" />
        <dx:ListEditItem Text="TXT" Value="TXT" />
    </Items>--%>
</dx:ASPxRadioButtonList>
<br />
<br />
<dx:ASPxButton ID="btnGenerate" runat="server" Height="50px" Text="Generate Bank File" Width="200px" OnClick="btnGenerate_Click">
</dx:ASPxButton>
<dx:ASPxGridView ID="grid" runat="server" Visible="False"></dx:ASPxGridView>
<br />
<dx:ASPxGridViewExporter ID="gridExport" runat="server" GridViewID="grid"></dx:ASPxGridViewExporter>
