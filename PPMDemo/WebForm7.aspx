<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="WebForm7.aspx.cs" Inherits="PPMDemo.WebForm7" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /*Modal Popup*/
.modalBackground {
    background-color: Gray;
    filter: alpha(opacity=70);
    opacity: 0.7;
}

.modalPopup {
    background-color: #ffffdd;
    border-width: 3px;
    border-style: solid;
    border-color: Gray;
    padding: 3px;
    width: 250px;
}

.modalPopup p {
    padding: 5px;
}


/*Popup Control*/
.popupControl {
    background-color: White;
    position: absolute;
    visibility: hidden;
}

    </style>

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
                        <label for="exampleInputPassword1">Select Year</label>
                        <asp:DropDownList class="form-control" ID="YearsList" runat="server">
                            <asp:ListItem>2017</asp:ListItem>
                            <asp:ListItem>2018</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <asp:Button class="btn btn-default" ID="BtnViewCompletedJobs" runat="server" Text="View Completed Jobs"  />
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
                    <h2>Completed Jobs</h2>
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
                                <asp:BoundField DataField="ppm_event_id" HeaderText="ppm_event_id" SortExpression="ppm_event_id" InsertVisible="False" ReadOnly="True" />
                                <asp:BoundField DataField="equipment_id" HeaderText="equipment_id" SortExpression="equipment_id" />
                                <asp:BoundField DataField="scheduled_week" HeaderText="scheduled_week" SortExpression="scheduled_week" />
                                <asp:BoundField DataField="scheduled_date" HeaderText="scheduled_date" SortExpression="scheduled_date" />
                                
                                <asp:BoundField DataField="actual_week" HeaderText="actual_week" SortExpression="actual_week" />
                                
                                <asp:BoundField DataField="job_completion_date" HeaderText="job_completion_date" SortExpression="job_completion_date" />
                                
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button runat="server" CssClass="btn btn-default" id="btnViewResponses" Text="View Responses" CommandArgument='<%#Eval("ppm_event_id")+","+Eval("equipment_id")+","+Eval("scheduled_week")+","+Eval("scheduled_date")+","+Eval("actual_week")+","+Eval("job_completion_date")%>' />
                                       

            





                

                                    </ItemTemplate>
                                    
                                </asp:TemplateField>
                                
                            </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PPMDemoConnectionString %>" SelectCommand="GetJobCompletionDetails" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="EquipmentCode" Name="equipment_id" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="YearsList" Name="year" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                        
                        </div>

                </div>
            </div>
        </div>

    </div>
                                
     
</asp:Content>
