<%-- 
    Document   : index
    Created on : Mar 1, 2016, 3:14:50 PM
    Author     : admin
--%>

<%@page import="org.apache.catalina.SessionListener"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Incident Management</title>
        <style>
                
        .styled-button-5 {
	background-color:lightsalmon;
	color:#fff;
	font-family:'Helvetica Neue',sans-serif;
	font-size:12px;
	line-height:20px;
	border-radius:20px;
	-webkit-border-radius:20px;
	-moz-border-radius:20px;
	border:0;
	text-shadow:#C17C3A 0 -1px 0;
	width:80px;
	height:20px
    }
                </style>
    </head>
    <body bgcolor="lightyellow">
        <center>
        <font size="4"><b><h1>INCIDENT MANAGEMENT SYSTEM</h1></b></font>
       <%-- out.println(NewServletListener.get_count());  --%>
        
        <br><br><br>
        <form action="login_validate.jsp" method="post">
        <table border="1px">
            
           <tr>
                <th width="100" height="25">Username</th>
                <td width="100" height="25"> <input type="text" name="newloginname" required="" placeholder="Enter your Username"></td>
             </tr>
             <tr>
                <th width="100" height="25"></th>
                <td width="100" height="25"></td>
             </tr>
             <tr>
                <th width="100" height="25">Password</th>
                <td width="100" height="25"> <input type="password" name="newloginpass" required="" placeholder="Enter your 6 digit password"></td>
             </tr>
             <tr>
                <th width="100" height="25"></th>
                <td width="100" height="25"></td>
             </tr>
             <tr>
                <th width="100" height="25">Role</th>
                <td width="100" height="25"> <input type="radio" name="newloginrole" value="approver" required="">Approver&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="newloginrole" value="maker" required="">Maker</td>
             </tr>
            
        </table>
        <br>
        
        <input type="submit" class="styled-button-5" value="Login" />
        <br>
        <a href="newuser.jsp"><h2>New User Click Here</h2></a>
          </form>
        </center>    
    </body>
</html>
