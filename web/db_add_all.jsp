<%@page import="java.sql.PreparedStatement"%>
<%@page import="connect.database"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.TimeZone"%>
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
                request.setCharacterEncoding("UTF-8");
                

                
                String strairNo = request.getParameter("airNo");
//                String strpName = request.getParameter("pName");
            

                String strpName = request.getParameter("PTESTNAME");
//                String[] strpName2 = strpName.split(",");
                String strcarNo = request.getParameter("txtcarNo");
                String strAmount = request.getParameter("txtpAmount");
                String strpLot = request.getParameter("optLot");
                String strsTime = request.getParameter("txtsTime");
                String streTime = request.getParameter("txteTime");
                String strTAir = request.getParameter("txtTAir");
                String strStatus = request.getParameter("pStatus");
                String strName = session.getAttribute("Name").toString();
                
                SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//dd/MM/yyyy
                Date now = new Date();
                String strDate = sdfDate.format(now);
                
                Statement stmt = (Statement) database.con.createStatement();
                
                String sql = "INSERT INTO showin "
                        + "(airNo,pName,carNo,pAmount,pLot,sTime,eTime,TAir,pStatus,CreateDate,UserCreate) "
                        + "VALUES ('" + strairNo + "' "
                        + ",'" + strpName + "','" + strcarNo + "','" + strAmount + "','" + strpLot + "','" + strsTime + "','" + streTime + "','" + strTAir + "','" + strStatus + "','" + strDate + "','" + strName + "') ";
                

                
                stmt.executeUpdate(sql);

                response.sendRedirect("insert_all_page.jsp");

            } catch (Exception e) {
                // TODO Auto-generated catch block
                out.println(e.getMessage());
                e.printStackTrace();
            }

            
        %>
    </body>
</html>
