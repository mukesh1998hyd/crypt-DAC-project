<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.security.DigestInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.PrintStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.math.BigInteger"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@ include file="connect.jsp"%>
<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>

<%@page import="java.security.MessageDigest"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>



<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Upload</title>
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
.style2 {color: #0066FF}
.style7 {color: #997A68}
.style8 {
	font-family: Euphemia;
	font-size: 36px;
}
-->
</style>
 <script language="javascript" type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("file").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
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
           <li class="active"><a href="DataOwner.jsp"><span>Data Owner </span></a></li>
           <li><a href="EndUser.jsp"><span>Data User </span></a></li>
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
          <h2>Upload<span class="style7"> File</span> </h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
        <%
	try {
	
		long stime=System.currentTimeMillis();
	
		String file = request.getParameter("t42");
		String cont = request.getParameter("text2");
		String mac = request.getParameter("t4");
		String cloud = request.getParameter("cloud");
		
		String user=(String)application.getAttribute("onname");
		
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
		String enc="";
		Statement st22 = connection.createStatement();
		
			Date now = new Date();

			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;

			KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
			Cipher encoder = Cipher.getInstance("RSA");
			KeyPair kp = kg.generateKeyPair();

			Key pubKey = kp.getPublic();

			byte[] pub = pubKey.getEncoded();
			//				System.out.println("PUBLIC KEY" + pub);

			String pk = String.valueOf(pub);
			String rank = "0";
			Statement st = connection.createStatement();

			
			String task = "Upload";

			String ownernam = (String) application.getAttribute("onname");

			String strQuery2 = "insert into transaction(user,fname,sk,task,dt) values('"
					+ user
					+ "','"
					+ file
					+ "','"
					+ pk
					+ "','" + task + "','" + dt + "')";
			connection.createStatement().executeUpdate(strQuery2);
			st
					.executeUpdate("insert into tpaf(fname,ownername,mac,sk,rank,dt) values ('"
							+ file
							+ "','" + ownernam + "','"
							+ mac
							+ "','"
							+ pk
							+ "','"
							+ rank
							+ "','"
							+ dt
							+ "')");
			Statement st2 = connection.createStatement();
			st2
			.executeUpdate("insert into  cloudaudit(ownername,fname,mac,sk,dt) values ('"
					+ ownernam
					+ "','"
					+ file
					+ "','"
					+ mac
					+ "','"
					+ pk
					+ "','"
					+ dt
					+ "')");
			
			
			
			st2
					.executeUpdate("insert into  cloudserver(ownername,fname,ct,mac,sk,rank,dt) values ('"
							+ ownernam
							+ "','"
							+ file
							+ "','"
							+ cont
							+ "','"
							+ mac
							+ "','"
							+ pk
							+ "','"
							+ rank
							+ "','"
							+ dt
							+ "')");
							
							
							
					long etime=System.currentTimeMillis();
					long ttime = etime-stime;
					long tpt=((cont.length())/ttime)*1024;
					
					Statement st1=connection.createStatement();
				st1.executeUpdate("insert into  results values ('"+file+"','"+ttime+"','"+tpt+"')"); 
							
%>
		  <p><h1 class="style8">Data Uploaded Successfully !!!</h1>
		  </p><br />
		<p>  <a href="DataOwnerMain.jsp">BACK</a></p>

		  <%
		 // 	}
		  		connection.close();
		  	}

		  	catch (Exception e) {
		  		out.println(e.getMessage());
		  		e.printStackTrace();
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
          <h2 class="star style2">Main Menu</h2>
          <div class="clr"></div>
              <ul class="sb_menu">
            <li><a href="DataOwnerMain.jsp">Data Owner Main</a></li>
            <li><a href="index.html">Log Out</a></li>
          </ul>
        </div>
        <div class="gadget">
          <h2 class="star style9">Data Owner Menu </h2>
          <div class="clr"></div>
          <ul class="ex_menu">
            <li><a href="O_Upload.jsp">Upload</a></li>
            <li><a href="O_ViewMyFiles.jsp">View My Files </a></li>
            <li><a href="O_ViewMyDetails.jsp">View My Profile </a></li>
            <li><a href="O_VerifyFile.jsp">Verify</a></li>
            <li><a href="O_DeleteFile.jsp">Delete File </a></li>
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