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

<html xmlns="http://www.w3.org/1999/xhtml">
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
.style8 {font-family: "Times New Roman", Times, serif}
.style9 {font-size: 14px}
.style10 {font-size: 14}
.style12 {color: #FFFF00}
.style13 {color: #FFFF00; font-weight: bold; }
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
         
		   <li><a href="CloudDataServer.jsp"><span>Cloud Data Server </span></a></li>
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
         <% try 
	{
      		String file=request.getParameter("tt");
      		String cont=request.getParameter("text");
      		String keys = "";
      		String h1="";
      		String filename="filename.txt";
      		//to get Enc Key
      		
      		
      		//now key var consist of enc key
      		String cname=(String)application.getAttribute("ownercloud");
			keys="q2e34rrfgfgfgg2a";
      			byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.ENCRYPT_MODE, key);
      			String encryptedValue = new String(Base64.encode(cont.getBytes()));
      		//D:/Workspace Jayam/SelCSp/WebContent
      		
      		PrintStream p = new PrintStream(new FileOutputStream(filename));
			p.print(new String(cont));
			
			MessageDigest md = MessageDigest.getInstance("SHA1");
			FileInputStream fis11 = new FileInputStream(filename);
			DigestInputStream dis1 = new DigestInputStream(fis11, md);
			BufferedInputStream bis1 = new BufferedInputStream(dis1);
 
			//Read the bis so SHA1 is auto calculated at dis
			while (true) {
				int b1 = bis1.read();
				if (b1 == -1)
					break;
			}
 
			BigInteger bi1 = new BigInteger(md.digest());
			String spl1 = bi1.toString();
			h1 = bi1.toString(16);
			
      		Statement st=connection.createStatement();
      		String sql="select * from cloudserver where fname='"+file+"'";
      		ResultSet rs=st.executeQuery(sql);
			if(!(rs.next())){
	
%>

<form action="O_Upload2.jsp" method="post">
<table width="598" border="1" align="center" cellpadding="10" cellspacing="0">

	<tr>
		<td width="286" bgcolor="#FF0000"><div align="center" class="style13"><span class="style10 style8 style4">File Name :- </span></div></td>
		<td width="356"><input name="t42" type="text" id="t42" size="50"
			value="<%= file %>" readonly="readonly" /></td>
	</tr>
	<tr>
		<td width="286" bgcolor="#FF0000"><div align="center" class="style13"><span class="style10 style8 style4">Data Content :- </span></div></td>
		<td><textarea name="text1" cols="50" rows="15" readonly><%= cont %></textarea></td>
	</tr>
	<tr>
		<td width="286" bgcolor="#FF0000"><div align="center" class="style13"><span class="style10 style8 style4">Enc Content :- </span></div></td>
		<td><textarea name="text2" cols="50" rows="15" readonly><%= encryptedValue %></textarea></td>
	</tr>
	<tr>
		<td bgcolor="#FF0000"><div align="center" class="style13"><span class="style10 style8 style4">Trapdoor: </span></div></td>
		<td><input name="t4" type="text" id="t4" size="50"
			value="<%= h1 %>" readonly="readonly" /></td>
	</tr>
	
	
	<tr>
		<td bgcolor="#FF0000"><div align="center"></div></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td bgcolor="#FF0000">
		  <div align="center"></div></td>
		<td><input type="submit" name="Submit2" value="Upload" /></td>
	</tr>
</table>
</form>
<%

	   
			}else
			{
				%>
				<h2>File already Uploaded </h2>
				<%
			}
         connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%></p>
        
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