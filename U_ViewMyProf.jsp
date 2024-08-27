<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.sql.*" %>
<%@include file="connect.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>View My Profile</title>
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
.style13 {font-size: 14px; font-family: "Times New Roman", Times, serif; color: #CCFF33; }
.style14 {color: #00FF00}
.style15 {color: #997A68; font-family: "Courier New", Courier, monospace; }
.style17 {color: #FF0000; font-family: "Courier New", Courier, monospace; font-weight: bold; }
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
         
		   <li><a href="CloudDataServer.jsp"><span>Cloud Data Server </span></a></li>
           
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
        <div class="article">
          <h2>&nbsp;</h2>
          <h2>&nbsp;</h2>
          <h2>View<span class="style14"> My Profile</span></h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
           <table width="924" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#162D3D">
  	   <tr>
   		 <td width="241" height="32" bordercolor="#000000" bgcolor="#FF0000"><div align="center" class="style13"><span class="style3"><b>Owner Image </b></span></div></td>
    	 <td width="168" bordercolor="#000000" bgcolor="#FF0000"><div align="center" class="style13"><span class="style3"><b>Owner Name </b></span></div></td>
         <td width="154" bordercolor="#000000" bgcolor="#FF0000"><div align="center" class="style13"><span class="style3"><b>E-Mail</b></span></div></td>
         <td width="102" bordercolor="#000000" bgcolor="#FF0000"><div align="center" class="style13"><span class="style3"><b>Mobile</b></span></div></td>
         <td width="102" bordercolor="#000000" bgcolor="#FF0000"><div align="center" class="style13"><span class="style3"><b>Address</b></span></div></td>
	     <td width="109" bordercolor="#000000" bgcolor="#FF0000"><div align="center" class="style13"><span class="style3"><b>DOB</b></span></div></td>
    	 <td width="124" bordercolor="#000000" bgcolor="#FF0000"><div align="center" class="style13"><span class="style3"><b>Location</b></span></div></td>
	     <td width="102" bordercolor="#000000" bgcolor="#FF0000"><div align="center" class="style13"><span class="style3"><b>Status</b></span></div></td>
  </tr>
          <%
         	String un=(String) application.getAttribute("ename");
          String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8="",s9,s10,s11,s12,s13="";
        	int i=0,j=0;
        String ii="";
        try{
          Statement st=connection.createStatement();
          String sql="SELECT * FROM user WHERE name='"+un+"'";
          ResultSet rs=st.executeQuery(sql);
          if(rs.next())
          {
        	  ii=rs.getString("id");
      		s2=rs.getString("name");
      		s3=rs.getString("email");
      		s4=rs.getString("mobile");
      		s5=rs.getString("addr");
      		s6=rs.getString("dob");
      		s7=rs.getString("location");
      		s9=rs.getString("imagess");
      		s10=rs.getString("status");
      		
      		i=Integer.parseInt(ii);
      %>
            <tr>
              <td><div align="center" class="style15">
                <input  name="image" type="image" src="images1.jsp?imgid=<%=ii%>" width="100" height="100" alt="Submit" />
              </div></td>
              <td><div align="center" class="style17"><%=s2%></div></td>
              <td><div align="center" class="style17"><%=s3%></div></td>
              <td><div align="center" class="style17"><%=s4%></div></td>
              <td><div align="center" class="style17"><%=s5%></div></td>
              <td><div align="center" class="style17"><%=s6%></div></td>
              <td><div align="center" class="style17"><%=s7%></div></td>

              <td><div align="center" class="style17"><%=s10 %></div></td>
            </tr>
            <%
            
            connection.close();
                }
               
          } catch(Exception e)
                {
                  out.println(e.getMessage());
                }
      %>
      </table>
           <p>&nbsp;</p>
           <p>&nbsp;</p>
           <p><a href="UserMain.jsp">Go Back</a>
          </p>
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