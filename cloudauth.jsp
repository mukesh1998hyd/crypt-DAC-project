<title>Authentication Page</title>
<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date" %>
<%
   	String name=request.getParameter("userid");      
   	String pass=request.getParameter("pass");
   	String clname=request.getParameter("cloud");
    try{
    	String am="AmazonEC2Main.jsp";
			application.setAttribute("cloudName",clname);
			
			
			session.setAttribute("cnames",clname);
			String sql="SELECT * FROM apms_cloud where username='"+name+"' and password='"+pass+"' and cname='"+clname+"'";
			Statement stmt = connection.createStatement();
			ResultSet rs =stmt.executeQuery(sql);
			String utype="";
			if(rs.next()){
				
				if(clname.equalsIgnoreCase("Eucalyptus")){
				application.setAttribute("cnames1",clname);
			
					response.sendRedirect("EucalyptusMain.jsp");
				}if(clname.equalsIgnoreCase("Nimbus")){
					application.setAttribute("cnames2",clname);
					response.sendRedirect("NimbusMain.jsp");
				}if(clname.equalsIgnoreCase("Amazon EC2")){
					application.setAttribute("cnames3",clname);
					response.sendRedirect("AmazonEC2Main.jsp");
				}
				
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