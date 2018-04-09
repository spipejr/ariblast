<%@page import="java.sql.Time"%>
<%@page import="java.util.Calendar"%>
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
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <%
            String Ftime = "";

            if (null == session.getAttribute("Status")) {
                response.sendRedirect("loginpage.jsp");
            } else if (session.getAttribute("Status").equals("Admin")) {
        %>
        <jsp:include page="include/navbarAdmin.jsp" />
        <%
        } else {
        %>
        <jsp:include page="include/navbar.jsp" />
        <%
            }


        %>
        <style>
.table {
  border: 1.5px solid #000000;
}
.table-bordered > thead > tr > th,
.table-bordered > tbody > tr > th,
.table-bordered > tfoot > tr > th,
.table-bordered > thead > tr > td,
.table-bordered > tbody > tr > td,
.table-bordered > tfoot > tr > td {
   border: 1.5px solid #000000;
}
        </style>
    </head>
    <body>
        <%        Connection connect = null;
            Statement s = null;
try {
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mysql://localhost/myairblast"
                    + "?user=root&password=000000");

            s = connect.createStatement();
             
            String strairNo = request.getParameter("airNo");
            String sql = "SELECT * FROM showin WHERE airNo = '" + strairNo + "'  ";
            ResultSet rec = s.executeQuery(sql);
            if (rec != null) {
                    rec.next();
        %>

        <form name="frmAdd" method="POST" id="autoSumForm" action="key_out_page.jsp">
            <div class="container ">
                <table class="table table-bordered">
                    <thead>
                        <tr class="success">
                            <th class="text-left col-md-1">AirNo.</th>
                            <td class="text-left col-md-1">
                                <select name="airNo" disabled>
                                    
                                    <option value="<%=rec.getString("airNo")%>"><%=rec.getString("airNo")%></option>
                                   
                                </select>	
                            </td>
                            <th class="text-left col-md-1">No.รถ</th>
                            <td><input type="text" name="txtcarNo" value="<%=rec.getString("carNo")%>" disabled></td>
                        </tr>
                        <tr class="success">

                            <th class="text-left col-md-1 ">ProductName</th>
                            <td><input type="text" name="txtpName" value="<%=rec.getString("pName")%>" disabled></td></td>

                            <th class="text-left col-md-1">Lot</th>
                            <td>
                            <input name="txtpLot" id="srt" value="<%=rec.getString("pLot")%>" disabled>
                            </td>

                        </tr>
                        <tr class="success">
                            <th class="text-left col-md-1">จำนวนที่เรียง</th>
                            <td><input type="text" name="txtpAmount" value="<%=rec.getString("pAmount")%>" disabled></td>
                        </tr>

                    </thead>
                </table>
            </div>
            <div class="container">
                <table class="table table-bordered">
                    <thead>
                        
                        <tr class="success">
                            <th class="text-left col-md-1">เริ่ม</th>
                            <td class="text-left col-md-1"><input type="text" name="txtsTime" id="txtsTime" value="<%=rec.getString("sTime")%>" placeholder="เวลา"  disabled></td>
                            <td class="text-left col-md-1"><input type="text" name="txtTAir" value="<%=rec.getString("TAir")%>" placeholder="อุณหภูมิ Air" disabled></td>
                            <td ><input type="text" name="txtsTime2" placeholder="เวลา" disabled></td>
                        </tr>
                        
                        <tr class="success">
                            <th class="text-left col-md-1">เสร็จ</th>
                            <td class="text-left col-md-1"><input name="txteTime" id="srt2" value="<%=rec.getString("eTime")%>" disabled></td>
                            <td class="text-left col-md-1"><input type="text" name="txtTAir" placeholder="อุณหภูมิ Air" value="<%=rec.getString("TAir")%>" disabled></td>
                            <td class="danger"><input type="text" name="txteTime2" placeholder="เวลา" ></td>
                        </tr>
                        <tr class="danger">
                            <th class="text-left col-md-1">อุณหภูมิ</th>
                            <td><input type="text" name="txtTAir" placeholder="อุณหภูมิใจกลาง" ></td>
                        </tr>
                        <tr class="success">
                            <th class="text-left col-md-1">สถานะ</th>
                            <td><input type="text" name="txtStatus" value="<%=rec.getString("pStatus")%>" disabled></td>
                        </tr>
                        <tr class="info">
                            <th class="text-left col-md-1">ผู้บันทึก</th>
                            <td><input type="text" name="txtsaveMember" value="<%=session.getAttribute("Name")%>"></td>
                        </tr>

                    </thead>
                </table>
                <button type="submit" name="frmAdd" id="addtime" class="btn btn-info btn-sm" formaction="car_check.jsp">CheckCar</button>
                <button type="submit" name="frmOk" id="ok" class="btn btn-success btn-sm" formaction="db_add_all.jsp">OK</button>
            </div>
        </form>
                        <% }

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

    </body>

</html>
<jsp:include page="include/footer.jsp" />


