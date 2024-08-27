<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<%@page import="java.text.*" %>
<%@page import="java.util.*" %>

<%@page import="java.util.Date"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Request</title>
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
.style17 {
	font-size: 36px;
	font-family: sans-serif;
}
.style18 {
	font-size: 36;
	font-family: sans-serif;
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
          <h2>Request DAC <span class="style8"></span></h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
          
 <% try 
	{
      		
    SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
 	SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
	Date now = new Date();
	String strDate = sdfDate.format(now);
	String strTime = sdfTime.format(now);
	String reqdt = strDate + "   " + strTime;
	
	String username=(String)application.getAttribute("ename");	
	String query="select * from userdacrequest where username='"+username+"' "; 
    Statement st5=connection.createStatement();
    ResultSet rs=st5.executeQuery(query);
String respdate="Waiting for Response";
	String rd="No",wr="No";
	
if ( rs.next() )
{


%>
	<h1 class="style18">Hi Mr.<%=username %> Already Requested  </h1>
	<h3><a href="UserMain.jsp">Back</a></h3>
	 <%

}else{

			Statement stss=connection.createStatement();
			stss.executeUpdate("insert into userdacrequest(username,reqdate,resdate,Rd,wr) values ('"+username+"','"+reqdt+"','"+respdate+"','"+rd+"','"+wr+"')"); 
		
%>
 <h1 class="style18">Hi Mr.<%=username %> :: Request Sent to Admin </h1>
 <h3><a href="UserMain.jsp">Back</a></h3>
 <%
	
}
	   

         connection.close();
          }
         
          catch(Exception e)
          {
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
          <h2 class="star style2">End User Menu</h2>
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