<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="connect.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Verify</title>
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
.style8 {color: #CCCC33}
.style9 {color: #1E1E1E}
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
          <h2>Verify<span class="style8"> File</span> </h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
        <%
	 	int i;
	 	String s2, s3, s4, s5, s6, s7, s12="", s13="", s14="", s15="", s16="";

	 	try {
	 		String file = request.getParameter("tt");
	
	 		String cn = request.getParameter("cl");

	 		Statement st = connection.createStatement();

	 		String on=(String)application.getAttribute("onname");

	 		String strQuery2 = "select * from tpaf where fname='"
	 				+ file + "' and ownername='" + on + "'";
	 		connection.createStatement();

	 		ResultSet rs = st.executeQuery(strQuery2);
	 		if (rs.next()) {
	 			i = rs.getInt("id");//id
	 			s2 = rs.getString("fname");//fn
	 			s3 = rs.getString("ownername");//cs
	 			s4 = rs.getString("mac");//mac
	 			s5 = rs.getString("sk");//sk
	 			%>

<%
				
	 %> <%
					String strQuery3 = "Select * FROM cloudaudit where fname='"
									+ file + "' and ownername='" + on + "' ";

							Statement st2 = connection.createStatement();

							ResultSet rss = st2.executeQuery(strQuery3);
							if (rss.next()) {
								i = rss.getInt("id");//id
								s12 = rss.getString("ownername");//0name
								s13 = rss.getString("fname");//fn
								s14 = rss.getString("mac");//mac
								s15 = rss.getString("sk");//sk
								
								%>

<%} %>

<%
							
					
							if(s3.equalsIgnoreCase(s12) && s2.equalsIgnoreCase(s13) && s4.equalsIgnoreCase(s14) && s5.equalsIgnoreCase(s15))
							{
							%>
<p>
<h1><%=file %>  is Secured !!!</h1>
</p>
<br />
<p><a
	href="DataOwnerMain.jsp">BACK</a></p>

<%
							}	
							else {
								%>
<p>
<h2><%=file %>  is Attacked by Attacker !!!</h2>
</p>
<br />
<p><a href="ViewCloudFiles.jsp">View Files</a> <a
	href="DataOwnerMain.jsp">BACK</a></p>

<%
				
					 		}
						}
	 					else{
							%>
<p>
<h1><%=file %> in <%=cn %> is Wrong Details !!!</h1>
</p>
<br />
<p><a href="ViewCloudFiles.jsp">View Files</a> <a
	href="DataOwnerMain.html">BACK</a></p>

<%
	 					}	
		  	connection.close();

		  	}catch (Exception e) {
		  		out.println(e.getMessage());
		  		e.printStackTrace();
		  	} %>
        
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