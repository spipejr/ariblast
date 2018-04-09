<%-- 
    Document   : processtime
    Created on : Feb 12, 2018, 4:14:20 PM
    Author     : AOFFYPYSLOW POWERUP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <%
                Connection connect = null;
                Statement s = null;
                Class.forName("com.mysql.jdbc.Driver");
		connect =  DriverManager.getConnection("jdbc:mysql://localhost/myairblast" +
				"?user=root&password=000000");
		s = connect.createStatement();
		String sql = "SELECT * FROM  timetest ";
		ResultSet rec = s.executeQuery(sql);
                while(rec.next())
                {
                    
                }
            
%>
</html>
