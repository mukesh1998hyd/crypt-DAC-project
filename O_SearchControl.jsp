<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="connect.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Delete</title>
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
.style10 {color: #FFFFFF}
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
		<p class="infopost">&nbsp;</p>
		<p class="infopost">&nbsp;</p>
		<p class="infopost">&nbsp;</p>
          <h2>Search Control<span class="style8"></span> and Dec Key Permitted Files </h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
        <table width="872" border="1" align="center" cellpadding="10" cellspacing="0">
  <tr>
      <td width="99" bgcolor="#FFFF00"><div align="center" class="style15 style13 style7 style18"><strong>User Name </strong></div></td>
   <td width="82" height="32" bgcolor="#FFFF00"><div align="center" class="style15 style13 style7 style18"><strong>File Name </strong></div></td>
    <td width="102" bgcolor="#FFFF00"><div align="center" class="style15 style13 style7 style18"><strong>Owner Name</strong></div></td>
 <td width="94" bgcolor="#FFFF00"><div align="center" class="style15 style13 style7 style18"><strong>Req Date</strong></div></td>
      <td width="94" bgcolor="#FFFF00"><div align="center" class="style15 style13 style7 style18"><strong>Res Date</strong></div></td>
       <td width="112" bgcolor="#FFFF00"><div align="center" class="style15 style13 style7 style18"><strong>Permitted Trapdoor</strong></div></td>
      <td width="89" bgcolor="#FFFF00"><div align="center" class="style15 style13 style7 style18"><strong>Sk</strong></div></td>
   
    <td width="52" bgcolor="#FFFF00"><div align="center" class="style14"><span class="style7">Status</span></div></td>
  </tr>

<%
String oname=(String)application.getAttribute("onname");
	
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;

      	try 
	{
        
          
      		
      		 String status="Waiting";
      		
      		String query="select * from userrequest where ownername='"+oname+"'"; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
		i=rs.getInt(1);
		s2=rs.getString(2);
		s3=rs.getString(3);
		s4=rs.getString(4);
		s5=rs.getString(5);
		s6=rs.getString(6);
		s7=rs.getString(7);
		s8=rs.getString(8);
		s9=rs.getString(9);
		%>

  <tr>
     
    <td height="29"><div align="center" class="style17"><%=s2%></div></td>
    <td><div align="center" class="style17"><%=s3%></div></td>
    <td><div align="center" class="style17"><%=s4%></div></td>
	  <td><div align="center" class="style17"><%=s5%></div></td>
	     <td><div align="center" class="style17"><%=s6%></div></td>
    <td><div align="center" class="style17"><%=s7%></div></td>
	  <td><div align="center" class="style17"><%=s8%></div></td>.
	  	  <td><div align="center" class="style17"><%=s9%></div></td>
  </tr>

<%
	   }
	  
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
</table>
        
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
          <h2 class="star style9"> Menu </h2>
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