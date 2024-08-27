<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*" %>
<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date" %>
<title>User Register</title>
<%
	ArrayList list = new ArrayList();
	ServletContext context = getServletContext();
	String dirName =context.getRealPath("Gallery/");
	String paramname = null;
	String uname = "", pass = null, email = null, mobile = null, address = null,intr=null;;
	String dob = null, gender = null, pincode = null, location = null, image = null;
	File file1 = null;
	FileInputStream fs = null, fs1 = null;
	try {
		MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB
		Enumeration params = multi.getParameterNames();
		while (params.hasMoreElements()) {
			paramname = (String) params.nextElement();
			if (paramname.equalsIgnoreCase("userid")) {
				uname = multi.getParameter(paramname);
			}
			if (paramname.equalsIgnoreCase("pass")) {
				pass = multi.getParameter(paramname);
			}
			if (paramname.equalsIgnoreCase("email")) {
				email = multi.getParameter(paramname);
			}
			if (paramname.equalsIgnoreCase("mobile")) {
				mobile = multi.getParameter(paramname);
			}
			if (paramname.equalsIgnoreCase("address")) {
				address = multi.getParameter(paramname);
			}
			if (paramname.equalsIgnoreCase("dob")) {
				dob = multi.getParameter(paramname);
			}
			if (paramname.equalsIgnoreCase("gender")) {
				gender = multi.getParameter(paramname);
			}
			if (paramname.equalsIgnoreCase("pin")) {
				pincode = multi.getParameter(paramname);
			}
			if (paramname.equalsIgnoreCase("loc")) {
				location = multi.getParameter(paramname);
			}
		
			if (paramname.equalsIgnoreCase("pic")) {
				image = multi.getParameter(paramname);
			}
		}
		int f = 0;
		Enumeration files = multi.getFileNames();
		while (files.hasMoreElements()) {
			paramname = (String) files.nextElement();
			if (paramname.equals("d1")) {
				paramname = null;
			}

			if (paramname != null) {
				f = 1;
				image = multi.getFilesystemName(paramname);
				String fPath = context.getRealPath("Gallery\\" + image);
				file1 = new File(fPath);
				fs = new FileInputStream(file1);
				list.add(fs);

				String query1 = "SELECT * FROM owner WHERE name='"
						+ uname + "' ";
				Statement st1 = connection.createStatement();
				ResultSet rs1 = st1.executeQuery(query1);
				if (rs1.next()) {
					out.print("UserNmae Already Exists");
%>
					<p><a href="Register.jsp">Back</a>  <a href="index.html">Home</a> </p>
<%
	} else {
					PreparedStatement ps = connection
							.prepareStatement("INSERT INTO owner(name,pass,email,mobile,addr,dob,gender,pin,location,imagess,status) values(?,?,?,?,?,?,?,?,?,?,?) ");
					ps.setString(1, uname);
					ps.setString(2, pass);
					ps.setString(3, email);
					ps.setString(4, mobile);
					ps.setString(5, address);
					ps.setString(6, dob);
					ps.setString(7, gender);
					ps.setString(8, pincode);
					ps.setString(9, location);
					ps.setString(11,"Waiting");
					if (f == 0)
						ps.setObject(10, null); 
					else if (f == 1) {
						fs1 = (FileInputStream) list.get(0);
						ps.setBinaryStream(10, fs1, fs1.available());
					}
					int x = ps.executeUpdate();
					if (x > 0) {
						out.print("Registered Successfully!!!!");
						String suc="Registered Successfully!!!!";
						application.setAttribute("msg",suc);
						
%>
<p><a href="Register.jsp">Back</a> <a href="index.html">Home</a></p>
<%
	}

				}

			}
		}

	} catch (Exception e) {
		e.printStackTrace();
		out.print(e.getMessage());
	}
%>

