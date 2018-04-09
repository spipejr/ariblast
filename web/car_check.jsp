<%@page import="connect.database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
            function startTime()
            {
                
                var a = document.getElementById('idairNo').value;
                var aaa = a.split(",");
                var b = aaa[0];
                
                var c = aaa[1];
                
                var d = document.getElementById('sum').value;
                c = c - d;
                document.getElementById('Reid').value = b;
                
                document.getElementById('Marea').value = c;
                
                
                var t = setTimeout(startTime, 100);
                
            }
           
            
            
            
           
            
            
            
        </script>
    </head>
   <body onload="startTime()">
<%        
            database db = new database();
            db.dbconnect();
            
            
            Statement stmt = (Statement) database.con.createStatement();
            
           Statement stmt2 = (Statement) database.con.createStatement();
            
            String sqlmas = "SELECT * FROM airIN ORDER BY airNo";
            String sql = "SELECT * FROM test ORDER BY id";
            
            ResultSet rec = stmt.executeQuery(sqlmas);
            ResultSet rec2 = stmt2.executeQuery(sql);
            
%>
            
        <form method="POST" action="testdb.jsp">   
            <div class="container">
                <table class="table table-bordered">
                    <thead>
                        <tr class="danger">
                            <th class="text-center">ตู้ที่</th>
                            <th class="text-center">จำนวนที่บรรจุได้ทั้งหมด</th>
                            <th class="text-center">คงเหลือ</th>
                            <th class="text-center">ใส่จำนวนรถ</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="danger">
                            <td class="text-center"><select id = "idairNo" name="airNo">
                                    <%while (rec.next()&&rec2.next())
                                    {
                                        
                                    %>
                                    <option value="<%=rec.getString("airArea")%>,<%=rec2.getString("airArea")%>,<%=rec.getString("airNo")%>"><%=rec.getString("airNo")%></option>
                                    
                                    <%}%>
                            </td>
                                </select>
                                    <td class="text-center"><input type="text" id="Reid" name="Reid" value=""> </input></td>
                                    <td class="text-center"><input type="text" id="Marea" name="Marea" value=""> </input></td>
                                    
                                    <td class="text-center"><input type="text" id="sum" name="sum" value=""> </input></td>
                                </button>
                        </tr>
                    </tbody>
                </table>
            </div>
                            <a href="insert_air_page.jsp">asdasd</a>
        <button type="submit">OK</button>
    </form>
        
    </body>
</html>
