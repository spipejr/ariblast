<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%
    Connection connect = null;
    Statement s = null;

    try {
        request.setCharacterEncoding("UTF-8");
        Class.forName("com.mysql.jdbc.Driver");
        connect = DriverManager.getConnection("jdbc:mysql://localhost/myairblast"
                + "?characterEncoding=UTF-8&user=root&password=000000");

        s = connect.createStatement();

        int strUserID = Integer.parseInt(request.getParameter("UserID"));
        String strUsername = request.getParameter("txtUsername");
        String strPassword = request.getParameter("txtPassword");
        String strName = request.getParameter("txtName");
        String strPosition = request.getParameter("txtPosition");
        String strPhone = request.getParameter("txtPhone");
        String strStatus = request.getParameter("optStatus");

        String sql = "UPDATE member SET Username=?,Password=?,Name=?,Position=?,Phone=?,Status=?"
                + " WHERE UserID=?";
        PreparedStatement query = (PreparedStatement) connect.prepareStatement(sql);

        query.setString(1, strUsername);
        query.setString(2, strPassword);
        query.setString(3, strName);
        query.setString(4, strPosition);
        query.setString(5, strPhone);
        query.setString(6, strStatus);
        query.setInt(7, strUserID);

        query.executeUpdate();
        query.close();
        response.sendRedirect("insert_member_page.jsp");

    } catch (Exception e) {
        // TODO Auto-generated catch block
        out.println(e.getMessage());
    }

    try {
        if (s != null) {
            s.close();
            connect.close();
        }
    } catch (SQLException e) {
        // TODO Auto-generated catch block
        out.println(e.getMessage());
    }
%>