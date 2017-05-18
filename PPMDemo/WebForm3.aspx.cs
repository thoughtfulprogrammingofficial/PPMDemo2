using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace PPMDemo
{
    public partial class WebForm3 : System.Web.UI.Page
    {

        Utility ut = null;
        String sqlCommand = "";

        DataTable dt = null;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnCreatePlanner_Click(object sender, EventArgs e)
        {

            sqlCommand = "select distinct equipment_id,from_year from PPM_Schedule where is_active=1 and from_year=" + YearsList.SelectedValue;
            int count = new Utility().GetDBDataIntoTable(sqlCommand).Rows.Count;
            if(count>0)
            {
                lblMessage.Text = "The PPM planner for "+EquipmentCode.Text +" already exists for the year "+YearsList.SelectedValue +". Do you still want to create a new planner?";
                BtnShowPopup_ModalPopupExtender.Show();
            }
            else
            {
                sqlCommand = "CreateEquipmentWisePPMPlanner '" + EquipmentCode.Text + "','" + YearsList.SelectedValue + "','" + YearsList.SelectedValue + "'," + MonthlyCheckList.SelectedValue + "," + SemiAnnualChecklist.SelectedValue + "," + AnnualChecklist.SelectedValue + ",'','','" + FrequencyList.SelectedValue + "'";
                //Response.Write(sqlCommand);
                ut = new Utility();
                bool result = ut.InsertUpdtDelDBData(sqlCommand);
                if (result == true)
                {
                    StatusDisplay.Attributes["class"] = "alert alert-success";
                    StatusDisplay.Style["display"] = "block";
                    StatusMessage.Text = "Planner was created successfully.";
                    //GridView1.DataBind();
                }
                else
                {

                    StatusDisplay.Attributes["class"] = "alert alert-danger";
                    StatusDisplay.Style["display"] = "block";
                    StatusMessage.Text = ut.ErrorMessage;
                    ut.ErrorMessage = "";
                }
            }
           
        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static string[] GetCompletionList(string prefixText, int count)
        {
            // Return matching movies  
            string[] expectedOutput = new Utility().GetDBDataIntoArray("select equipment_id from equipment where equipment_id like '%" + prefixText + "%'", "equipment_id");

            //manipulate no maching case
            string[] nullOutput = new string[] { "ERROR: No matching equipment found!" };

            return expectedOutput.Length != 0 ? expectedOutput : nullOutput;
            
        }

        

        

        protected void btnYes_Click(object sender, EventArgs e)
        {
            sqlCommand = "CreateEquipmentWisePPMPlanner '" + EquipmentCode.Text + "','" + YearsList.SelectedValue + "','" + YearsList.SelectedValue + "'," + MonthlyCheckList.SelectedValue + "," + SemiAnnualChecklist.SelectedValue + "," + AnnualChecklist.SelectedValue + ",'','','" + FrequencyList.SelectedValue + "'";
            //Response.Write(sqlCommand);
            ut = new Utility();
            bool result = ut.InsertUpdtDelDBData(sqlCommand);
            if (result == true)
            {
                StatusDisplay.Attributes["class"] = "alert alert-success";
                StatusDisplay.Style["display"] = "block";
                StatusMessage.Text = "Planner was created successfully.";
                //GridView1.DataBind();
            }
            else
            {

                StatusDisplay.Attributes["class"] = "alert alert-danger";
                StatusDisplay.Style["display"] = "block";
                StatusMessage.Text = ut.ErrorMessage;
                ut.ErrorMessage = "";
            }
        }

      
    }
}