
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
<!--        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
        <title>TesT WEB</title>
        <style type="text/css">
            #color1 {background-color:#5971AF; font-weight:bold; Color:#000000;}
            #color2 {background-color:#E1E9FC; Color:#000000;}
        </style>
        <script>
            function startTime() 
            {
                var today = new Date();
                var h = today.getHours();
                var m = today.getMinutes();
                var s = today.getSeconds();
                m = checkTime(m);
                s = checkTime(s);
                document.getElementById('ntime').value =
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
<!--            <center>
		<form action="newjsp_Process.jsp" method="post">
		<table  cellpadding=2 cellspacing=1  width=300 border=0>
                    <tr id=color1><td colspan=2><center><b>&nbsp;Test</b></center></td></tr>
		<tr id=color2><td>&nbsp;ชื่อ :</td>
				<td>&nbsp;<input type=text  name="name" size=20></td></tr>
		<tr id=color2><td>&nbsp;นามสกุล :</td>
				<td>&nbsp;<input type=text name="surname" size=20></td></tr>
                <tr id=color2><td>&nbsp;ที่อยู่ :</td>
				<td>&nbsp;<input type=text name="address" size=20></td></tr>
		<tr id=color2><td colspan=2><CENTER>
                    <input type=submit name=submit value="Add">&nbsp;
                    <input type=reset value="รีเซ็ต"></CENTER></td>
                   
                </tr>
                </table>
		</form>
            </center>-->
    
            <center>
		<form action="newjsp_Process_db.jsp" method="post">
		<table  cellpadding=2 cellspacing=1  width=300 border=0>
                    <br>
                    <hr>
                    <br>
                    <input type=submit name=testdb value="testdb">&nbsp;
                </table>
		</form>
            </center>
                    <br>
                    <hr>
                    <br>
<%
        
        SimpleDateFormat Timefmt = new SimpleDateFormat("HH:mm:ss");
        Date date = new Date() ;
        String longtime = Timefmt.format(date);
        
%>

        <form action="testtime_process.jsp" method="post">
		<table  cellpadding=2 cellspacing=1  width=300 border=0>
            <input type=text name="time" size=20 id="ntime" >
            &nbsp;<input type=submit name=addtime value="addtime">
            <p><input type=text name="timeout" size=20 value="">
        </table>
        </form>  
    </body>
</html>
