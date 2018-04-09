<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>  
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
<%
            if(null == session.getAttribute("Status"))
            {
                response.sendRedirect("loginpage.jsp");
            }else{
            if (session.getAttribute("Status").equals("Admin")) 
            {
%>
        <jsp:include page="include/navbarAdmin.jsp" />
<%
        } else {
%>
        <jsp:include page="include/navbar.jsp" />
<%
        }
            }        
%>
    </head>
    <body>
       
        <jsp:include page="include/footer.jsp" />
    </body>
</html>