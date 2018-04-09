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
  border: 2.0px solid #000000;
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
        <form name="frmAdd" method="post" action="db_add_status.jsp">	
            <div class="container">
                <table class="table table-bordered">
                    <thead>
                        <tr class="danger">
                            <th class="text-center">สถานะ</th>
                            <th class="text-center">ความหมาย</th>
                            <th class="text-center"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="danger">
                            <td class="text-center"><input type="text" name="txtStatusN" pattern="[a-z,A-Z,0-]" required></td>
                            <td class="text-center"><input type="text" name="txtStatusM" required></td>
                            <td class="text-center"><button type="submit" class="btn btn-success btn-sm">
                                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>ADD
                                </button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </form>  
        <%
            Connection connect = null;
            Statement s = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                connect = DriverManager.getConnection("jdbc:mysql://localhost/myairblast"
                        + "?user=root&password=000000");

                s = connect.createStatement();

                String sql = "SELECT * FROM PStatus ORDER BY CreateDate";

                ResultSet rec = s.executeQuery(sql);
        %>
        <div class="container">
            <table class="table table-bordered">
                <thead>
                    <tr class="info">
                        <th class="text-center">สถานะที่มีอยู่</div></th>
                        <th class="text-center">ความหมาย</div></th>
                        <th class="text-center col-md-2" >Edit</th>
                    </tr>	
                </thead>
                <%while ((rec != null) && (rec.next())) {%>
                <tr class="info">
                    <td class="text-center"><%=rec.getString("nStatus")%></td>
                    <td class="text-center"><%=rec.getString("mStatus")%></td>
                    <td class="text-center"><a href="update_status_page.jsp?nStatus=<%=rec.getString("nStatus")%>"class="btn btn-xs btn-warning confirmation"><span class="glyphicon glyphicon-wrench"></span>แก้ไข</a>
                        <a href="db_delete_status.jsp?nStatus=<%=rec.getString("nStatus")%>"  class="btn btn-xs btn-danger confirmation"><span class="glyphicon glyphicon-remove"></span>ลบ</a></td>
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
    <script type="text/javascript">
        $('.confirmation').on('click', function () {
            return confirm('Are you sure?');
        });
    </script>
</html>
<jsp:include page="include/footer.jsp" />