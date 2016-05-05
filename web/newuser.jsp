    <%-- 
    Document   : newuser
    Created on : Mar 1, 2016, 3:35:21 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registeration Form</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
           function validate()
           {
               //alert("i have entered ");
               //document.write("helo");
               var a_pass=document.myform.newloginpass.value;
               var a_age=document.myform.newloginage.value;
               var a_mobile=document.myform.newloginmob.value;
               
               if(a_pass.length < 6)
                   {
                       alert("Enter the valid password (atleast 6 digits)");
                       document.myform.newloginpass.focus();
                       return false;
                   }
                if(isNaN(a_age))
                   {
                       alert("Enter your valid age");
                       document.myform.newloginage.focus();
                       return false;
                   }
                   if(a_age<5)
                   {
                       {
                       alert("Enter your valid age");
                       document.myform.newloginage.focus();
                       return false;
                   }
                   }
                   if(a_age>99)
                   {
                       {
                       alert("Enter your valid age");
                       document.myform.newloginage.focus();
                       return false;
                   }
                   }
                   
                       
               if(isNaN(a_mobile))
                   {
                       alert("Enter the valid mobile");
                       document.myform.newloginmob.focus();
                       return false;
                   }
                    if(a_mobile.length !=10)
                   {
                       alert("Enter the valid mobile");
                       document.myform.newloginmob.focus();
                       return false;
                   }
               return true;
               
           }
          
            </script>
            <style>
                .styled-button-5 {
	background-color:orange;
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
    <body bgcolor="#E6E6FA">
        <center>
            <h2><b>Registration Form</b></h2>
        <form name="myform" action="deatail_save.jsp" method="post" onsubmit=" return validate()">
        <table border="1px">
            
            <tr>
                <th width="100" height="25">Username</th>
                <td width="100" height="25"> <input type="text" name="newloginusername" required="" placeholder="Enter a unique username"></td>
             <tr>
                  <tr>
                <th width="100" height="25"></th>
                <td width="100" height="25"></td>
             </tr>
                  <tr>
                <th width="100" height="25">Name</th>
                <td width="150" height="25"> <input type="text" name="newloginname" required="" placeholder="Please enter your name"></td>
             </tr>
                  <tr>
                <th width="100" height="25"></th>
                <td width="150" height="25"></td>
             </tr>
            <tr>
                <th width="100" height="25">Password</th>
                <td width="150" height="25"><input type="password" name="newloginpass" required="" placeholder="Enter your password"></td>
             </tr>
             <tr>
                <th width="100" height="25"></th>
                <td width="150" height="25"></td>
             </tr>
              <tr>
                <th width="100" height="25">Role</th>
                <td width="150" height="25"> <input type="radio" name="newloginrole" value="approver" required="">Approver&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="newloginrole" value="maker" required="">Maker</td>
             <tr>
                  <tr>
                <th width="100" height="25"></th>
                <td width="150" height="25"></td>
             </tr>
              <tr>
                <th width="100" height="25">Email</th>
                <td width="150" height="25"><input type="email" name="newloginemail" required="" placeholder="Please enter your email"></td>
             </tr>
             <tr>
                <th width="100" height="25"></th>
                <td width="150" height="25"></td>
             </tr>
             <tr>
                <th width="100" height="25">Gender</th>
                <td width="150" height="25"><input type="radio" name="newlogingender" value="male" required="">Male&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="newlogingender" value="female" required="">Female</td>
             </tr>
             <tr>
                <th width="100" height="25"></th>
                <td width="150" height="25"></td>
             </tr>
              <tr>
                <th width="100" height="25">Age</th>
                <td width="150" height="25"> <input type="text" name="newloginage" required="" placeholder="Enter your age"></td>
             </tr>
             <tr>
                <th width="100" height="25"></th>
                <td width="150" height="25"></td>
             </tr>
             
              <tr>
                <th width="100" height="25">Mobile</th>
                <td width="150" height="25"><input type="text" name="newloginmob" required="" placeholder="Enter your contact number"></td>
             </tr>
                 </table>
            <br>
              <input type="submit" class="styled-button-5" value="Submit"/>
             
            </form>     
               
        </center>         
            
        
    </body>
</html>
