<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="WebApplication2.contact"  %>
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
    padding: 0;
   overflow:hidden;
    background-color: #333;
    text-decoration:none;
    position:relative;
             margin-left: 0;
             margin-right: 0;
             margin-top: 0;
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
         #divbody {
             background-repeat: no-repeat;
             background-position: top;
             background-size: cover;
             background-image: url('images/society6.png');
             width: 100%;
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
.block
{
     background-color:lightgrey;
    
    margin:5vw;
    opacity:0.9;
    height:100%;
    padding:10px;
    font-size:x-large;
   display:block;
   border-radius:25px;
   
}
p{
    text-align:center;
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
            

  ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
   overflow:hidden;
    background-color: #333;
    text-decoration:none;
    position:relative;


}
  .size  
{
font-size:large;
text-align:center;

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
  

        @media screen and (max-width:900px ) {
           
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
        
       
  <li><a  href="#" > <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Sign Up</asp:LinkButton></a></li>
       
       <li><a href="#contact"> <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" >Contact Us</asp:LinkButton></a></li>
  <li><a href="#home"> <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" >Home</asp:LinkButton></a></li>
 
</ul>

    <div class="block">
        
<p>
    Name : <br />
    Phone number :<br />
    Email ID :<br />
    Designation<br />
    </p>
    <hr />
<p>
    Name : <br />
    Phone number :<br />
    Email ID :<br />
    Designation<br />
    </p>
    <hr />
        
        <p>
    Name : <br />
    Phone number :<br />
    Email ID :<br />
            Designation<br />
    </p>
     
  
    
    </div>
   </form>
</body>  
  </html>  