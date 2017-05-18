<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="WebForm6.aspx.cs" Inherits="PPMDemo.WebForm6" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



     <div class="page-title">
        <div class="title_left">
            <h3>Planned Vs Completed (A4)</h3>
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
                        <asp:Button class="btn btn-default" ID="BtnViewReportA4" runat="server" Text="Generate Report" OnClick="BtnViewReportA4_Click"   />
                    </div>




                </div>
            </div>
        </div>
    </div>
    
    <div class="clearfix"></div>



</asp:Content>
