<%-- 
    Document   : status_maker
    Created on : Mar 15, 2016, 11:10:19 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ page import="java.io.* "%>
        <%@ page import="java.sql.* "%>
        <title>Status Page</title>
       <style>
            .dropbtn {
    background-color: #4CAF5;  
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus {
    background-color: #3e8e41;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    overflow: auto;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.dropdown-content a {
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
    function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
    }
window.onclick = function(event) {
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
            if((request.getSession(false) !=null ))
            {
            //Object username = session.getAttribute("username"); 
            //Object role = session.getAttribute("role"); 
            //out.println("Hello :- "+ "<a href='new_status_maker.jsp'>"+username+"</a>"); 
            //out.println("Role :-&nbsp;&nbsp;&nbsp;"+role+"");
            int i=0;
             //out.println(username);
            // out.println("Hello :- "+ "<a href='update_details.jsp'>"+username+"</a>");
         %>
             <div class="dropdown" >
                <button onclick="myFunction()" class="dropbtn"><% Object username = session.getAttribute("username"); out.println("Maker :- "+username); %> </button>
                <div id="myDropdown" class="dropdown-content">
                <a href="index.jsp">Home<%-- Object role = session.getAttribute("role"); out.println(role);--%></a>
                <a href="new_status_maker.jsp">History</a>
                <a href="logout.jsp">Logout</a>
                </div>
             </div>
            <CENTER><h2> STATUS OF ERROR BY MAKER    </h2></CENTER>
         <%
            try{
            String driver="oracle.jdbc.driver.OracleDriver" ;
            String url="jdbc:oracle:thin:@localhost:1521:xe";
            String user="system";
            String pass="saurav";
            //out.println("2.succes login");
            Class.forName(driver);
            Connection con=DriverManager.getConnection(url,user,pass);
            Statement st=con.createStatement();
            String sql="select * from incident_reg";
            ResultSet rs=st.executeQuery(sql);
            int j=0;
            %>
           
            <center>
               
            <table border="1px">
                <th width="60" height="25">S.NO </th>
                <th width="200" height="25">ERROR </th>
                <th width="100" height="25">CATEGORY </th>
                <th width="200" height="25">DESCRIPTION</th>
                <th width="50" height="25">URL</th>
                <th width="200" height="25">DATE</th>
                <th width="200" height="25">TIME</th>
                <th width="200" height="25">STATUS</th>
                <th width="200" height="25">UPDATE</th>
            <%
            while(rs.next())
            {
               String a8=rs.getString(1);  // primary key
               String a1=rs.getString(2); // username
               String a2=rs.getString(3); // error
               String a3=rs.getString(8); // status
               String a4=rs.getString(4); //  description
               String a5=rs.getString(5); //date
               String a6=rs.getString(6); //time
               String a7=rs.getString(7); //url
               String a9=rs.getString(9); //category
               if(a1.equals(username))
               {
                   //out.println(" hello ");
                   session.setAttribute("date_reg", a5);
                   session.setAttribute("time", a6);
                   //Object date_reg = session.getAttribute("date_reg");
                   //out.println(date_reg);
                   //out.println(time);
                   i++;
               %>
               <form  action="status_maker_update.jsp" method="post" >
                   <tr>
                   <td width="200" height="25"><center><% out.println(i);%></center></td>    
                   <td width="200" height="25"> <textarea  rows="4" cols="30" name="update_error" required="" ><% out.println(a2);%></textarea></td>
                   <td width="50" height="25"> <input type="text" size="10" style="height: 58px" name="update_category" required="" value="<% out.println(a9);%>"</td>
                   <td width="200" height="25"><textarea  rows="4" cols="40" name="update_description" required="" ><% out.println(a4);%></textarea></td>
                   <td width="100" height="25"> <input type="text" size="15" style="height: 58px" name="update_url" required="" value="<% out.println(a7);%>"></td>
                   <td width="200" height="25"><center><% out.println(a5);%></center></td>
                   <td width="200" height="25"> <center><% out.println(a6);%></center></td>
                   <td width="200" height="25"><center><% out.println(a3);%></center></td>
                   <td width="200" height="25"><center><input id="round" type="submit" value="update<%= a8 %>" name="update_submit" /></center></td>
                   </tr>
                     </form>
                   <%
                      }}
                   %>
                   
                   </table>
                  
                   </center>
                  
       <%
          }
          catch(Throwable e)
          {
           out.println("error is "+e);
          }}
          else
          {
           response.sendRedirect("index.jsp");
          }
        %>
</body>
</html>
