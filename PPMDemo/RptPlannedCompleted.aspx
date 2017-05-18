<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RptPlannedCompleted.aspx.cs" Inherits="PPMDemo.RptPlannedCompleted" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .tbl {
            border-collapse: collapse;
            border: 1px solid black;
        }

        .cell {
            border: 1px solid black;
        }
    </style>
</head>
<body>
    

    <form id="form1" runat="server">
        <div>

            <table border="0" width="100%">
                <tr>
                    <td style="text-align: center"><b><i>AT A GLANCE ANNUAL PLANNED PREVENTIVE MAINTENANCE SCHEDULE FOR THE YEAR -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(MECHANICAL/ELECTRICAL/BMS/CIVIL)</i></b></td>

                </tr>
                <tr>
                    <td style="text-align: center"><b><i>(Department: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</b></i></td>
                </tr>
            </table>
            <br />

            <br />
            <table border="0" width="100%">
                <tr style="text-align: left">
                    <td><b><i>UNIT:</i></b></td>

                </tr>
            </table>
            <br />
            <br />

            <table class="tbl" width="100%">
                <tr>
                    <td class="cell" rowspan="2">Sr.<br />
                        No.</td>
                    <td class="cell" rowspan="2">Equipment<br />
                        Name</td>
                    <td class="cell" rowspan="2">Code<br />
                        No.</td>
                    <td class="cell">Location</td>
                    <td class="cell">&nbsp;</td>
                    <%
                        for (int month = 1; month <= 12; month++)
                        {%>
                    <td class="cell" colspan="<%= uObj.GetSundaysInMonth(Convert.ToInt32(Session["RptA4Year"].ToString()),month) %>" style="text-align: center">

                        <%
                            DateTime dObj = new DateTime(Convert.ToInt32(Session["RptA4Year"].ToString()), month, 1);
                            Response.Write(dObj.ToString("MMMM"));

                        %>
                    </td>

                    <%
                        }
                    %>
                </tr>
               
                
                
                
                
                
                
                
                <tr>

                    <td class="cell">Week -></td>
                    <td class="cell">&nbsp;</td>
                    <%
                        int j = uObj.GetWeeksInYear(2017);
                        for (int i = 1; i <= uObj.GetWeeksInYear(2017); i++)
                        {
                            if (i < 10)
                            {
                                Response.Write("<td class='cell'>&nbsp;&nbsp;" + i + "</td>");
                            }
                            else
                            {
                                Response.Write("<td class='cell'>" + i + "</td>");
                            }

                        }
                    %>
                </tr>
                <tr>
                    <td rowspan="2" class="cell">&nbsp;</td>
                    <td rowspan="2" class="cell">&nbsp;</td>
                    <td rowspan="2" class="cell">&nbsp;</td>
                    <td rowspan="2" class="cell">&nbsp;</td>
                    <td class="cell">P</td>
                    <%
                        bool flag = false;
                        int n = 0;
                        for (int i = 1; i <= uObj.GetWeeksInYear(2017); i++)
                        //for(int i=1;i<=13;i++)
                        {
                            flag = false;
                            n = 0;

                            for (n = 0; n < dt.Rows.Count; n++)
                            {
                                if (Convert.ToInt32(dt.Rows[n][3].ToString()) == i)
                                {
                                    flag = true;
                                    break;
                                }

                            }

                            if (flag == true)
                            {
                                Response.Write("<td class='cell'>" + dt.Rows[n][8].ToString() + "</td>");
                            }
                            else
                            {
                                Response.Write("<td class='cell'>" + "&nbsp;" + "</td>");
                            }



                        }
                    %>
                </tr>
                <tr>

                    <td class="cell">A</td>
                    <%
                        for (int i = 1; i <= uObj.GetWeeksInYear(2017); i++)
                        {

                            flag = false;
                            n = 0;

                            for (n = 0; n < dt.Rows.Count; n++)
                            {
                                Object val = dt.Rows[n][6];
                                if (val != DBNull.Value)
                                {
                                    if (Convert.ToInt32(dt.Rows[n][6].ToString()) == i)
                                    {
                                        flag = true;
                                        break;
                                    }

                                }

                            }

                            if (flag == true)
                            {
                                Response.Write("<td class='cell'><a href='/WebForm8.aspx?ppmeventid="+dt.Rows[n][1].ToString()+"'>" + "A" + "</a></td>");
                            }
                            else
                            {
                                Response.Write("<td class='cell'>" + "&nbsp;" + "</td>");
                            }




                        }
                    %>
                </tr>
                <tr>
                    <td rowspan="2" class="cell">&nbsp;</td>
                    <td rowspan="2" class="cell">&nbsp;</td>
                    <td rowspan="2" class="cell">&nbsp;</td>
                    <td rowspan="2" class="cell">&nbsp;</td>
                    <td class="cell">P</td>
                    <%
                        for (int i = 1; i <= uObj.GetWeeksInYear(2017); i++)
                        {
                            Response.Write("<td class='cell'>&nbsp;</td>");
                        }
                    %>
                </tr>
                <tr>

                    <td class="cell">A</td>
                    <%
                        for (int i = 1; i <= uObj.GetWeeksInYear(2017); i++)
                        {
                            Response.Write("<td class='cell'>&nbsp;</td>");
                        }
                    %>
                </tr>
                <tr>
                    <td rowspan="2" class="cell">&nbsp;</td>
                    <td rowspan="2" class="cell">&nbsp;</td>
                    <td rowspan="2" class="cell">&nbsp;</td>
                    <td rowspan="2" class="cell">&nbsp;</td>
                    <td class="cell">P</td>
                    <%
                        for (int i = 1; i <= uObj.GetWeeksInYear(2017); i++)
                        {
                            Response.Write("<td class='cell'>&nbsp;</td>");
                        }
                    %>
                </tr>
                <tr>

                    <td class="cell">A</td>
                    <%
                        for (int i = 1; i <= uObj.GetWeeksInYear(2017); i++)
                        {
                            Response.Write("<td class='cell'>&nbsp;</td>");
                        }
                    %>
                </tr>
                <tr>
                    <td rowspan="2" class="cell">&nbsp;</td>
                    <td rowspan="2" class="cell">&nbsp;</td>
                    <td rowspan="2" class="cell">&nbsp;</td>
                    <td rowspan="2" class="cell">&nbsp;</td>
                    <td class="cell">P</td>
                    <%
                        for (int i = 1; i <= uObj.GetWeeksInYear(2017); i++)
                        {
                            Response.Write("<td class='cell'>&nbsp;</td>");
                        }
                    %>
                </tr>
                <tr>

                    <td class="cell">A</td>
                    <%
                        for (int i = 1; i <= uObj.GetWeeksInYear(2017); i++)
                        {
                            Response.Write("<td class='cell'>&nbsp;</td>");
                        }
                    %>
                </tr>

            </table>
            <br />
            <br />
            <table border="0" width="100%">
                <tr>
                    <td><i>LEGEND : W - WEEKLY (1 Week), F - FORTNIGHTLY (2 Weeks), M - MONTHLY (4 Weeks), 2M - TWO MONTHLY (8 Weeks), Q - QUARTERLY (12 Weeks), FM - FOUR MONTHLY (16 Weeks), S - SIX MONTHLY (24 Weeks), Y - YEARLY (48 Weeks), 2Y - 2 YEARLY (96 Weeks), P - PLANNED, A - ACTUAL, *-Critical Equipment</i></td>

                </tr>
            </table>
            <br />
            <br />
            <table border="0" width="100%">
                <tr>
                    <td width="33%"><b><i>PREPARED BY</i></b></td>
                    <td width="33%"><b><i>REVIEWED BY</i></b></td>
                    <td width="33%"><b><i>APPROVED BY</i></b></td>

                </tr>
                <tr>
                    <td><b><i>Unit Engineer</i></b></td>
                    <td><b><i>Engineering Department Head</i></b></td>
                    <td><b><i>Head Unit Quality</i></b></td>
                </tr>
                <tr>
                    <td><b><i>Date:</i></b></td>
                    <td><b><i>Date:</i></b></td>
                    <td><b><i>Date:</i></b></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
