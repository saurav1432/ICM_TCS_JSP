<%-- 
    Document   : deatail_save
    Created on : Mar 1, 2016, 4:12:19 PM
    Author     : saurav gupta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="java.io.* "%>
<%@ page import="java.sql.* "%>
     
<style>
.topcorner
{
    position:absolute;
    top:10;
    right:15;
}
.dropbtn 
{
    background-color: #4CAF5;  
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus 
{
    background-color: #3e8e41;
}

.dropdown 
{
    position: relative;
    display: inline-block;
}

.dropdown-content 
{
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    overflow: auto;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.dropdown-content a 
{
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown a:hover {background-color: #f1f1f1}

.show {display:block;}
.styled-select select 
{
   background: transparent;
   width: 268px;
   padding: 5px;
   font-size: 16px;
   line-height: 1;
   border: 0;
   border-radius: 0;
   height: 34px;
   -webkit-appearance: none;
}
.styled-select 
{
    width: 240px;
    height: 34px;
    overflow: hidden;
    background: url(images/down_arrow_select.jpg) no-repeat right #ddd;
    border: 1px solid #ccc;
}
input#submitbutton 
{
border:2px groove #7c93ba;
cursor:pointer;
padding: 5px 25px;
background-color:#6b6db; 
background: -webkit-gradient(linear, left top, left bottom, from(#88add7), to(#6b6dbb));
background: -webkit-linear-gradient(top, #88add7, #6b6dbb);
background: -moz-linear-gradient(top, #88add7, #6b6dbb);
background: -o-linear-gradient(top, #88add7, #6b6dbb);
background: linear-gradient(top, #88add7, #6b6dbb);
font-family:Andika, Arial, sans-serif; 
color:#fff;
font-size:1.1em;
letter-spacing:.1em;
font-variant:small-caps;
-webkit-border-radius: 0 15px 15px 0;
-moz-border-radius: 0 15px 15px 0;
border-radius: 0 15px 15px 0;
-webkit-box-shadow: rgba(0, 0, 0, .75) 0 2px 6px;
-moz-box-shadow: rgba(0, 0, 0, .75) 0 2px 6px;
box-shadow: rgba(0, 0, 0, .75) 0 2px 6px;
}
input#submitbutton:hover, input#submitbutton:focus 
{
color:#edebda;
-webkit-box-shadow: rgba(0, 0, 0, .25) 0 1px 0px;
-moz-box-shadow: rgba(0, 0, 0, .25) 0 1px 0px;
box-shadow: rgba(0, 0, 0, .25) 0 1px 0px;
}
</style>

<script>
function validate()
{
    var user=document.myform.list_username.value;
    var cat=document.myform.list_category.value;
    var status=document.myform.list_status.value;
    if(user == ("USERNAME"))
    {
        alert("Username should not be empty ");
        document.myform.list_username.focus();
        return false;
    }
    if(cat == ("CATEGORY"))
    {
        alert("Category should not be empty ");
        document.myform.list_category.focus();
        return false;
    }
    if(status == ("STATUS"))
    {
         alert("Status should not be empty ");
         document.myform.list_status.focus();
         return false;
    }   
    return true;
}
function myFunction() 
{
    document.getElementById("myDropdown").classList.toggle("show");
}
window.onclick = function(event) 
{
    if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
    var openDropdown = dropdowns[i];
    if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
</script>
</head>


<body>
    <%
            response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
            response.addHeader("Pragma", "no-cache"); 
            response.addDateHeader ("Expires", 0);
            if((request.getSession(false) !=null )){
     %> 
             <div class="dropdown" >
                <button onclick="myFunction()" class="dropbtn"><% Object username = session.getAttribute("username"); out.println("Approver :- "+username); %> </button>
                <div id="myDropdown" class="dropdown-content">
                <a href="index.jsp">Home<%-- Object role = session.getAttribute("role"); out.println(role);--%></a>
                <a href="logout.jsp">Logout</a>
                <a href="#contact">Contact</a>
                </div>
             </div>
<%
            }
           try{
           int i=0;
           String driver="oracle.jdbc.driver.OracleDriver" ;
           String url="jdbc:oracle:thin:@localhost:1521:xe";
           String user="system";
           String pass="saurav";
           //out.println("2.succes login");
           Class.forName(driver);
           Connection con=DriverManager.getConnection(url,user,pass);
           Statement st=con.createStatement();
           String sql="select * from incident where role='maker'";
           ResultSet rs=st.executeQuery(sql);
%>
<center>
<h1>SELECT THE OPTIONS BELOW</h1>
<br><br><br>
<div class="styled-select">
<form name="myform" action="new_incident_reg_approver.jsp" method="post" onsubmit="return validate()">
   <select name="list_username">
   <option>USERNAME</option>
   <option>ALL</option>
   <%  
      while(rs.next()) 
      {  
   %>
   <option> <% out.print(rs.getString(1)); %> </option>
   <% 
      } 
   %>
   </select>
</div>
<br><br>  
<div class="styled-select">
   <select name="list_category" required="">
      <option>CATEGORY</option>
      <option>ALL</option>
      <option>Facebook Status</option>
      <option>Upload Pic</option>
      <option>Transaction</option>
      <option>Bus Ticket</option>
      <option>Movie Ticket</option>
      <option>Online Shopping</option>
   </select>
</div>    
<br><br>  
<div class="styled-select">
   <select name="list_status">
      <option>STATUS</option>
      <option>ALL</option>
      <option>PROCESSED</option>
      <option>UNDER PROCESS</option>
   </select>
</div>    
<br><br>
<input id="submitbutton" type="submit" value="Submit">
</form>
<center>
    <%
            }
             catch(Throwable e)
          { out.println("error is "+e);  }
    %>
</body>
</html>
