<%
            if(null == session.getAttribute("Status"))
            {
                response.sendRedirect("loginpage.jsp");
            }else{
            if (session.getAttribute("Status").equals("2")) 
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
