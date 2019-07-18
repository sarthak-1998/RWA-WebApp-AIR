<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="complaint.aspx.cs" Inherits="WebApplication2.login" MasterPageFile="~/Site1.Master"%>

<asp:Content ID="head" ContentPlaceHolderID="headcontent" runat="server">
    <style>
.div
{
     background-color:lightgrey;
    
    margin:2vw;
    opacity:0.9;
    height:100%;
    padding:10px;
    font-size:x-large;
    text-align:center;
}
.click
{
    font-size:xx-large;
    padding:1vw;
    margin-left:3vw;
    border-radius:25px;
}
.click1
{
    font-size:x-large;
    padding:1vw;
    margin-left:3vw;
    border-radius:25px;
}
#TextBox1
{
    height:500px;
    width:500px;
    
}

        @media screen and (max-width: 500px )
        {
            
.click
{
    font-size:x-large;
    padding:1vw;
    margin-left:3vw;
    margin-bottom:3vw;
    border-radius:25px;
}

.heading1
{
    font-size:x-large;
}
            }
        

    </style>
    </asp:Content>



<asp:Content ID="main" ContentPlaceHolderID="maincontent" runat="server">
    <div class="div">
        <asp:Button ID="Button1" CssClass="click" runat="server" Text="Pending Complaints" CausesValidation="False" />
        <asp:Button ID="Button2" CssClass="click" runat="server" Text="All Complaints" CausesValidation="False" OnClick="Button2_Click" />
        <h1 class="heading1" style="text-decoration:underline;margin-top:2vw;">Register Complaint</h1>
        <table style="width:90%; align-content:center;">
            <tr>
                <td style="align-content:flex-end; float:right">
Complaint Type:
                </td>
                <td >
                    <asp:DropDownList ID="ddlcomtype" runat="server" style="margin-left:2vw;" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"  Font-Size="Large"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="complaint type" ForeColor="Red" ControlToValidate="ddlcomtype"></asp:RequiredFieldValidator>
        
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
                </tr>
            
             <tr>
                <td  style="align-content:flex-end;">
    <asp:Label ID="Label1" runat="server" Text=" Description" style="padding-right:2vw;"></asp:Label>
                </td>
                <td >
                   <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Height="200" Width="350"></asp:TextBox>
            
<asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "TextBox1" ID="RegularExpressionValidator1" ValidationExpression = "^[\s\S]{0,350}$" runat="server" ErrorMessage="Maximum 350 characters allowed." ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox1" ErrorMessage="Description Reqd!!" ForeColor="Red"></asp:RequiredFieldValidator>
           
                </td>
            </tr>
        </table>
      
        
        <asp:Button ID="Button3" CssClass="click1" runat="server" Text="Register" OnClick="Button3_Click" />
        <asp:Button ID="Button4" CssClass="click1" runat="server" Text="Cancel" OnClick="Button4_Click" CausesValidation="False" />

    </div>
    </asp:Content>