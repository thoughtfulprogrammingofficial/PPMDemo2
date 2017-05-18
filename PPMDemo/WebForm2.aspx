<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="PPMDemo.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-title">
                        <div class="title_left">
                            <h3>Plain Page</h3>
                        </div>
                        <div class="title_right">
                            <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search for...">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button">Go!</button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Plain Page</h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li>
                                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li>
                                                    <a href="#">Settings 1</a>
                                                </li>
                                                <li>
                                                    <a href="#">Settings 2</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a class="close-link"><i class="fa fa-close"></i></a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="DataList1_ItemDataBound" Width="100%">
            <ItemTemplate>
               <div class="form-group">
                                     <h4>   <asp:Label ID="Label3" runat="server" Text='<%# Eval("Question_ID") %>'></asp:Label>
                                        <strong>)</strong>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Question_display_text") %>'></asp:Label></h4>
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                        </asp:RadioButtonList>
                         
                                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" >
                                        </asp:CheckBoxList>
                                        <asp:TextBox ID="TextBox1" runat="server"  CssClass="form-control" Width="90%"  Font-Bold="False" Rows="2" 
                                            TextMode="MultiLine"></asp:TextBox>
                            
                            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Answer_Type") %>' />
                   </div>
            </ItemTemplate>
                 <HeaderTemplate>
                            <asp:Label ID="Label4"  runat="server"  Text="Please answer the following survey questions :"></asp:Label>
                        </HeaderTemplate>
                        <FooterTemplate>
                            <asp:Button CssClass="btn btn-primary" ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click"  />
                        </FooterTemplate>




        </asp:DataList>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PPMDemoConnectionString %>" SelectCommand="SELECT * FROM [Checklist_Question] WHERE ([checklist_id] = @checklist_id)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="checklist_id" SessionField="ChecklistId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    
</asp:Content>
