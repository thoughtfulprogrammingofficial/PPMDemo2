using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PPMDemo
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        public Utility uObj;
        public DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!String.IsNullOrEmpty(  Request.QueryString[0].ToString()))
{
                Session["PPMEventId"] = Request.QueryString[0].ToString();
                uObj = new Utility();
                dt = uObj.GetDBDataIntoTable("GetJobCompletionDetailsByEventID " + Session["PPMEventId"].ToString() );
                Session["EquipmentId"] = dt.Rows[0][1];
                Session["SchedWeek"] = dt.Rows[0][3];
                Session["SchedDate"] = dt.Rows[0][6];
                Session["ActWeek"] = dt.Rows[0][5];
                Session["ActDate"] = dt.Rows[0][7];
            }
        }
    }
}