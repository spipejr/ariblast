<!--<script>

function show(){
var Digital=new Date()
var hours=Digital.getHours()
var minutes=Digital.getMinutes()
var seconds=Digital.getSeconds()
var dn="AM"
if (hours>=12)
dn="PM"
if (hours>12)
hours=hours-12
if (hours==0)
hours=12
if (minutes<=9)
minutes="0"+minutes
if (seconds<=9)
seconds="0"+seconds
document.getElementById("shtime").innerHTML = hours+":"+minutes+":"
//document.test.Clock.value=hours+":"+minutes+":"
+seconds+" "+dn
setTimeout("show()",1000)
}
show()
//
</script>-->

<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<html>

    <head>

       

    </head>

    <body>
  
        <form method="POST" action="testdb.jsp">
        <input type="text" name="test" id="test">
        <select name="car">
            <option value="11">11</option>
        </select>
        <button type="submit">OK</button>
        </form>
        
        
<!--        <form name="frmMain" method="post" action="testtime.jsp" target="iframe_target" >
	<iframe id="iframe_target" name="iframe_target" src="#" ></iframe>
	First Name : <input type="text" name="txtFirstName"><br>
	Last Name : <input type="text" name="txtLastName"><br>
	<input name="btnSubmit" type="submit" value="Submit">  
	</form>-->
    </body>

</html>

<!--<input type="text" id="txt1"  onkeyup="sum();" />
<input type="text" id="txt2"  onkeyup="sum();" />
<input type="text" id="txt3" />
<script>
    function sumTimerealTime() {
      var txtFirstNumberValue = document.getElementById('txt1').value;
      var txtSecondNumberValue = document.getElementById('txt2').value;
      var result = parseInt(txtFirstNumberValue) + parseInt(txtSecondNumberValue);
      if (!isNaN(result)) {
         document.getElementById('txt3').value = result;
      }
}
</script>-->

