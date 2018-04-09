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
    
    <body>  

        <%
            Connection connect = null;
            Statement s = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                connect = DriverManager.getConnection("jdbc:mysql://localhost/myairblast"
                        + "?user=root&password=000000");

                s = connect.createStatement();

                String sql = "SELECT * FROM showin ORDER BY CreateDate";

                ResultSet rec = s.executeQuery(sql);
        %>
       
        <div class="container">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr class="info">
                        <th class="text-center">airNo</th>
                        <th class="text-center">ชื่อผลิตภัณฑ์</th>
                        <th class="text-center">No.รถ</th>
                        <th class="text-center">จ.นที่เรียง</th>
                        <th class="text-center">เวลาเริ่ม</th>
                        <th class="text-center">เวลาเสร็จ</th>
                        <th class="text-center">อุณหภูมิ</th>
                        <th class="text-center">สถานะ</th>
                        <th class="text-center">Edit</th>
                    </tr>	
                </thead>
                
                <%while ((rec != null) && (rec.next())) {%>
                <tr class="info">
                    <td class="text-center"><%=rec.getString("airNo")%></td>
                    <td class="text-center"><%=rec.getString("pName")%></td>
                    <td class="text-center"><%=rec.getString("carNo")%></td>
                    <td class="text-center"><%=rec.getString("pAmount")%></td>
                    <td class="text-center"><%=rec.getString("sTime")%></td>
                    <td class="text-center"><%=rec.getString("eTime")%></td>
                    <td class="text-center"><%=rec.getString("TAir")%></td>
                    <td class="text-center"><%=rec.getString("pStatus")%></td>
                    <td class="text-center"><a href="db_delete_showin.jsp?airNo=<%=rec.getString("airNo")%>"  class="btn btn-xs btn-danger confirmation"><span class="glyphicon glyphicon-remove"></span>ลบ</a></td>
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
<script type="text/javascript">
        $('.confirmation').on('click', function () {
            return confirm('Are you sure?');
        });
</script>
<jsp:include page="include/footer.jsp" />