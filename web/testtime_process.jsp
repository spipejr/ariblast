<%-- 
    Document   : testtime_process
    Created on : Feb 19, 2018, 10:23:45 AM
    Author     : Programmer
--%>

<%@page import="java.util.TimeZone"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.time.Duration"%>
<%@page import="java.time.Instant"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<%
        String timestamp;
%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
<!--         
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
         </script>-->
<%          
//        response.setIntHeader("Refresh", 5);
%>
    </head>
<!--    <body onload="startTime()">-->
<body>
<%
        
        String time = new String(request.getParameter("time").getBytes("iso-8859-1"),"UTF-8").trim();
        //String timeout = new String(request.getParameter("timeout").getBytes("iso-8859-1"),"UTF-8").trim();
        int timeout = Integer.parseInt(request.getParameter("timeout"));
        ///-------------------------------------------------------------------//
        SimpleDateFormat Timefmt = new SimpleDateFormat("HH:mm:ss");
        /////////////////////////////////////////// 
        Date date = new Date() ;
        String nowtime = Timefmt.format(date);
        /////////////////////////// add time
        Date d = Timefmt.parse(time); 
        Calendar cal = Calendar.getInstance();
        cal.setTime(d);
        cal.add(Calendar.MINUTE, timeout);
        String Ftime = Timefmt.format(cal.getTime());
        String status = "ยัง";
        Date userDate = Timefmt.parse(nowtime);
        userDate = Timefmt.parse(nowtime);
%>
        <center><b>เทส</b></center><br>
                <table id="mytable"  align=center border=1 cellpadding=5 cellspacing=0>
                    <tr id=color1 align="center">
                        <td>เวลาเข้า</td>
                        <td>เวลาออก</td>
                        <td>เวลาสำเร็จ</td>
<!--                        <td>เวลาปัจจุบัน</td>-->
                        <td>สถานะ</td>
                        <td>เวลาคงเหลือ</td>
                    </tr>
                    <tr id="color2">
                            <td><%=time%></td>
                            <td><%=timeout%></td>
                            <td> <%=Ftime%></td>
<!--                            <td><div id="ntime"></div> </td>-->
<!--                            <td> <%=nowtime%></td>-->
<%
                            SimpleDateFormat parser = new SimpleDateFormat("HH:mm:ss");
                            Date tout = Timefmt.parse(Ftime);
                      
                            
                            try {
                                
                                
                                if (userDate.after(tout)) {
                                    status = "เสร็จ";
                                    
                                    
                                    
                                }
                            } catch (Exception e) {
                                
                            }
                            /////////////////
                            Date date1 = Timefmt.parse(nowtime);
                            Date date2 = Timefmt.parse(Ftime);
                            long different = (date2.getTime()-date1.getTime()); 
                            Date sdate = new Date(different);
                            cal.setTime(sdate);
                            cal.add(Calendar.HOUR, -7);
                            timestamp = Timefmt.format(cal.getTime());              
%>                          
                            <td><%=status%></td>
                            <td><%=timestamp%></td>
                </tr>
            </table>
       
    </body>
</html>