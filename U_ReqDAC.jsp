<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="connect.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Request Data Access Control</title>
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
.style8 {color: #009966}
.style9 {font-size: 14px}
.style16 {
	color: #003366;
	font-size: 26px;
}
.style19 {font-family: "Times New Roman", Times, serif}
.style22 {color: #FF99CC}
.style24 {font-size: 14px; font-family: "Times New Roman", Times, serif; font-weight: bold; color: #003399; }
.style25 {color: #003399}
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
          <h2>Request Data Access Control(DAC)<span class="style8"></span></h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
		  
		  
		  
		  
          <form id="form1" name="form1" method="post" action="U_requestDAC.jsp">
<table width="598" border="0" align="center" cellspacing="0" cellpadding="7">

	<tr>
		<td colspan="2" class="style4">&nbsp;</td>
		</tr>
	

	<tr>
		<td>&nbsp;</td>
		<td><p>
		  <input name="Submit" type="submit" value="Request DAC" />
		</p>
		  <p>
		  
		  </p>
		  <p><a href="UserMain.jsp">Back </a></p></td>
	</tr>
</table>
<p><%
		  String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;

      	try 
	{
           String uname=(String)application.getAttribute("ename");
		   String status="No";
		   String query="select * from userdacrequest where username='"+uname+"' "; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
		if( rs.next() )
	     {
		
		  s2=rs.getString(2);
		  s5=rs.getString(5);
		  s6=rs.getString(6);
		  %>
		 <h2><%out.println("YOUR ACCESS CONTROL ARE...."); 
		 out.println("Reading::"+s5);%> </br> 
		 <%out.println("Writing:: "+s6);
		 
		 %></h2>
		 <%}
		
     }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
		  
		  %></p>
<p>&nbsp;</p>
          </form>
          
          <div class="clr"></div>
        </div>
     
      </div>
      <div class="sidebar">
        <div class="searchform">
         
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