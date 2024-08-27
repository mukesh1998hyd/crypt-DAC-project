<title>Authentication Page</title>
<%@ include file="connect.jsp"%>
<%@ page import="java.util.Date"%>
<%
   	String name=request.getParameter("userid");      
   	String pass=request.getParameter("pass");
    try{
			
			
			String sql="SELECT * FROM cdata where username='"+name+"' and password='"+pass+"'";
			Statement stmt = connection.createStatement();
			ResultSet rs =stmt.executeQuery(sql);
			String utype="";
			if(rs.next()){
				
								response.sendRedirect("CloudDataServerMain.jsp");
				
			}
			else
			{
				response.sendRedirect("wronglogin.html");
			}
		
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>