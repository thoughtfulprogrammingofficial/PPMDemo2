<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="PPMDemo.WebForm5" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



     <div class="page-title">
        <div class="title_left">
            <h3>Pending Jobs</h3>
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

                <div class="x_content">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Select Equipment</label>
                        <asp:TextBox class="form-control" ID="EquipmentCode"  runat="server"></asp:TextBox>


                        <ajaxtoolkit:autocompleteextender ID="EquipmentCode_AutoCompleteExtender" runat="server"
                            Enabled="true"
                            
                            ServiceMethod="GetCompletionList"
                            MinimumPrefixLength="1"
                            CompletionInterval="1000" EnableCaching="false" CompletionSetCount="10"
                            TargetControlID="EquipmentCode">
                        </ajaxtoolkit:autocompleteextender>

                        
                    </div>
                    

                    <div class="form-group">
                        <asp:Button class="btn btn-default" ID="BtnViewPendingJobs" runat="server" Text="View Pending Jobs"  />
                    </div>




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
                    <div class="table-responsive">
&nbsp;<asp:GridView ID="GridView1" CssClass="table   table-bordered table-hover" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ppm_event_id" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="equipment_id" HeaderText="equipment_id" SortExpression="equipment_id" />
                                <asp:BoundField DataField="ppm_event_id" HeaderText="ppm_event_id" InsertVisible="False" ReadOnly="True" SortExpression="ppm_event_id" />
                                <asp:BoundField DataField="scheduled_week" HeaderText="scheduled_week" SortExpression="scheduled_week" />
                                <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" />
                                <asp:BoundField DataField="checklist_id" HeaderText="checklist_id" SortExpression="checklist_name" />
                                <asp:BoundField DataField="checklist_name" HeaderText="checklist_name" SortExpression="checklist_name" />
                                
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <div style="text-align:center">
                                        <asp:Button class="btn btn-default" ID="LinkButton1" runat="server" CausesValidation="false" CommandName="cmdViewCheckList" CommandArgument='<%#Eval("checklist_id")+","+ Eval("ppm_event_id")+","+Eval("equipment_id")%>' Text="View Checklist"></asp:Button>
                                            </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PPMDemoConnectionString %>" SelectCommand="GetEquipmentYearWisePendingJob" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="EquipmentCode" Name="equipment_id" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                        </div>

                </div>
            </div>
        </div>
    </div>




</asp:Content>
