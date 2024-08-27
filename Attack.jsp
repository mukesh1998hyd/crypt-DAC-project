<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Attack</title>
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
.style7 {color: #997A68}
.style8 {color: #FF0000}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          
          
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
          <h2>Attack <span class="style7">Files</span></h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
         <%

String a=(String)application.getAttribute("a");
String fn=(String)application.getAttribute("fname");
String fname = request.getParameter("fname");
	

%>
<form action="Attack1.jsp" method="post" name="form1" id="form1">
<table border="0" align="left">
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
       	<tr>
		<td width="223" bgcolor="#FFFF00"><span class="style1 style8"><strong>Enter File Name :-</strong></span></td>
		<td width="245"><label> <input required name="t1"
			type="text"  size="40" /> </label></td>
	</tr>
	<tr>
		<td bgcolor="#FFFF00"><span class="style8"></span></td>
		<td>&nbsp;</td>
	</tr>

	<tr>
		<td bgcolor="#FFFF00"><span class="style1 style8"><strong>Ur Name  :-</strong></span></td>
		<td><input name="ot" type="text" size="40" /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
		
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
		<div align="right"><input type="submit" name="Submit"
			value="Attack" /></div>		</td>
	</tr>
          </table>
          </form>
          
          <div class="clr"></div>
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