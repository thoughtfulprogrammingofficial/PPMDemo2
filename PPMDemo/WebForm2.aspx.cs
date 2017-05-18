using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace PPMDemo
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private DataSet GetDataSet(int id)
        {
            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["PPMDemoConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from [Questions_Options] where [question_id]=@id", cnn);
            SqlParameter p1 = new SqlParameter("@id", id);
            cmd.Parameters.Add(p1);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds, "choices");
            return ds;
        }

        private void SaveAnswer(int chklistID, int eventID, int questionID, int optionID, String responseDescription, int uId)
        {
            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["PPMDemoConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("insert into response([checklist_id],[ppm_event_id],[question_id],[option_id],[response_description],[user_id],[is_active]) values(@cid,@eid,@qid,@oid,@rdesc,@uid,1)", cnn);
            SqlParameter p1 = new SqlParameter("@cid", chklistID);
            SqlParameter p2 = new SqlParameter("@eid", eventID);
            SqlParameter p3 = new SqlParameter("@qid", questionID);
            SqlParameter p4 = new SqlParameter("@oid", optionID);
            SqlParameter p5 = new SqlParameter("@rdesc", responseDescription);
            SqlParameter p6 = new SqlParameter("@uid", uId);

            cmd.Parameters.Add(p1);
            cmd.Parameters.Add(p2);
            cmd.Parameters.Add(p3);
            cmd.Parameters.Add(p4);
            cmd.Parameters.Add(p5);
            cmd.Parameters.Add(p6);
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (((e.Item.ItemType == ListItemType.Item)
            || (e.Item.ItemType == ListItemType.AlternatingItem)))
            {
                HiddenField anstype = (HiddenField)e.Item.FindControl("HiddenField1");
                Label questionid = (Label)e.Item.FindControl("Label3");
                RadioButtonList rbl = (RadioButtonList)e.Item.FindControl("RadioButtonList1");
                CheckBoxList cbl = (CheckBoxList)e.Item.FindControl("CheckBoxList1");
                TextBox txt = (TextBox)e.Item.FindControl("TextBox1");
                DataSet ds = GetDataSet(Convert.ToInt32(questionid.Text));
                DataTable dt = ds.Tables[0];

                switch (anstype.Value)
                {
                    case "S":
                        rbl.Visible = true;
                        cbl.Visible = false;
                        txt.Visible = true;
                        rbl.DataSource = dt;
                        rbl.DataTextField = dt.Columns[2].ToString();
                        rbl.DataValueField = dt.Columns[0].ToString();
                        rbl.DataBind();
                        break;
                    case "M":
                        rbl.Visible = false;
                        cbl.Visible = true;
                        txt.Visible = true;
                        cbl.DataSource = ds;
                        cbl.DataTextField = "option_text";
                        cbl.DataValueField = "[option_id]";
                        cbl.DataBind();
                        break;
                    case "T":
                        rbl.Visible = false;
                        cbl.Visible = false;
                        txt.Visible = true;
                        break;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            foreach (DataListItem item in DataList1.Items)
            {
                if (item.ItemType == ListItemType.Item | item.ItemType == ListItemType.AlternatingItem)
                {
                    int questionid = 0;
                    int choiceid = 0;
                    string choicetext = "";
                    questionid = Convert.ToInt32(((Label)item.FindControl("Label3")).Text);
                    HiddenField anstype = (HiddenField)item.FindControl("HiddenField1");
                    switch (anstype.Value)
                    {
                        case "S":
                            RadioButtonList rbl = (RadioButtonList)item.FindControl("RadioButtonList1");
                            choiceid = Convert.ToInt32(rbl.SelectedValue.ToString());

                            TextBox txt = (TextBox)item.FindControl("TextBox1");
                            choicetext = txt.Text;

                            SaveAnswer(Convert.ToInt32(Session["ChecklistID"]), Convert.ToInt32(Session["EventID"]), questionid, choiceid, choicetext, 1);
                            break;
                        case "M":
                            CheckBoxList cbl = (CheckBoxList)item.FindControl("CheckBoxList1");
                            for (int i = 0; i <= cbl.Items.Count - 1; i++)
                            {
                                if (cbl.Items[i].Selected)
                                {
                                    choiceid = Convert.ToInt32(cbl.Items[i].Value);
                                    TextBox txt1 = (TextBox)item.FindControl("TextBox1");
                                    choicetext = txt1.Text;
                                    SaveAnswer(Convert.ToInt32(Session["ChecklistID"]), Convert.ToInt32(Session["EventID"]), questionid, choiceid, choicetext, 1);
                                }
                            }

                            break;
                        case "T":
                            TextBox txt2 = (TextBox)item.FindControl("TextBox1");
                            choicetext = txt2.Text;
                            SaveAnswer(Convert.ToInt32(Session["ChecklistID"]), Convert.ToInt32(Session["EventID"]), questionid, choiceid, choicetext, 1);
                            break;
                    }
                }
            }

            String sql = "AddJobCompletionDetails '" + Session["EventID"] + "',0";
            new Utility().InsertUpdtDelDBData(sql);



            DataList1.Visible = false;
            //Label5.Text = "Thank you for participating in the survey!";
        }
    }
}