<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>

    </head>
    <body>

        <%

            Connection connect = null;
            Statement s = null;

            try {
                request.setCharacterEncoding("UTF-8");
                Class.forName("com.mysql.jdbc.Driver");
                connect = DriverManager.getConnection("jdbc:mysql://localhost/myairblast"
                        + "?characterEncoding=UTF-8&user=root&password=000000");

                s = connect.createStatement();

//                String strUserID = request.getParameter("txtUserID");
                String strUsername = request.getParameter("txtUsername");
                String strPassword = request.getParameter("txtPassword");
                String strName = request.getParameter("txtName");
                String strPosition = request.getParameter("txtPosition");
                String strPhone = request.getParameter("txtPhone");
                String strStatus = request.getParameter("optStatus");
                String strUserCreate = session.getAttribute("Name").toString();
                
                SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//dd/MM/yyyy
                Date now = new Date();
                String strDate = sdfDate.format(now);

                String sql = "INSERT INTO member "
                        + "(Username,Password,Name,Position,Phone,Status,CreateDate,UserCreate) "
                        + "VALUES ('" + strUsername + "','" + strPassword + "' "
                        + ",'" + strName + "','" + strPosition + "','" + strPhone + "','" + strStatus + "','" + strDate + "','" + strUserCreate + "') ";
                s.execute(sql);
                response.sendRedirect("insert_member_page.jsp");

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
