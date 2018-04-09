
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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


        int strairNo = Integer.parseInt(request.getParameter("airNo"));
        String strairTemp = request.getParameter("txtairTemp");
        String strairArea = request.getParameter("txtairArea");
        String strName = session.getAttribute("Name").toString();
                
        SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//dd/MM/yyyy
        Date now = new Date();
        String strDate = sdfDate.format(now);

        String sql = "UPDATE airIN SET airTemp=?, airArea=?, ModifyDate=?, UserModify=?"
                + " WHERE airNo=?";
        PreparedStatement test = (PreparedStatement) connect.prepareStatement(sql);

        test.setString(1, strairTemp);
        test.setString(2, strairArea);
        test.setString(3, strDate);
        test.setString(4, strName);
        test.setInt(5, strairNo);
        test.executeUpdate();
        test.close();
        response.sendRedirect("insert_air_page.jsp");

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