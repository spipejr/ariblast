<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<html>
<head>
	<title>KEY IN</title>
</head>
<body>
	
	<%
	
	
	Connection connect = null;
	Statement s = null;
	
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		connect =  DriverManager.getConnection("jdbc:mysql://localhost/myairblast" +
				"?user=root&password=000000");
		
		s = connect.createStatement();
		
		String strProName = request.getParameter("txtpName");
		String strProLot = request.getParameter("txtpLot");
		String strProAmount = request.getParameter("txtpAmount");
                String strSelect = request.getParameter("optID"); 
                String strProTime = request.getParameter("txtpTime");
                
		
		
		String sql = "INSERT INTO productIN " +
				"(pName,pLot,pAmount,pStatus,pTime) " + 
				"VALUES ('" + strProName + "','" + strProLot + "' " +
				",'" + strProAmount + "'" +
				",'" + strSelect + "'" +
				",'" + strProTime + "') ";
         s.execute(sql);
        
         out.println("Record Inserted Successfully");
        
	  		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	
		try {
			if(s!=null){
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
