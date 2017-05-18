using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PPMDemo
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        public List<int> WeekwisePlannedEventsList;
        public List<int> JobCompletionEventsList;
        public List<int> FirstDayOfTheWeekList;

        public Utility uObj;
        protected void Page_Load(object sender, EventArgs e)
        {
            uObj = new Utility();
//            JobCompletionEventsList = uObj.GetJobCompletionDetails(Session["RptA4EqipmentID"].ToString(), Session["RptA4Year"].ToString());
  //          WeekwisePlannedEventsList = uObj.GetEquipmentWisePPMEvents(Session["RptA4EqipmentID"].ToString(), Session["RptA4Year"].ToString());

            JobCompletionEventsList = uObj.GetJobCompletionDetails("EQ-A01", "2017");
            WeekwisePlannedEventsList = uObj.GetEquipmentWisePPMEvents("EQ-A01", "2017");
            FirstDayOfTheWeekList = uObj.GetDayOfTheWeekForPPMEvents("2017");

        }
    }
}