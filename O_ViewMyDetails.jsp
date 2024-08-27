<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="connect.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>OPoR: Enabling Proof of Retrievability in Cloud Computing with Resource-Constrained Devices</title>
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
.style8 {font-family: "Times New Roman", Times, serif; font-size: 14px; color: #FF9900; }
.style9 {color: #C2CC06}
.style10 {font-family: "Courier New", Courier, monospace; font-size: 14px; }
.style11 {color: #FFFF00}
.style12 {font-family: "Times New Roman", Times, serif; font-size: 14px; color: #FFFF00; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li><a href="CloudDataServer.jsp"><span>Home Page</span></a></li>
        
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
      <div class="jmainbar">
       
          <h2>&nbsp;</h2>
          <h2>&nbsp;</h2>
          <h2>View<span class="style9"> My File</span> </h2>
          <div class="article">
          <div class="clr"></div>
        <table width="924" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#162D3D">
  	   <tr>
   		 <td width="241" height="32" bgcolor="#FF0000"><div align="center" class="style8 style11"><span class="style3"><b>Owner Image </b></span></div></td>
    	 <td width="168" bgcolor="#FF0000"><div align="center" class="style12"><span class="style3"><b>Owner Name </b></span></div></td>
         <td width="154" bgcolor="#FF0000"><div align="center" class="style12"><span class="style3"><b>E-Mail</b></span></div></td>
         <td width="102" bgcolor="#FF0000"><div align="center" class="style12"><span class="style3"><b>Mobile</b></span></div></td>
         <td width="102" bgcolor="#FF0000"><div align="center" class="style12"><span class="style3"><b>Address</b></span></div></td>
	     <td width="109" bgcolor="#FF0000"><div align="center" class="style12"><span class="style3"><b>DOB</b></span></div></td>
    	 <td width="124" bgcolor="#FF0000"><div align="center" class="style12"><span class="style3"><b>Location</b></span></div></td>
	     <td width="102" bgcolor="#FF0000"><div align="center" class="style12"><span class="style3"><b>Status</b></span></div></td>
  </tr>
          <%
         	String un=(String) application.getAttribute("onname");
          String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8="",s9,s10,s11,s12,s13="";
        	int i=0,j=0;
        String ii="";
        try{
          Statement st=connection.createStatement();
          String sql="SELECT * FROM owner WHERE name='"+un+"'";
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
              <td><div align="center" class="style10">
                  <input  name="image" type="image" src="images.jsp?imgid=<%=i%>" width="100" height="100" alt="Submit" />
              </div></td>
              <td><div align="center" class="style10"><%=s2%></div></td>
              <td><div align="center" class="style10"><%=s3%></div></td>
              <td><div align="center" class="style10"><%=s4%></div></td>
              <td><div align="center" class="style10"><%=s5%></div></td>
              <td><div align="center" class="style10"><%=s6%></div></td>
              <td><div align="center" class="style10"><%=s7%></div></td>

              <td><div align="center" class="style10"><%=s10 %></div></td>
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
          <div class="clr"></div>
          <p>&nbsp;</p>
          <p><a href="DataOwnerMain.jsp">Go Back</a>
            </p>
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