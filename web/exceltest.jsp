<%@page import="javax.swing.JFileChooser"%>
<%@ page import="java.io.File" %>
<%@ page import="jxl.Workbook" %>
<%@ page import="jxl.write.Label" %>
<%@ page import="jxl.write.WritableSheet" %>
<%@ page import="jxl.write.WritableWorkbook" %>
<html>
<head>
	
</head>
<body>

<%
	try{

	    String fileName = "/home/pos/Desktop/ddddddd.xls";
//	    
	    WritableWorkbook workbook = Workbook.createWorkbook(new File(fileName));
//	    
	    /*** Sheet 1 ***/
	    WritableSheet ws1 = workbook.createSheet("mySheet1", 0);
	    ws1.addCell(new Label(0,0,"Data 1"));
	    ws1.addCell(new Label(0,1,"Data 2"));
	    ws1.addCell(new Label(0,2,"Data 3"));
	    
          
            
	    /*** Sheet 2 ***/
	    WritableSheet ws2 = workbook.createSheet("mySheet2", 1);
	    ws2.addCell(new Label(0,0,"Data 4"));
	    ws2.addCell(new Label(0,1,"Data 5"));
	    ws2.addCell(new Label(0,2,"Data 6")); 	    
	
	    workbook.write();
	    workbook.close();
	    
	    out.println("Excel file created ");
//                    + "to : " + application.getRealPath(""));
		
	}
	catch (Exception e) {
		e.printStackTrace();
	}

%>
	
</body>
</html>
