using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PPMDemo
{
    public partial class WebForm7 : System.Web.UI.Page
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
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
            Session["PPMEventId"] = commandArgs[0];
            Session["EquipmentId"] = commandArgs[1];
            Session["SchedWeek"] = commandArgs[2];
            Session["SchedDate"] = commandArgs[3];
            Session["ActWeek"] = commandArgs[4];
            Session["ActDate"] = commandArgs[5];


            Response.Redirect("WebForm8.aspx");
        }
    }
}