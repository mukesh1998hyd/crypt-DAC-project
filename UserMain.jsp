<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>User Main</title>
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
.style7 {
	color: #997A68;
	font-family: "Curlz MT";
}
.style11 {color: #FFFF00}
.style3 {color: #FF0000;
	font-weight: bold;
	font-style: italic;
}
-->
</style>
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
          <h2>Welcome<span class="style7"> <%=application.getAttribute("ename") %></span> <span class="style11">Data User</span> Main </h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
          <div class="img"><img src="images/img1.jpg" width="630" height="302" alt="" class="fl" /></div>
          <div class="post_content">
            <p align="justify">&nbsp;</p>
          </div>
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
          <h2 class="star style2">End User Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><strong><a href="U_ViewMyProf.jsp">View My Profile</a></strong></li>
			<li><strong><a href="U_ReqSearch.jsp">Send Search Request</a></strong></li>
			 <li><strong><a href="U_Search.jsp">Search File</a></strong></li>
            <li><strong><a href="U_ViewCloudFiles.jsp">View Cloud Files</a></strong></li>
            <li><strong><a href="U_ReqSk.jsp">Request secret Key</a></strong></li>
			 <li><strong><a href="U_ReqDAC.jsp">Request DAC</a></strong></li>
              <li><strong><a href="U_ViewFR.jsp">View Access Control Responses</a></strong></li>
			  
			  
			  
              <li><strong><a href="U_Download.jsp">Download</a></strong></li>
            <li><strong><a href="index.html">Log Out </a></strong></li>
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