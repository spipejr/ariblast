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
    </head>
    <body>  
        <form name="frmAdd" method="post" action="db_add_member.jsp">	
            <div class="container">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <!--                <th class="text-center">UserID</th>-->
                            <th class="text-center">Username</th>
                            <th class="text-center">Password</th>
                            <th class="text-center">Name</th>
                            <th class="text-center">Position</th>
                            <th class="text-center">Phone</th>
                            <th class="text-center">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <!--                <td class="text-center"><input class="form-control input-sm" type="text" name="txtUserID"></td>-->
                            <td class="text-center"><input class="form-control input-sm" type="text" name="txtUsername" required></td>
                            <td class="text-center"><input class="form-control input-sm" type="text" name="txtPassword" required></td>
                            <td class="text-center"><input class="form-control input-sm" type="text" name="txtName" required></td>
                            <td class="text-center"><input class="form-control input-sm" type="text" name="txtPosition" required></td>
                            <td class="text-center"><input class="form-control input-sm" type="text" name="txtPhone" required></td>
                            <td class="text-center">
                                <select name="optStatus">
                                    <option value="User">User</option>
                                    <option value="Admin">Admin</option>
                                </select>
                            </td>
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

                String sql = "SELECT * FROM  member ORDER BY UserID DESC";

                ResultSet rec = s.executeQuery(sql);
        %>
        <div class="container">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center col-md-1">UserID</th>
                        <th class="text-center">Username</div></th>
                        <th class="text-center">Password</div></th>
                        <th class="text-center">Name</div></th>
                        <th class="text-center">ตำแหน่ง</th>
                        <th class="text-center">โทรศัพท์</th>
                        <th class="text-center">สิทธิ์ใช้งาน</th>
                        <th class="text-center col-md-2" >Edit</th>
                    </tr>	
                </thead>
                <%while ((rec != null) && (rec.next())) {%>
                <tr>
                    <td class="text-center "><%=rec.getString("UserID")%></td>
                    <td class="text-center"><%=rec.getString("Username")%></td>
                    <td class="text-center"><%=rec.getString("Password")%></td>
                    <td class="text-center"><%=rec.getString("Name")%></td>
                    <td class="text-center"><%=rec.getString("Position")%></td>
                    <td class="text-center"><%=rec.getString("Phone")%></td>
                    <td class="text-center"><%=rec.getString("Status")%></td>
                    <td class="text-center"><a href="update_member_page.jsp?UserID=<%=rec.getString("UserID")%>"class="btn btn-xs btn-warning confirmation"><span class="glyphicon glyphicon-wrench"></span>แก้ไข</a>
                        <a href="db_delete_member.jsp?UserID=<%=rec.getString("UserID")%>"  class="btn btn-xs btn-danger confirmation"><span class="glyphicon glyphicon-remove"></span>ลบ</a></td>
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