using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PPMDemo
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("cmdViewCheckList"))
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });

                Session["ChecklistID"] = commandArgs[0];
                Session["EventID"] = commandArgs[1];
                Session["EqipmentID"] = commandArgs[2];
                Response.Redirect("WebForm2.aspx");
            }
        }
    }
}