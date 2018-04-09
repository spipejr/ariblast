<%@page import="connect.database"%>
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
            
            database db = new database();
            db.dbconnect();

            try {
                

                String strAirNo = request.getParameter("txtAirNo");
                String strAirTemp = request.getParameter("txtAirTemp");
                String strAirArea = request.getParameter("txtAirArea");
                String strName = session.getAttribute("Name").toString();
                
                SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//dd/MM/yyyy
                Date now = new Date();
                String strDate = sdfDate.format(now);
                

                String sqlMaster = "INSERT INTO airIN "
                        + "(airNO,airTemp,airArea,CreateDate,UserCreate) "
                        + "VALUES ('" + strAirNo + "','" + strAirTemp + "' "
                        + ",'" + strAirArea + "','" + strDate + "','" + strName + "') ";
                Statement stmt = (Statement) database.con.createStatement();
                stmt.execute(sqlMaster);
                
                
                
                String sql = "INSERT INTO test "
                        + "(id,airArea) "
                        + "VALUES ('" + strAirNo + "','" + strAirArea + "') ";
                stmt.execute(sql);
                
                stmt.close();
                response.sendRedirect("insert_air_page.jsp");
            } catch (Exception e) {
                
                out.println(e.getMessage());
                
            }

            
        %>
    </body>
</html>
