<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="test.jsp">
                <img alt="Brand" src="img/snp.png" width="100%" height="100%">
            </a>
        </div>
        
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> เมนูหลัก<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="insert_air_page.jsp">Air Blast</a></li>
                        <li><a href="insert_product_page.jsp">ผลิตภัณฑ์</a></li>
                        <li><a href="insert_status_page.jsp">สถานะ</a></li>
                    </ul>
                </li>
                <li><a href="insert_all_page.jsp">บันทึกข้อมูล</a></li>
                <li><a href="show_in.jsp">รายการนำเข้า</a></li>
                <li><a href="show_out.jsp">รายการนำออก</a></li>
            </ul>
            
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                     <li><a><span class="glyphicon glyphicon-user"></span> <%=session.getAttribute("Name")%></a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
