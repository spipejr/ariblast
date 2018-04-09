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
        <%
            Connection connect = null;
            Statement s = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");

                connect = DriverManager.getConnection("jdbc:mysql://localhost/myairblast"
                        + "?user=root&password=000000");

                s = connect.createStatement();

                String strUserID = request.getParameter("UserID");
                String sql = "SELECT * FROM  member WHERE UserID = '" + strUserID + "'  ";

                ResultSet rec = s.executeQuery(sql);
                if (rec != null) {
                    rec.next();
        %>
        <form name="frmUpdate" method="post" action="db_update_member.jsp?UserID=<%=rec.getString("UserID")%>">	
            <div class="container"> 
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th class="text-center">UserID</th>
                            <th class="text-center">Username</div></th>
                            <th class="text-center">Password</div></th>
                            <th class="text-center">Name</div></th>
                            <th class="text-center">ตำแหน่ง</th>
                            <th class="text-center">โทรศัพท์</th>
                            <th class="text-center">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="text-center"><%=rec.getString("UserID")%></td>
                            <td class="text-center"><input class="form-control input-sm" type="text" name="txtUsername" value="<%=rec.getString("Username")%>"></td>
                            <td class="text-center"><input class="form-control input-sm" type="text" name="txtPassword" value="<%=rec.getString("Password")%>"></td>
                            <td class="text-center"><input class="form-control input-sm" type="text" name="txtName" value="<%=rec.getString("Name")%>"></td>
                            <td class="text-center"><input class="form-control input-sm" type="text" name="txtPosition" value="<%=rec.getString("Position")%>"></td>
                            <td class="text-center"><input class="form-control input-sm" type="text" name="txtPhone" value="<%=rec.getString("Phone")%>"></td>
                            <td class="text-center">
                                <select name="optStatus">
                                    <option value="<%=rec.getString("Status")%>"selected hidden><%=rec.getString("Status")%></option>
                                    <option value="Admin">Admin</option>   
                                    <option value="User">User</option>
                                </select>
                            </td>
                            <td class="text-center"><input type="submit" name="submit" class="btn btn-success" value="OK"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </form> 

        <% }

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