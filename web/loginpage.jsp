<%@page import="connect.database"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <style>
            .top { margin-top:50px; }
        </style>
    </head>
    <body>
        <div class="container ">
            <div class ="row top" >
                <div class="col col-md-4 col-md-offset-4">
                    <div class="card">
                        <div class="card-header text-center">
                            <div class="text-center">
                                <img src="img/snp.png" class="img-thumbnail" alt="Cinque Terre"></div>
                            <label>LOGIN</label>
                        </div>
                        <form name="frmLogin" method="post" action="loginpage.jsp?Action=Login">
                            <div class="card-body">
                                <div class="form-group row">
                                    <label for="username">Username</label>
                                    <input type="text" class="form-control" id="txtUsername" name="txtUsername" placeholder="Enter Username" required>
                                </div>
                                <div class="form-group row">
                                    <label for="username">Password</label>
                                    <input type="password" class="form-control" id="txtPassword" name="txtPassword" placeholder="Enter Password" required>
                                </div>
                            </div>
                            <div class="card-footer text-center">
                                <input type="submit" name="submit" class="btn btn-success" value="OK">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="container text-center">
            <%
                database db = new database();
                db.dbconnect();
                
                if (request.getParameter("Action") != null) {
                   

                    try {
                        
                        Statement stmt = (Statement) database.con.createStatement();
                        

                        String strUsername = request.getParameter("txtUsername");
                        String strPassword = request.getParameter("txtPassword");

                        

                        String sql = "SELECT * FROM  member WHERE "
                                + " Username = '" + strUsername + "' AND "
                                + " Password = '" + strPassword + "' ";
                        ResultSet rec = stmt.executeQuery(sql);
                        

                        if (!rec.next()) {
                            out.print("<font color=red>Username and Password Incorrect!</font>");
                        } else {
                            rec.first();
                            session.setAttribute("Status", rec.getString("Status"));
                            session.setAttribute("Name", rec.getString("Name"));
                            response.sendRedirect("test.jsp");
                        }

                    } catch (Exception e) {
                        
                        out.println(e.getMessage());
                        e.printStackTrace();
                    }

                    

                }

            %>
        </div>
    </body>
</html>

