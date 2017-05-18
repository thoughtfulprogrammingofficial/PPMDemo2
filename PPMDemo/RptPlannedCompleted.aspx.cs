using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace PPMDemo
{

    public partial class RptPlannedCompleted : System.Web.UI.Page
    {
        public List<int> WeekwisePlannedEventsList;
        public List<int> JobCompletionEventsList;


        public Utility uObj;
        public DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            uObj = new Utility();
            dt = uObj.GetDBDataIntoTable("GetPlannedVsCompletedReport '"+ Session["RptA4EqipmentID"].ToString() + "','"+ Session["RptA4Year"].ToString() + "'");
            
        }
    }
}