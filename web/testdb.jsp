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
                request.setCharacterEncoding("UTF-8");
                Class.forName("com.mysql.jdbc.Driver");
                connect = DriverManager.getConnection("jdbc:mysql://localhost/myairblast"
                        + "?characterEncoding=UTF-8&user=root&password=000000");

                s = connect.createStatement();
                
                
                String id = request.getParameter("airNo");
                String sum = request.getParameter("Marea");
   
                String [] a = id.split(",");
                String sql = "UPDATE test " +
                "SET airArea = '"+ sum + "' " +
                " WHERE id = '" + a[2] + "' ";
                
                s.executeUpdate(sql);
//                 if (s != null) {
//                    
//                }
//                
                
                response.sendRedirect("car_check.jsp");

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