<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm9.aspx.cs" Inherits="PPMDemo.WebForm9" %>

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
        
    <%
        
        
       
         %>
                      <table border="0" width="100%">
                 <tr>
                     <td style="text-align:center"><b><i>AT A GLANCE ANNUAL PLANNED PREVENTIVE MAINTENANCE SCHEDULE FOR THE YEAR -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(MECHANICAL/ELECTRICAL/BMS/CIVIL)</i></b></td>
                     
                 </tr>
                 <tr>
                     <td style="text-align:center"><b><i>(Department: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</b></i></td>
                 </tr>
                 </table>
             <br />
      
             <br />
             <table border="0" width="100%">
                 <tr style="text-align:left">
                     <td><b><i>UNIT:</i></b></td>
                     
                 </tr>
                 </table>
             <br />
             <br />
             
        <table class="tbl" width="100%">
            <tr>
                <td class="cell" rowspan="3">Sr.<br /> No.</td>
                <td class="cell" rowspan="3">Equipment<br /> Name</td>
                <td class="cell" rowspan="3">Code<br /> No.</td>
                <td class="cell" >Month -></td>
                <td class="cell" >&nbsp;</td>
                <td class="cell" colspan="<%= uObj.GetSundaysInMonth(new DateTime(2017,1,1)) %>" style="text-align:center">
                    January
                </td>
                <td class="cell" colspan="<%= uObj.GetSundaysInMonth(new DateTime(2017,2,1)) %>" style="text-align:center">
                    February
                </td>
                <td class="cell" colspan="<%= uObj.GetSundaysInMonth(new DateTime(2017,3,1)) %>" style="text-align:center">
                    March
                </td>
                <td class="cell" colspan="<%= uObj.GetSundaysInMonth(new DateTime(2017,4,1)) %>" style="text-align:center">
                    April
                </td>
                <td class="cell" colspan="<%= uObj.GetSundaysInMonth(new DateTime(2017,5,1)) %>" style="text-align:center">
                    May
                </td>
                <td class="cell" colspan="<%= uObj.GetSundaysInMonth(new DateTime(2017,6,1)) %>" style="text-align:center">
                    June
                </td>
                <td class="cell" colspan="<%= uObj.GetSundaysInMonth(new DateTime(2017,7,1)) %>" style="text-align:center">
                    July
                </td>
                <td class="cell" colspan="<%= uObj.GetSundaysInMonth(new DateTime(2017,8,1)) %>" style="text-align:center">
                    August
                </td>
                <td class="cell" colspan="<%= uObj.GetSundaysInMonth(new DateTime(2017,9,1)) %>" style="text-align:center">
                    September
                </td>
                <td class="cell" colspan="<%= uObj.GetSundaysInMonth(new DateTime(2017,10,1)) %>" style="text-align:center">
                    October
                </td>
                <td class="cell" colspan="<%= uObj.GetSundaysInMonth(new DateTime(2017,11,1)) %>" style="text-align:center">
                    November
                </td>
                <td class="cell" colspan="<%= uObj.GetSundaysInMonth(new DateTime(2017,12,1)) %>" style="text-align:center">
                    December
                </td>
            </tr>
            <tr>
                
                <td class="cell">Week -></td>
                <td class="cell" >&nbsp;</td>
              <%
                  int j = uObj.GetWeeksInYear(2017);
                  for(int i=1;i<=uObj.GetWeeksInYear(2017);i++)
                  {
                      if(i<10)
                      {
                          Response.Write("<td class='cell'>&nbsp;&nbsp;"+i+"</td>");
                      }
                      else
                      {
                          Response.Write("<td class='cell'>"+i+"</td>");
                      }

                  }
                   %>
            </tr>
             <tr>
                
                <td class="cell">Date -></td>
                <td class="cell" >&nbsp;</td>
              <%
                 
                  for(int i=1;i<=uObj.GetWeeksInYear(2017);i++)
                  {
                     Response.Write("<td class='cell'>"+ FirstDayOfTheWeekList[i-1].ToString()+"</td>");
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
                  for(int i=1;i<=uObj.GetWeeksInYear(2017);i++)
                  {
                     Response.Write("<td class='cell'>"+ (WeekwisePlannedEventsList.Contains(i)? "P" : "&nbsp;")+"</td>");
                  }
                   %>
            </tr>
            <tr>
                
                <td class="cell">A</td>
              <%
                  for(int i=1;i<=uObj.GetWeeksInYear(2017);i++)
                  {
                      Response.Write("<td class='cell'>"+(JobCompletionEventsList.Contains(i)? "A" : "&nbsp;")+"</td>");
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
                  for(int i=1;i<=uObj.GetWeeksInYear(2017);i++)
                  {
                      Response.Write("<td class='cell'>&nbsp;</td>");
                  }
                   %>
            </tr>
            <tr>
                
                <td class="cell">A</td>
              <%
                  for(int i=1;i<=uObj.GetWeeksInYear(2017);i++)
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
                  for(int i=1;i<=uObj.GetWeeksInYear(2017);i++)
                  {
                      Response.Write("<td class='cell'>&nbsp;</td>");
                  }
                   %>
            </tr>
            <tr>
                
                <td class="cell">A</td>
              <%
                  for(int i=1;i<=uObj.GetWeeksInYear(2017);i++)
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
                  for(int i=1;i<=uObj.GetWeeksInYear(2017);i++)
                  {
                      Response.Write("<td class='cell'>&nbsp;</td>");
                  }
                   %>
            </tr>
            <tr>
                
                <td class="cell">A</td>
              <%
                  for(int i=1;i<=uObj.GetWeeksInYear(2017);i++)
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
