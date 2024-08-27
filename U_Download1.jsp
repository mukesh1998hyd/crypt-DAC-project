<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@include file="connect.jsp" %>

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
.style7 {color: #997A68}
.style8 {font-size: 14px}
.style9 {font-family: "Times New Roman", Times, serif}
.style10 {color: #FF0000}
.style11 {font-family: "Courier New", Courier, monospace}
.style13 {color: #FF0000; font-weight: bold; }
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
          <h2>Download <span class="style7">Files</span></h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
 
  <%
	try 
	{
	String file = request.getParameter("t1");
	String owner = request.getParameter("t22");
	
	String Rd = request.getParameter("rd");
	String Wr = request.getParameter("wr");
	
	String user=(String)application.getAttribute("ename");

	String sts="Yes";
	String strQ = "select * from userrequest where fnamereq='"+file+"' and username='"+user+"' and resstatus='"+sts+"'";
	ResultSet rs54 = connection.createStatement().executeQuery(strQ);
	if(rs54.next()== true)
	{
	
				String mac="";
				String sk="";
				String oon="";
				String strQuery = "select * from cloudserver where fname='"+file+"'";
				ResultSet rs = connection.createStatement().executeQuery(strQuery);
				{
					if(rs.next()==true)
					{
						oon=rs.getString(2);
						mac=rs.getString(5);
						sk=rs.getString(6);
						
					SimpleDateFormat sdfDate = new SimpleDateFormat(
					"dd/MM/yyyy");
					SimpleDateFormat sdfTime = new SimpleDateFormat(
					"HH:mm:ss");

					Date now = new Date();

					String strDate = sdfDate.format(now);
					String strTime = sdfTime.format(now);
					String dt = strDate + "   " + strTime;	
					String task="Retrieved";
					String strQuery2 = "insert into transaction(user,fname,sk,task,dt) values('"+user+"','"+file+"','"+sk+"','"+task+"','"+dt+"')";
					connection.createStatement().executeUpdate(strQuery2);
					
			%>
			
			<form action="U_Download2.jsp" method="post" name="form1" id="form1">
            <table width="478" border="1" align="center" cellpadding="10" cellspacing="0" bordercolor="#333333">
              <tr>
                <td width="223" bgcolor="#A6EDFF"><span class="style10 style9 style8 style1"><strong>Enter File Name :-</strong></span></td>
                <td width="245"><span class="style11">
                  <label>
                  <input required name="t1" type="text" value="<%=file%>" size="40" readonly="readonly"/>
                  </label>
                </span></td>
              </tr>
				<tr>
		<td width="223" bgcolor="#A6EDFF"><span class="style10 style9 style8 style1"><strong>Enter Owner Name :-</strong></span></td>
		<td width="245"><span class="style11">
		  <label> 
		  <input required name="t22"
			type="text"  size="40" value="<%=oon%>" readonly="readonly"/> 
		  </label>
		</span></td>
	</tr>
			  
              <tr>
                <td height="34" bgcolor="#A6EDFF"><span class="style10 style9 style8 style1"><strong>Trapdoor :-</strong></span></td>
                <td><input name="t12" type="text" value="<%=mac%>" size="40" /></td>
              </tr>
              <tr>
                <td bgcolor="#A6EDFF"><span class="style10 style9 style8 style1"><strong>Secret Key :-</strong></span></td>
                <td><input name="t13" type="text" value="<%=sk%>" size="40" /></td>
              </tr>
              <tr>
                <td bgcolor="#A6EDFF"><span class="style13">Status(Read)</span></td>
                <td><input name="Rd" type="text"   value="<%=Rd%>"  size="40" /></td>
              </tr>
              <tr>
                <td bgcolor="#A6EDFF"><span class="style13">Status(Write)</span></td>
                <td><span class="style11">
                  <input name="Wr" type="text"  value="<%=Wr%>" size="40" />
                </span></td>
              </tr>
              <tr>
                <td bgcolor="#A6EDFF"><div align="right"></div></td>
                <td><span class="style11">
                  <label>
                  <input type="submit" name="Submit2" value="Download" />
                  </label>
                </span></td>
              </tr>
            </table>
            <p>&nbsp;</p>
            <p><p><a href="UserMain.jsp">Back</a></p></p>
			</form>		
			
			<%	
					}
					else
					{
		
						out.println("File Doesn't Exist !!!");
			%>
						<p>&nbsp;</p>
						<p><a href="U_Download.jsp">Back</a></p>
						<%
					}
				}
	}
	else{
		%>
		<h1><%=user %> ur Requested File is not been Permited by Cloud Data Server!!<br/> Please Contact Cloud Admin!!!</h1>
		<p><a href="U_Download.jsp">Back</a></p>
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