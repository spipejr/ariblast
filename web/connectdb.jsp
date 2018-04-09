<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%
    Connection connect = null;
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        connect =  DriverManager.getConnection("jdbc:mysql://localhost/myairblast" +
					"?user=root&password=000000");
    }catch(Exception e)
            {
                
            }
%>