<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="WebApplication2.home" %>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title>
</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8"/> 
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style>
       ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
   overflow:hidden;
    background-color: #333;
    text-decoration:none;
    position:relative;


}

li {
    float: right;
    
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 5px 16px;
    margin-right:3vw;
    text-decoration: none;
    font-size:x-large;
            
           
        }

li a:hover {
    background-color: #111;
}
    
.logo
{
    float:left;
     display: block;
    color: white;
    text-align: center;
   
    margin-left:50px;
    font-size:xx-large;
    text-decoration: none;
}  
      
#divbody {
    
    background-repeat: no-repeat;
   
    background-position: top; 
    background-size:cover;
 background-image: url('images/society6.png');
    width:100%;
      
   
}
#Button1
{
     align-content:center;
     margin-left:3vw;
     border-radius:25px;
     border-width:5px;
     border:groove;
     padding:10px;
     padding-left:20px;
     padding-right:20px;
}
.login
{
    background-color:lightgrey ;
    padding:3vw;
    margin-left:70vw;
    margin-right:3vw;
    margin-top:5vw; 
    opacity:0.9;
    font-size:x-large;
    border-radius:20px;
    min-width:250px;

}
.footer
{
    margin-bottom:0;
    margin-top:1vw;
    text-align: center; 
    font-family: 'Comic Sans MS'; 
    font-size: xx-large; 
     
    
      
       display: block; 
    
}
.feature
{
  float:left;
  margin:6vw;
  border-radius:10px;
  padding:10px;


}


        @media screen and (max-width: 500px ) {
            .login {
                background-color: lightgrey;
                padding: 4vw;
                margin-left: 0vw;
                margin-right: 0vw;
                margin-top: 10vw;
                opacity: 0.9;
                font-size: medium;
                border-radius: 20px;
                width:100%;
            }
            
.logo
{
    float:none;
     display: block;
    color: white;
    text-align: center;
    
    margin-left:0px;
    font-size:larger;
    text-decoration: none;
}   
.size  
{
font-size:large;
text-align:center;

}       
  ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
   overflow:hidden;
    background-color: #333;
    text-decoration:none;
    position:relative;


}

li
{
  float:none;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 5px 16px;
    margin-right:1vw;
    text-decoration: none;
    font-size:medium;
}
    

   }
        @media screen and (max-width:1400px ) {
            .login {
                background-color: lightgrey;
                padding: 4vw;
                margin-left: 30vw;
                margin-right: 20vw;
                margin-top: 5vw;
                opacity: 0.9;
                font-size: x-large;
                border-radius: 20px;
                min-width: 250px;
            }
        }

        @media screen and (max-width:900px ) {
            .login {
                background-color: lightgrey;
                padding: 4vw;
                margin-left: 10vw;
                margin-right: 26vw;
                margin-top: 5vw;
                opacity: 0.9;
                font-size: x-large;
                border-radius: 20px;
                min-width: 250px;
            }

            li a {
                display: block;
                color: white;
                text-align: center;
                padding: 5px 10px;
                margin-right: 1vw;
                text-decoration: none;
                font-size: large;
            }
            .logo
{
    float:none;
     display: block;
    color: white;
    text-align: center;
    
    margin-left:0px;
    font-size:large;
    text-decoration: none;
}   
        }       
    </style>
</head>
<body id="divbody" runat="server" >
    <form id="form1" runat="server">
   <ul>
  <li class="logo" >Radio colony<sub class="size">Kingsway Camp</sub></li>
        
       
  <li><a class="active" href="#home" > <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CausesValidation="False">Sign Up</asp:LinkButton></a></li>
       
       <li><a href="#news"> <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" CausesValidation="False">Contact Us</asp:LinkButton></a></li>
  <li><a href="#contact"> <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" CausesValidation="False">Home</asp:LinkButton></a></li>
 
</ul>

       <div class="login ,container">
           

           <asp:Label ID="Label1" runat="server" Text="E-mail"></asp:Label><br />
           <asp:TextBox ID="txtusername" Placeholder="UserName" runat="server"></asp:TextBox>
           
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtusername" ErrorMessage="Email Reqd!!" ForeColor="Red"></asp:RequiredFieldValidator>                     
         
           <br />
         
           <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label><br />
           <asp:TextBox ID="txtpwd" Placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpwd" ErrorMessage="Password Reqd!!" ForeColor="Red"></asp:RequiredFieldValidator>
           <br /><br />
           <asp:Button ID="Button1" runat="server" Text="LOG IN" style="background-color:#8d8a8a;font-size:large" OnClick="Button1_Click"/>
           
       </div>   
   <div class="footer" >
        
        <div class="feature" style="background-color:#6bc9e6">
            Complaint Registration
        </div>
        <div class="feature" style="background-color:#b6ff00">
            24x7 connectivity
        </div>
        <div class="feature" style="background-color:#ead666">
            Events   
       </div>
    
   </div>

    </form>
</body>
 
</html>
