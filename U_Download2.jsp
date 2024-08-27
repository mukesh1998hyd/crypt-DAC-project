<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Download</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-aller.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style2 {color: #CC3333}
.style8 {color: #00FF66}
.style9 {
	font-family: "Courier New", Courier, monospace;
	color: #003366;
}
.style10 {font-family: "Curlz MT"}
.style11 {font-family: "Times New Roman", Times, serif}
-->
</style>
   <script type='text/javascript'>

function saveTextAsFile()
{
	var textToWrite = document.getElementById("textarea").value;
	var textFileAsBlob = new Blob([textToWrite], {type:'text/plain'});
	var fileNameToSaveAs =document.getElementById("fn").value;

	var downloadLink = document.createElement("a");
	downloadLink.download = fileNameToSaveAs;
	downloadLink.innerHTML = "Download File";
	if (window.webkitURL != null)
	{
		// Chrome allows the link to be clicked
		// without actually adding it to the DOM.
		downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
	}
	else
	{
		// Firefox requires the link to be added to the DOM
		// before it can be clicked.
		downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
		downloadLink.onclick = destroyClickedElement;
		downloadLink.style.display = "none";
		document.body.appendChild(downloadLink);
	}

	downloadLink.click();
}

function destroyClickedElement(event)
{
	document.body.removeChild(event.target);
}



</script>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li><a href="U_Upload.jsp"><span>Upload</span></a></li>
        
		   <li><a href="CloudDataServer.jsp"><span>Cloud Server </span></a></li>
           
           <li><a href="DataOwner.jsp"><span>Data Owner </span></a></li>
           <li class="active"><a href="EndUser.jsp"><span>Data User </span></a></li>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"><a href="#"><img src="images/slide1.jpg" width="940" height="271" alt="" /></a> <a href="#"><img src="images/slide2.jpg" width="940" height="271" alt="" /></a> <a href="#"><img src="images/slide3.jpg" width="940" height="271" alt="" /></a></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2>Download <span class="style8">Files</span></h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
  <%
		   	try {
		   		String file = request.getParameter("t1");
		   		String mac = request.getParameter("t12");
		   		String sk = request.getParameter("t13");
				String Rd = request.getParameter("Rd");
				String Wr = request.getParameter("Wr");

		   		application.setAttribute("file2", file);
		   		application.setAttribute("sk2", sk);

		   		String strQuery = "select * from cloudserver where fname='"
		   				+ file
		   				+ "' and  mac='"
		   				+ mac
		   				+ "' and  sk='" + sk + "'";
		   		String strQuery1 = "select * from cloudserver where fname='"
		   				+ file + "'";

		   		ResultSet rs = connection.createStatement().executeQuery(
		   				strQuery);
		   		{
		   			if (rs.next() == true) {
		   				ResultSet rs1 = connection.createStatement()
		   						.executeQuery(strQuery1);
		   				{
		   					if (rs1.next() == true) {
		   						String rank = rs1.getString(7);
		   					//	int r=Integer.parseInt(rank);
		   %>
					
						<%
					int updaterank = Integer.parseInt(rank)+ 1;
						%>
					
						<%
												String strQuery2 = "update cloudserver set rank='"
														+ updaterank
														+ "' where fname='"
														+ file+ "'";
						%>

						<%
												connection.createStatement().executeUpdate(
														strQuery2);
						%>
			
						<%
							String ct = rs.getString(4);

						String enc="";
						Statement st22 = connection.createStatement();
						
						
												String keys="q2e34rrfgfgfgg2a";
												byte[] keyValue1 = keys.getBytes();
												Key key1 = new SecretKeySpec(keyValue1, "AES");
												Cipher c1 = Cipher.getInstance("AES");
												c1.init(Cipher.DECRYPT_MODE, key1);
												
												String decryptedValue = new String(Base64
														.decode(ct.getBytes()));
						%>
			
		  </p>
		  
		  
		   <% if(Rd.equals("Permited") && Wr.equals("No"))
		   {%>
		  <p align="center" class="style1 style11">File Contents</p>
		  <td> 
		  <input type="hidden" id="fn" value="<%=file %>" ></input></td>
		    <label>
	            <div align="center">
	            
	              <textarea name="text" id="textarea" cols="45" rows="17"><%=decryptedValue%></textarea>
	              <br/>
	              <br/>	
				    <td><button>Only Permission For Reading Data </button></td>			  
				  <%}
				  
				  else if(Rd.equals("No") && Wr.equals("Permited") )
				  {%>
				   <input type="hidden" id="fn" value="<%=file %>" ></input></td>
		    <label>
	            <div align="center">
	            
	              <textarea name="text" id="textarea" cols="45" rows="17"><%=decryptedValue%></textarea>
	              <br/>
	              <br/>
	              <td><button onClick="saveTextAsFile()">Download and Write Data</button></td>
				  <%}
				  
				   else if(Wr.equals("Permited")&& Rd.equals("Permited"))
				  {%>
				   <input type="hidden" id="fn" value="<%=file %>" ></input></td>
		    <label>
	            <div align="center">
	            
	              <textarea name="text" id="textarea" cols="45" rows="17"><%=decryptedValue%></textarea>
	              <br/>
	              <br/>
	              <td><button onClick="saveTextAsFile()">Download and Write Data</button></td>
				  <%}
				  
				   else if(Wr.equals("No")&& Rd.equals("No"))
				  {%>
				   
				   <h2> No Permission Either for Reading Or For Writing
				   
				  <%}%>
				  
				  <p><a href="UserMain.jsp">Back</a></p>
          </div>
		    </label>
		  <p align="center">&nbsp; </p>
		  <p>
		    <%
		    	} else {
		    %>
	      </p>
		  <p>
		  <h1 class="style1 style10">File Doesn't Exist !!!</h1>
		  </p><br />
						<p><a href="Download.jsp">Back</a></p>
	<%
		}
					}
				} else {
					SimpleDateFormat sdfDate = new SimpleDateFormat(
							"dd/MM/yyyy");
					SimpleDateFormat sdfTime = new SimpleDateFormat(
							"HH:mm:ss");

					Date now = new Date();

					String strDate = sdfDate.format(now);
					String strTime = sdfTime.format(now);
					String dt = strDate + "   " + strTime;

					String user = (String) application
							.getAttribute("ename");
String type="Wrong Credentials";
					String strQuery2 = "insert into attacker(user,fname,sk,type,dt) values('"
							+ user
							+ "','"
							+ file
							+ "','"
							+ sk
							+ "','"+type+"','"
							+ dt
							+ "')";
					connection.createStatement().executeUpdate(strQuery2);
	%>
	      </p>
		  <p>
		  <h1 class="style1 style10">Trapdoor / Secret Key Mismatch !!!</h1>
		  </p><br />
						<p><a href="UserMain.jsp">Back</a></p>
	<%
		}
			}
			connection.close();
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	%>

          <div class="clr"></div>
        </div>
     
      </div>
         <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            <span>
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
            </span>
            <input name="button_search" src="images/search.gif" class="button_search" type="image" />
          </form>
        </div>
        <div class="clr"></div>
        <div class="gadget">
          <h2 class="star style2">Data User Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="UserMain.jsp">User Main</a></li>
            <li><a href="index.html">Log Out </a></li>
          </ul>
        </div>
         </div>
         <div class="clr"></div>
    </div>
  </div>
   <div class="fbg">
    <div class="fbg_resize">
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center></div>
</body>
</html>