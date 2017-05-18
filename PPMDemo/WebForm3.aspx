<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="PPMDemo.WebForm3" %>

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
            <h3>Create Planner</h3>
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
                        <asp:TextBox class="form-control" ID="EquipmentCode" runat="server"></asp:TextBox>


                        <ajaxToolkit:AutoCompleteExtender ID="EquipmentCode_AutoCompleteExtender" runat="server"
                            Enabled="true"
                            ServiceMethod="GetCompletionList"
                            MinimumPrefixLength="1"
                            CompletionInterval="1000" EnableCaching="false" CompletionSetCount="10"
                            TargetControlID="EquipmentCode">
                         
                    
                        </ajaxToolkit:AutoCompleteExtender>
                        
                          
                        </div>

                    
                    <div class="form-group">
                        <label for="exampleInputPassword1">Select Year</label>
                        <asp:DropDownList class="form-control" ID="YearsList" runat="server">
                            <asp:ListItem>2017</asp:ListItem>
                            <asp:ListItem>2018</asp:ListItem>
                            <asp:ListItem>2019</asp:ListItem>
                            <asp:ListItem>2020</asp:ListItem>
                            <asp:ListItem>2021</asp:ListItem>
                            <asp:ListItem>2022</asp:ListItem>
                            <asp:ListItem>2023</asp:ListItem>
                            <asp:ListItem>2024</asp:ListItem>
                            <asp:ListItem>2025</asp:ListItem>
                            
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label for="exampleInputPassword1">Select Frequency</label>
                        <asp:DropDownList class="form-control" ID="FrequencyList" runat="server">
                            <asp:ListItem Value="M">Monthly</asp:ListItem>
                            <asp:ListItem Value="W">Weekly</asp:ListItem>
                        </asp:DropDownList>
                    </div>


                    <div class="form-group">
                        <label for="exampleInputPassword1">Select checklist for the Monthly event</label>
                        <asp:DropDownList class="form-control" ID="MonthlyCheckList" runat="server" DataSourceID="SqlDataSource1" DataTextField="checklist_name" DataValueField="checklist_id">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PPMDemoConnectionString %>" SelectCommand="SELECT * FROM [Checklist] WHERE ([is_active] = @is_active)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="true" Name="is_active" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PPMDemoConnectionString %>" SelectCommand="SELECT * FROM [Equipment]"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Select checklist for the Semi-annual event</label>
                        <asp:DropDownList class="form-control" ID="SemiAnnualChecklist" runat="server" DataSourceID="SqlDataSource1" DataTextField="checklist_name" DataValueField="checklist_id">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Select checklist for the Annual event</label>
                        <asp:DropDownList class="form-control" ID="AnnualChecklist" runat="server" DataSourceID="SqlDataSource1" DataTextField="checklist_name" DataValueField="checklist_id">
                        </asp:DropDownList>
                    </div>


                    <div class="form-group">
                        <asp:Button class="btn btn-default" ID="BtnCreatePlanner" runat="server" Text="Create Planner" OnClick="BtnCreatePlanner_Click" />
                        <asp:Button ID="BtnShowPopup" Style="display: none" runat="server" Text="Button" />
                        <ajaxToolkit:ModalPopupExtender ID="BtnShowPopup_ModalPopupExtender" CancelControlID="btnNo" PopupControlID="pnlpopup" runat="server" BehaviorID="BtnShowPopup_ModalPopupExtender" DynamicServicePath="" TargetControlID="BtnShowPopup" BackgroundCssClass="modalBackground">
                        </ajaxToolkit:ModalPopupExtender>

                        <asp:Panel ID="pnlpopup" runat="server" CssClass="modalPopup"  Style="display: none">
                           
        <div>
            <p>
                <asp:Label ID="lblMessage" runat="server" />
            </p>
            
            <p style="text-align: center;">
                 <asp:Button ID="btnYes" Text="Yes" OnClick="btnYes_Click" runat="server"  />
                                        <asp:Button ID="btnNo" Text="No" runat="server"  />
            </p>
        </div>       
                        </asp:Panel>

                    </div>




                </div>
            </div>
        </div>
    </div>
</asp:Content>
