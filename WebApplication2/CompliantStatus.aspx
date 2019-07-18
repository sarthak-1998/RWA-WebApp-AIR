<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompliantStatus.aspx.cs" Inherits="WebApplication2.CompliantStatus" EnableEventValidation="false" Culture="en-GB" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8" />
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function MutExChkList(chk) {
            var chkList = chk.parentNode.parentNode.parentNode;
            var chks = chkList.getElementsByTagName("input");
            for (var i = 0; i < chks.length; i++) {
                if (chks[i] != chk && chk.checked) {
                    chks[i].checked = false;
                }
            }
        }
        function MouseEvents(objRef, evt) {
            if (evt.type == "mouseover") {
                objRef.style.cursor = 'default';
                objRef.style.backgroundColor = "red";
            }
            else {
                if (evt.type == "mouseout") objRef.style.backgroundColor = "#F7F7F7";
            }
        }
    </script>

    <style>
        .button0 {
            padding: 1vw;
            font-size: x-large;
            margin-left: 25vw;
            border-radius: 25px;
            background-color: #4cb2fb;
            color: white;
        }

        .drop {
            font-size: x-large;
            text-align: center;
            margin-top: 2vw;
        }

        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
            text-decoration: none;
            position: relative;
        }

        li {
            float: right;
        }

            li a {
                display: block;
                color: white;
                text-align: center;
                padding: 5px 16px;
                margin-right: 3vw;
                text-decoration: none;
                font-size: x-large;
                height: 44px;
            }

                li a:hover {
                    background-color: #111;
                }

        .logo {
            float: left;
            display: block;
            color: white;
            text-align: center;
            margin-left: 50px;
            font-size: xx-large;
            text-decoration: none;
        }

        #divbody {
            background-repeat: no-repeat;
            background-position: top;
            background-size: cover;
            background-image: url('images/society6.png');
            width: 100%;
        }

        .container1 {
            align-content: center;
            background-color: lightgrey;
            width: 96%;
            padding: 40px;
            text-align: center;
            align-content: center;
            align-self: center;
            margin: 2vw;
        }

        .container2 {
            background-color: darkgrey;
            width: 96%;
            padding: 40px;
            margin: 2vw;
        }

        .forward {
            text-align: center;
            margin: 5vw;
            opacity: 0.9;
        }
    </style>
</head>
<body id="divbody">
    <form id="form1" runat="server">
        <ul>
            <li class="logo">Radio colony<sub class="size">Kingsway Camp</sub></li>
            <li><a>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Log out</asp:LinkButton></a></li>
        </ul>
        <div class="drop">
            <asp:Label ID="Label1" runat="server" Text="Complaint Status" Style="margin-right: 2vw;"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" Style="font-size: x-large;" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
        </div>
        <div id="divcomgrd" runat="server" visible="true" class="container1">

            <asp:GridView ID="grdcomdetails" runat="server" AutoGenerateColumns="False" EmptyDataText="..No Records Found.." HorizontalAlign="Center"
                PageSize="20" ShowHeaderWhenEmpty="True" ToolTip="Complaints and their Status"
                OnPageIndexChanging="grdcomdetails_PageIndexChanging" OnRowDataBound="grdcomdetails_RowDataBound" OnSelectedIndexChanged="grdcomdetails_SelectedIndexChanged">
                <HeaderStyle BackColor="#0099FF" Font-Bold="True" ForeColor="Black" HorizontalAlign="Center" />
                <Columns>
                    <asp:TemplateField HeaderText="S.No.">
                        <ItemTemplate>
                            <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="description">
                        <ItemTemplate>
                            <asp:Label ID="lbldesc" runat="server" Text='<%#Eval("c_des") %>' />

                        </ItemTemplate>
                    </asp:TemplateField>
                    <%-- <asp:TemplateField HeaderText="officer">
                        <ItemTemplate>
                            <asp:Label ID="lblofc" runat="server" Text='<%#Eval("officer") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="remarks">
                        <ItemTemplate>
                            <asp:Label ID="lblrem" runat="server" Text='<%#Eval("remarks") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Date">
                        <ItemTemplate>
                            <asp:Label ID="lbldt" runat="server" Text='<%#Eval("DateStamp") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="status">
                        <ItemTemplate>
                            <asp:Label ID="lblsts" runat="server" CommandName="statusdetails" Font-Bold="true" Text='<%#Eval("comp_status_type") %>'></asp:Label>
                            <asp:Label ID="lblcompid" runat="server" Visible="false" Text='<%#Eval("comp_id") %>' />
                            <asp:Label ID="lbltrcomid" runat="server" Visible="false" Text='<%#Eval("tr_com_id") %>' />
                           
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Final Status">
                        <ItemTemplate>
                           
                            <asp:Label ID="lblfinal" runat="server" Visible="true" Text='<%#Eval("final") %>' />
                            <asp:Label ID="lblfinalstatus" runat="server" Visible="false" Text='<%#Eval("finalstatus") %>' />
                            <br />
                            Date:
                             <asp:Label ID="lblresolvedon" runat="server" Visible="true" Text='<%#Eval("resolvedon") %>' />
                            <br />
                            ResolvedBy:
                            <asp:Label ID="lblresolvedby" runat="server" Visible="true" Text='<%#Eval("resolvedby_offid") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div id="divresorfor" runat="server" visible="false" align="center" style="padding: 10px" class="container2">
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True" CellPadding="2"
                    CellSpacing="2" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged">
                    <asp:ListItem Value="1">Resolved</asp:ListItem>
                    <asp:ListItem Value="3">Forward</asp:ListItem>

                </asp:CheckBoxList>
            </div>
        </div>
        <div id="divsearch" runat="server" visible="false" align="center">
            <asp:Button ID="btnsearch" runat="server" Text="Search" CssClass="button0" />

        </div>

        <div id="divsubmit" runat="server" visible="false" align="center">

            <asp:Button ID="Button1" runat="server" Text="Submit Status" OnClick="Button1_Click" />
        </div>
        <div id="divforward" runat="server" visible="false " align="center">
            

            <asp:DropDownList ID="ddloftype" runat="server" align ="center" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Font-Size="Large"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="complaint type" ForeColor="Red" ControlToValidate="ddloftype"></asp:RequiredFieldValidator>
            <br />

            <asp:TextBox ID="TextBox1" runat="server" Style="height: 10vw; width: 20vw; background-color: lightgrey;" TextMode="MultiLine"></asp:TextBox>
            <br />
            <asp:Button ID="Button3" runat="server" Text="Forward" OnClick="Button3_Click" />
        </div>
    </form>
</body>
</html>
