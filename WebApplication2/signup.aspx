<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="WebApplication2.WebForm1" MasterPageFile="~/Site1.Master" %>
<asp:Content ID="head" ContentPlaceHolderID="headcontent" runat="server">
    <style type="text/css">
.division
{
    background-color:lightgrey;
    margin-right:5vw;
    margin-left:5vw;
    opacity:0.9;
    height:100%;
    padding:30px;
    font-size:large;
}

.box
{
    float:left;
    margin-top:1vw;
    margin-left:10vw;
}
tr
{
    margin-bottom:100px;
}

td
{
    text-align:center;
    align-content:center;
    
    
}

        .auto-style1 {
            height: 30px;
        }


 </style>  
</asp:Content>

<asp:Content ID="main" ContentPlaceHolderID="maincontent" runat="server">
    
        <h1 style="text-align:center; text-decoration:underline">Registration form</h1>
        <div id="regform" runat="server" class="division">
            <table>
        <tr>
           <td> Full Name</td>
           <td> 
               
               <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* required" ForeColor="Red"/>
            </td>
            
        </tr>
        
       <tr><td><br /></td></tr>
      
            <tr>
                <td class="auto-style1"> Flat Type</td>
            <td class="auto-style1"><asp:TextBox ID="TextBox3" runat="server" ></asp:TextBox>   <br /></td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*required" ControlToValidate="TextBox3" ForeColor="Red"/></td>
                </tr>
                 <tr><td><br /></td></tr>
                <tr>
          <td>  Block Number</td>
           <td> <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox><br /></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*required" ControlToValidate="TextBox4" ForeColor="Red"/></td>
                    </tr>
                 <tr><td><br /></td></tr>

                <tr>
           <td > Flat Number</td>
           <td><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox><br /></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*required" ControlToValidate="TextBox5" ForeColor="Red" /></td>
        </tr>
     <tr><td><br /></td></tr>
        <tr>
           <td> Date of Birth</td>
           <td>
               <asp:TextBox ID="txtdob" runat="server"></asp:TextBox>
             <%--  <input type="date" id="date"/> --%> 
           </td>
            
        </tr>
                 <tr><td><br /></td></tr>
        <tr>
           <td> Mobile number</td>
          <td> <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td>
           <%-- <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="only numbers" ControlToValidate="TextBox6" ForeColor="Red" ValidationExpression="(0( \d|\d ))?\d\d \d\d(\d \d| \d\d )\d\d" /></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*required" ControlToValidate="TextBox6" ForeColor="Red" Display="Dynamic" /></td>
       --%> </tr>
                 <tr><td><br /></td></tr>
        <tr>
            <td>Email</td>
          
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="not valid" ControlToValidate="TextBox2" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" /></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*required" ControlToValidate="TextBox2" ForeColor="Red" /></td>
        </tr>
                 <tr><td><br /></td></tr>
        <tr>
           <td> Blood Group</td>
            <td><asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
            
        </tr>
                 <tr><td><br /></td></tr>
        <tr>
            <td>Office/Posting Place</td>
            <td><asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*required" ControlToValidate="TextBox8" ForeColor="Red" /></td>
        </tr>
                 <tr><td><br /></td></tr>
        <tr>
            <td>Designation</td>
           <td> <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*required" ControlToValidate="TextBox9" ForeColor="Red" /></td>
        </tr>
                 <tr><td><br /></td></tr>
        <tr>
           <td> Number of family members</td>
           <td> <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox></td>
            <td>
                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="*required" ControlToValidate="TextBox10" ForeColor="Red"/>--%></td>
       </tr>
                 <tr><td><br /></td></tr>
            <tr>
               <td> Password</td>
               <td> <asp:TextBox ID="TextBox12" runat="server" TextMode="Password"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*required" ControlToValidate="TextBox12" ForeColor="Red"/></td>
            </tr>
                 <tr><td><br /></td></tr>
        <tr>
            <td>Re-enter Password</td>
            <td>
                <asp:TextBox ID="TextBox11" runat="server" TextMode="Password"></asp:TextBox></td>
            <td>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="not same as password" ControlToCompare="TextBox12" ControlToValidate="TextBox11" ForeColor="Red" /></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*required" ControlToValidate="TextBox11" ForeColor="Red" /></td>
            </tr>
                 <tr><td><br /></td></tr>
            <tr>
                
           <td> Upload residential proof</td>
            <td><asp:FileUpload ID="FileUpload1" runat="server" /></td>
                <td>
                   <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*required" ControlToValidate="FileUpload1" ForeColor="Red" />--%></td>
        </tr>
                 <tr><td><br /></td></tr>
            <tr class="box">
           
                <td ><asp:Button ID="Button1" runat="server" Text="Submit" style="font-size:x-large;padding:1vw;border-radius:25px;" OnClick="Button1_Click"/></td>
            </tr>
            <tr class="box">
               <td > <asp:Button ID="Button2" runat="server" Text="Cancel" style="font-size:x-large;padding:1vw;border-radius:25px;" OnClick="Button2_Click"/></td>
            </tr>
    </table>
            </div>
    
</asp:Content>
