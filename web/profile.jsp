<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<html>
<head>
	<title> OFF </title>
<script>
    function startTime() {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('timein').value =
    h + ":" + m + ":" + s;
    var t = setTimeout(startTime, 500);
}
function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}
</script>
</head>
<body onload="startTime()">

<% 
        SimpleDateFormat Timefmt = new SimpleDateFormat("HH:mm:ss");
        Date date = new Date() ;
        String longtime = Timefmt.format(date);
        
        
	Object strUserID = session.getAttribute("sUserID");
	if(strUserID == null) // Check Login
	{
//		response.sendRedirect("index.jsp");
	}
	
	Connection connect = null;
	Statement s = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		connect =  DriverManager.getConnection("jdbc:mysql://localhost/myairblast" +
				"?user=root&password=000000");
		s = connect.createStatement();
		String sql = "SELECT * FROM  member WHERE UserID = '" + strUserID.toString() + "' ";
		ResultSet rec = s.executeQuery(sql);
		if(rec.next())
		{
%>
			 Profile<br>
			  <table border="1" style="width: 300px">
			    <tbody>
			      <tr>
			        <td> &nbsp;UserID</td>
			        <td>
			          <%=rec.getString("UserID") %>
			        </td>
			      </tr>
			      <tr>
			        <td> &nbsp;Username</td>
			        <td>
			          <%=rec.getString("Username") %>
			        </td>
			      </tr>
			      <tr>
			        <td> &nbsp;Password</td>
			        <td>
			          <%=rec.getString("Password") %>
			        </td>
			      </tr>		
			      <tr>
			        <td> &nbsp;Name</td>
			        <td>
			          <%=rec.getString("Name") %>
			        </td>
                              </tr>
                              <tr>
			        <td> &nbsp;time</td>
			        <td>
                                    <%out.print(longtime);%>
			        </td>
			      </tr>
			    </tbody>
			  </table>
			  <br>	
<%              } 
%>
             
             
<%	
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
//String i = "<div name ="txt">";
%>

<form name="" method="post" action="testtime.jsp?Action=testtime">
  Test<br>
  <table border="1" style="width: 300px">
    <tbody>
      <tr>
        <td> &nbsp;timein</td>
        <td>
            <input  type="text" id="timein" name="timein"> 
        </td>
      </tr>
      <tr>
        <td> &nbsp;ProductTime</td>
        <td>
            <input  type="text" id="protime" name="protime"> 
        </td>
      </tr>
      <tr>
        <td> &nbsp;timeout</td>
        <td>
            <input name="out" type="text" id="timeout" >
        </td>
      </tr>
      <tr>
        <td> &nbsp;name</td>
        <td>
            <input name="name" type="text" id="name" >
        </td>
      </tr>
    </tbody>
  </table>
  <br>
  <input type="submit" name="Submit" value="Add">
</form>
</body>
</html>
