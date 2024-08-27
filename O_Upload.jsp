<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="connect.jsp" %>

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
.style8 {color: #CCCC33}
.style9 {color: #1E1E1E}
.style10 {font-size: 14px}
.style11 {font-family: "Times New Roman", Times, serif}
.style12 {color: #00CC99}
.style13 {font-family: "Courier New", Courier, monospace}
.style14 {color: #FFFF00}
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
    
		   <li><a href="CloudDataServer.jsp"><span>Cloud  Server </span></a></li>
          
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
          <h2>Upload<span class="style8"> File</span> </h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
         <form id="form1" name="form1" method="post" action="O_Upload1.jsp">
          <table width="598" border="1" align="center" cellspacing="0" cellpadding="10">
            <tr>
              <td width="286" bgcolor="#FF0000"><div align="center" class="style14"><span class="style4 style10 style11 ">Select File :- </span></div></td>
              <td width="356"><input name="t42" type="file" id="file"  onchange="loadFileAsText()" required="required" /></td>
            </tr>
            <tr>
              <td bgcolor="#FF0000" class="style4 style10 style11 style12"><div align="center" class="style14">File Name :- </div></td>
            <td><input name="tt" type="text" id="tt" size="50"/></td>
              </tr>
            <tr>
              <td bgcolor="#FF0000"><div align="center"><span class="style12"><span class="style14"></span></span></div></td>
              <td><span class="style13">
                <textarea name="text" id="textarea" cols="50" rows="15"></textarea>
              </span></td>
            </tr>
            <tr>
              <td bgcolor="#FF0000"><div align="center" class="style14"><span class="style4 style10 style11 ">Trapdoor :- </span></div></td>
              <td><input name="t4" type="text" id="t4" value="" size="50" readonly="readonly" /></td>
            </tr>
			
            <tr>
              <td bgcolor="#FF0000"><div align="center"><span class="style10"><span class="style11"><span class="style12"><span class="style14"></span></span></span></span></div></td>
              <td><input type="submit" name="Submit" value="Encrypt" /></td>
            </tr>
          </table>
          </form></p>
        
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