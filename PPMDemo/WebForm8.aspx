<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="WebForm8.aspx.cs" Inherits="PPMDemo.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




     <div class="page-title">
        <div class="title_left">
            <h3>Completed Jobs</h3>
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
    <div id="StatusDisplay" style="display: none" runat="server">
        <asp:Literal runat="server" ID="StatusMessage" />
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
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>

                

                    
                    <div class="form-group">
                        <label for="exampleInputEmail1">PPM Event ID: </label>
                        <label for="exampleInputEmail1"><%=Session["PPMEventId"] %></label>
                    </div>
                    
                        <div class="form-group">
                        <label for="exampleInputEmail1">Equipment ID: </label>
                        <label for="exampleInputEmail1"><%= Session["EquipmentId"] %></label>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Scheduled Week: </label>
                        <label for="exampleInputEmail1"><%= Session["SchedWeek"] %></label>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Scheduled Date: </label>
                        <label for="exampleInputEmail1"><%= Session["SchedDate"] %></label>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Actual Week: </label>
                        <label for="exampleInputEmail1"><%= Session["ActWeek"] %></label>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Actual Date</label>
                        <label for="exampleInputEmail1"><%= Session["ActDate"] %></label>
                    </div>
                    
      
                <div class="x_content">
                    
                    <div class="table-responsive">
&nbsp;<asp:GridView ID="GridView1" CssClass="table   table-bordered table-hover" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                            <Columns>
                                
                                <asp:BoundField DataField="question_display_text" HeaderText="question_display_text" SortExpression="question_display_text" />
                                <asp:BoundField DataField="option_text" HeaderText="option_text" SortExpression="option_text" />
                                <asp:BoundField DataField="response_description" HeaderText="response_description" SortExpression="response_description" />
                                
                            </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PPMDemoConnectionString %>" SelectCommand="GetEventWiseJobCompletionDetails" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="ppm_event_id" SessionField="PPMEventId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                        
                        </div>

                </div>











                </div>
            
        </div>
    </div>
    


    





            



</asp:Content>
