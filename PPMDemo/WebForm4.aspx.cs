using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PPMDemo
{
    public partial class WebForm4 : System.Web.UI.Page
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

            //manipulate no matching case
            string[] nullOutput = new string[] { "ERROR: No matching equipment found!" };

            return expectedOutput.Length != 0 ? expectedOutput : nullOutput;

        }

    }
}