<%-- 
    Document   : incident_reg
    Created on : Mar 15, 2016, 6:21:43 PM
    Author     : saurav gupta
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Incident Register</title>
        
<style>
.dropbtn 
{
    background-color: #4CAF50;  
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
input#round
{
    width:52px; /*same as the height*/
    height:55px; /*same as the width*/
    background-color:lightsalmon;
    border:1px solid #ff0000; /*same colour as the background*/
    color:#fff;
    font-size:.9em;
/*set the border-radius at half the size of the width and height*/
   -webkit-border-radius: 50px;
   -moz-border-radius: 50px;
    border-radius: 50px;
/*drop shadow*/
   -webkit-box-shadow: 0 0 10px rgba(0,0,0, .75);
   -moz-box-shadow: 0 0 10px rgba(0,0,0, .75);
    box-shadow: 2px 2px 15px rgba(0,0,0, .75);
}
input#round:hover
{
    background:#c20b0b;
    border:1px solid #c20b0b;
/*reduce the size of the shadow to give a pushed effect*/
   -webkit-box-shadow: 0px 0px 5px rgba(0,0,0, .75);
   -moz-box-shadow: 0px 0px 5px rgba(0,0,0, .75);
    box-shadow: 0px 0px 5px rgba(0,0,0, .75);
}
</style>
                
<script>
function validate()
{
    var cat=document.myform.makercategory.value;
    if(cat == ("CATEGORY"))
    {
        alert("Category should not be empty ");
        document.myform.makercategory.focus();
        return false;
    }
    return true;
}               
function myFunction() 
{
    document.getElementById("myDropdown").classList.toggle("show");
}
    window.onclick = function(event) {
    if (!event.target.matches('.dropbtn')) 
    {   
        var dropdowns = document.getElementsByClassName("dropdown-content");
        var i;
        for (i = 0; i < dropdowns.length; i++) 
        {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) 
            {
                openDropdown.classList.remove('show');
            }
        }
    }
}
</script>
</head>
<body bgcolor="#E6E6FA">
        <%
                response.setHeader("Cache-Control","no-cache");
                response.setHeader("Cache-Control","no-store");
                response.setHeader("Pragma","no-cache");
                if((request.getSession(false) !=null ))
                {
                
                //Object username = session.getAttribute("username"); 
                //Object role = session.getAttribute("role"); 
                //out.println("Hello :- "+ "<a href='new_status_maker.jsp'>"+username+"</a>");
                %>
                <% 
                //out.println("Role :-&nbsp;&nbsp;&nbsp;"+role+""); %>
                <div class="dropdown" >
                <button onclick="myFunction()" class="dropbtn"><% Object username = session.getAttribute("username"); out.println("Maker :- "+username); %> </button>
                <div id="myDropdown" class="dropdown-content">
                <a href="index.jsp">Home<%-- Object role = session.getAttribute("role"); out.println(role);--%></a>
                <a href="new_status_maker.jsp">History</a>
                <a href="logout.jsp">Logout</a>
                </div>
                </div>
           
        <center>
            <h2><b>INCIDENT REGISTER</b></h2>
            <form name="myform" action="incident_reg_maker_dbsave.jsp" method="post" onsubmit="return validate()">
            
        <table border="1px">
            
            <tr>
                <th width="100" height="25">Error</th>
                <td width="100" height="25"> <input type="text" size="39" name="makererror" required="" placeholder="Enter the error"></td>
             <tr>
             <tr>
                <th width="100" height="25"></th>
                <td width="100" height="25"></td>
             </tr>
             <tr>
                <th width="100" height="25">Category</th>
                <td width="100" height="25">  <select name="makercategory" required="" style="width: 150px">
                                              <option>CATEGORY</option>
                                              <option>Facebook Status</option>
                                              <option>Upload Pic</option>
                                              <option>Transaction</option>
                                              <option>Bus Ticket</option>
                                              <option>Movie Ticket</option>
                                              <option>Online Shopping</option>
                                              </select>
               </td>
             <tr>
             <tr>
                <th width="100" height="25"></th>
                <td width="100" height="25"></td>
             </tr>
                  <tr>
                <th width="100" height="25">Description</th>
                <td width="150" height="25"><textarea  rows="4" cols="40" name="makerdescription" required="" placeholder="Enter the description"></textarea></td>
             </tr>
                  <tr>
                <th width="100" height="25"></th>
                <td width="150" height="25"></td>
             </tr>
            <tr>
                <th width="100" height="25">Date</th>
                <td width="150" height="25"><input type="date" size="39" name="makerdate" required="" placeholder="Enter the date"></td>
             </tr>
             <tr>
                <th width="100" height="25"></th>
                <td width="150" height="25"></td>
             </tr>
              <tr>
                <th width="100" height="25">Time</th>
                <td width="150" height="25"> <input type="time" size="39" name="makertime" required="" placeholder="Enter the time"></td>
             <tr>
                  <tr>
                <th width="100" height="25"></th>
                <td width="150" height="25"></td>
             </tr>
              <tr>
                <th width="100" height="25"> URL</th>
                <td width="150" height="25"><input type="text" size="39" name="makerurl" required="" placeholder="Enter the URL"></td>
             </tr>
             <tr>
                <th width="100" height="25"></th>
                <td width="150" height="25"></td>
             </tr>
             <tr>
               
                 </table>
            <br>
              <input id="round" type="submit" value="Submit!" />
             
            </form>     
               
        </center>         
        <%
            }
            else
            {
                 response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>
