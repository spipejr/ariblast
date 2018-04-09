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

        String strpCode = request.getParameter("pCode");
        String strpName = request.getParameter("txtpName");
        String strpTime = request.getParameter("txtpTime");
        String strName = session.getAttribute("Name").toString();
        
        SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//dd/MM/yyyy
                Date now = new Date();
                String strDate = sdfDate.format(now);

        String sql = "UPDATE productIN SET pName=?,pTime=?,ModifyDate=?,UserModify=?"
                + " WHERE pCode=?";
        PreparedStatement query = (PreparedStatement) connect.prepareStatement(sql);

        query.setString(1, strpName);
        query.setString(2, strpTime);
        query.setString(3, strDate);
        query.setString(4, strName);
        query.setString(5, strpCode);

        query.executeUpdate();
        query.close();
        response.sendRedirect("insert_product_page.jsp");

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