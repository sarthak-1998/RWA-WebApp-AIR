<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllComplaints.aspx.cs" Inherits="WebApplication2.AllComplaints" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="head" ContentPlaceHolderID="headcontent" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .div {
            background-color: lightgrey;
            margin: 2vw;
            opacity: 0.9;
            height: 100%;
            padding: 30px;
            font-size: x-large;
            text-align: center;
        }

        .click {
            font-size: xx-large;
            padding: 1vw;
            margin-left: 3vw;
            border-radius: 25px;
        }

        .click1 {
            font-size: x-large;
            padding: 1vw;
            margin-left: 3vw;
            border-radius: 25px;
        }
    </style>
</asp:Content>

<asp:Content ID="main" ContentPlaceHolderID="maincontent" runat="server">
    <asp:Button ID="Button1" runat="server" Text="Back" OnClick="Button1_Click" Style="text-align: center; padding: 2vw;
    margin: 3vw; font-size: xx-large; float: right; border-radius: 25px;" />
    <div id="divprimary" runat="server" visible="true">
        <br/><br/>
        <asp:GridView ID="grdcomdetails" runat="server" AutoGenerateColumns="False" EmptyDataText="..No Records Found.." HorizontalAlign="Center" PageSize="20"
            ShowHeaderWhenEmpty="True" ToolTip="Complaints and their Status" OnPageIndexChanging="grdcomdetails_PageIndexChanging" OnRowCommand="grdcomdetails_RowCommand"
            BackColor="#CCCCCC" Width="70%">
            <HeaderStyle BackColor="#0099FF" Font-Bold="True" ForeColor="Black" />
            <Columns>
                <asp:TemplateField HeaderText="S.No.">
                    <ItemTemplate>
                        <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Complaint-Type">
                    <ItemTemplate>
                        <asp:Label ID="lblcompfor" runat="server" Text='<%#Eval("compfor") %>' Font-Size="Smaller" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Complaint Description">
                    <ItemTemplate>
                        <asp:Label ID="lblcompdesc" runat="server" Text='<%#Eval("c_des") %>' Font-Size="Smaller" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Complaint registered On">
                    <ItemTemplate>
                        <asp:Label ID="lblregon" runat="server" Text='<%#Eval("comp_dt_create") %>' Font-Size="Smaller" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkstatus" CommandName="statusdetails" runat="server" Text='<%#Eval("comp_status_type") %>'
                            Font-Size="Smaller" class="btn btn-info btn-lg"></asp:LinkButton>
                        <asp:Label ID="lblcompid" runat="server" Text='<%#Eval("comp_id") %>' Visible="false"></asp:Label>


                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <div id="divsecondary" runat="server" visible="false">
        <br/><br/><br/>
        <asp:GridView ID="grd2" runat="server" AutoGenerateColumns="False" EmptyDataText="..No Records Found.." HorizontalAlign="Center" PageSize="20"
            ShowHeaderWhenEmpty="True" ToolTip="Detailed Status" OnPageIndexChanging="grdcomdetails_PageIndexChanging" OnRowCommand="grdcomdetails_RowCommand"
            BackColor="#CCCCCC" Width="70%">
            <HeaderStyle BackColor="#0099FF" Font-Bold="True" ForeColor="Black" />
            <Columns>
                <asp:TemplateField HeaderText="S.No.">
                    <ItemTemplate>
                        <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Complaint-Type">
                    <ItemTemplate>
                        <asp:Label ID="lblofficerid" runat="server" Text='<%#Eval("comp_id") %>' Font-Size="Smaller" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Officer ">
                    <ItemTemplate>
                        <asp:Label ID="lbloff" runat="server" Text='<%#Eval("officername") %>' Font-Size="Smaller" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Complaint forwarded to">
                    <ItemTemplate>
                        <asp:Label ID="lblcompforto" runat="server" Text='<%#Eval("forwardtowhom") %>' Font-Size="Smaller" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status flag ">
                    <ItemTemplate>                      
                        <asp:Label ID="lblstatus" runat="server" Text='<%#Eval("statusflag") %>' Visible="false"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="remarks ">
                    <ItemTemplate>
                        <asp:Label ID="lblremarks" runat="server" Text='<%#Eval("remarks") %>' Font-Size="Smaller" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="datestamp ">
                    <ItemTemplate>
                        <asp:Label ID="lblds" runat="server" Text='<%#Eval("DateStamp") %>' Font-Size="Smaller" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br/>

    <asp:Button ID="closedivs" runat="server" Text="close" Style="text-align: center; padding: 2vw;
    margin: 3vw; font-size: xx-large; float: right; border-radius: 25px; margin-top:50px; margin-right:400px; "   OnClick="closedivs_Click" />

    </div>
    <%--<!-- Modal -->
                    <div id="myModal" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">status info </h4>
                                </div>
                                <div class="modal-body">
                                    <
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>

                        </div>
                    </div>--%>
</asp:Content>



























