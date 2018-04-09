<%@page import="java.util.TimeZone"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.time.Duration"%>
<%@page import="java.time.Instant"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <meta http-equiv="refresh" content="5;url=show_out.jsp">

        <%
            //        String timestamp;
        %>
        <%
            if (null == session.getAttribute("Status")) {
                response.sendRedirect("loginpage.jsp");
            } else if (session.getAttribute("Status").equals("Admin")) {
        %>
        <jsp:include page="include/navbarAdmin.jsp" />
        <%
        } else {
        %>
        <jsp:include page="include/navbar.jsp" />
        <%
            }
        %>
    
    <script>
        function startTime()
        {
            var today = new Date();
            var h = today.getHours();
            var m = today.getMinutes();
            var s = today.getSeconds();
            m = checkTime(m);
            s = checkTime(s);
            document.getElementById('time').innerHTML =
                    h + ":" + m + ":" + s;
            var t = setTimeout(startTime, 500);
        }
        function checkTime(i) {
            if (i < 10) {
                i = "0" + i
            }
            ;  // add zero in front of numbers < 10
            return i;
        }
    </script>
<!--    <style type="text/css">
        #red    {color : #ff0000;}
        #green    {color : green;}
    </style>-->
    
    <style>
        #tcolor{-webkit-animation: color-change 1s infinite;
                -moz-animation: color-change 1s infinite;
  /*              -o-animation: color-change 1s infinite;
                -ms-animation: color-change 1s infinite;
                animation: color-change 1s infinite;*/
                }
                
@-webkit-keyframes color-change {
    0% { color:   red; }
    50% { color:   blue; }
    100% { color:   red; }
}
@-moz-keyframes color-change {
    0% { color: red; }
    50% { color: blue; }
    100% { color: red; }
}
/*@-ms-keyframes color-change {
    0% { color: red; }
    50% { color: blue; }
    100% { color: red; }
}
@-o-keyframes color-change {
    0% { color: red; }
    50% { color: blue; }
    100% { color: red; }
}
@keyframes color-change {
    0% { color: red; }
    50% { color: blue; }
    100% { color: red; }
}*/
    </style>
    
       <style>
.table {
  border: 1.5px solid #000000;
}
.table-bordered > thead > tr > th,
.table-bordered > tbody > tr > th,
.table-bordered > tfoot > tr > th,
.table-bordered > thead > tr > td,
.table-bordered > tbody > tr > td,
.table-bordered > tfoot > tr > td {
   border: 1.5px solid #000000;
}
        </style>
    </head>
    <body onload="startTime()">  
        <%
            Connection connect = null;
            Statement s = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                connect = DriverManager.getConnection("jdbc:mysql://localhost/myairblast"
                        + "?user=root&password=000000");

                s = connect.createStatement();

                String sql = "SELECT * FROM  showin ORDER BY CreateDate";

                ResultSet rec = s.executeQuery(sql);
        %>

        <div class="container">
            <table class="table table-bordered">
                <thead>
                    <tr class="info">    
                        <th class="text-center col-md-2">
                            เวลาปัจจุบัน
                        </th>
                        <th class="text-center text-danger">
                            <span id="time"></span>
                        </th>
                    </tr>
                    <tr class="info">
                        <th class="text-center col-md-1">AirNo</th>
                        <th class="text-center">No.รถ</th>
                        <th class="text-center">ผลิตภัณฑ์</th>
                        <th class="text-center">Lot</th>
                        <th class="text-center">จำนวนที่เรียง</th>
                        <th class="text-center">เวลาคงเหลือ</th>
                        <th class="text-center">สถานะ</th>
                        <th></th>

                    </tr>	
                </thead>
                <%while ((rec != null) && (rec.next())) {%>
                <tr class="">
<%
                    int airNo = rec.getInt("airNo");
%>
                    <td class="text-center"><%=rec.getString("airNo")%></td>
                    <td class="text-center"><%=rec.getString("carNo")%></td>
                    <td class="text-center"><%=rec.getString("pName")%></td>
                    <td class="text-center"><%=rec.getString("pLot")%></td>
                    <td class="text-center"><%=rec.getString("pAmount")%></td>
                    
                    <%
                        
                        String a = rec.getString("etime");
                        SimpleDateFormat Timefmt = new SimpleDateFormat("HH:mm:ss");
                        Date date = new Date();
                        String nowtime = Timefmt.format(date);
                        //                            String ftime = Timefmt.format(a);

                        Calendar cal = Calendar.getInstance();
                        Date date1 = Timefmt.parse(nowtime);
                        Date date2 = Timefmt.parse(a);

                        long different = (date2.getTime() - date1.getTime());
                        Date sdate = new Date(different);
                        cal.setTime(sdate);
                        cal.add(Calendar.HOUR, -7);
                        String timestamp = Timefmt.format(cal.getTime());
                        
//                        timestamp = "00:00:09";
                        if(rec.getString("pStatus").equals("P"))
                        {
                            timestamp = "00:00:00";
        %>
                            <td class="text-center" id="tcolor" ><%=timestamp%></td>
        <%
                        }else{

        %>
                            <td class="text-center" id="green"><%=timestamp%></td>
        <%
                        }
                        String b = rec.getString("pStatus");

                        Date zero = Timefmt.parse("00:00:00");
                        Date ten = Timefmt.parse("00:00:10");
                        
                        Date userDate = Timefmt.parse(timestamp);

                        if (userDate.after(zero) && userDate.before(ten)) 
                        {
                            b = "P";
                            Class.forName("com.mysql.jdbc.Driver");
                            connect = DriverManager.getConnection("jdbc:mysql://localhost/myairblast"
                                                                + "?user=root&password=000000");
                                                                
                            Statement s2 = connect.createStatement();
                            String sqlupdate = "UPDATE showin SET pStatus = '"+b+"'  WHERE airNo = '"+airNo+"' ";
                            s2.executeUpdate(sqlupdate);
                        } 


                    %>
                    <td class="text-center"><%=b%></td>
                    <td class="text-center"><a href="key_out_page.jsp?airNo=<%=rec.getString("airNo")%>"class="btn btn-xs btn-warning confirmation"><span class="glyphicon glyphicon-wrench"></span>แก้ไข</a></td>
                </tr>
                <%}%>
            </table>      
        </div>
        <%
            } catch (Exception e) {
                // TODO Auto-generated catch block
                out.println(e.getMessage());
                e.printStackTrace();
            }

            try {
                if (s != null) {
                    s.close();
                    connect.close();
                }
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                out.println(e.getMessage());
                e.printStackTrace();
            }
        %>
    </body>
</html>
<jsp:include page="include/footer.jsp" />