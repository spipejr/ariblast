<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection connect = null;
    Statement s = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        connect = DriverManager.getConnection("jdbc:mysql://localhost/myairblast"
                + "?user=root&password=000000");

        s = connect.createStatement();

        String strUserID = request.getParameter("UserID");

        String sql = "DELETE FROM member where UserID = '" + strUserID + "' ";

        s.execute(sql);
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