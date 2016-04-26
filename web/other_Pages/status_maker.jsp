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
    </head>
    <body>
        <%
            response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
            response.addHeader("Pragma", "no-cache"); 
            response.addDateHeader ("Expires", 0);
            if((request.getSession(false) !=null ))
            {
            Object username = session.getAttribute("username"); 
            Object role = session.getAttribute("role"); 
            out.println("Hello :- "+ "<a href='status_maker.jsp'>"+username+"</a>");
         %>
            <br>
         <% 
            out.println("Role :-&nbsp;&nbsp;&nbsp;"+role+"");
            int i=0;
             //out.println(username);
            // out.println("Hello :- "+ "<a href='update_details.jsp'>"+username+"</a>");
         %>
            <br>
            <a href='logout.jsp'>Logout</a>
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
            while(rs.next())
            {
               String a8=rs.getString(1);  // primary key
               String a1=rs.getString(2); // username
               //out.println(a1);
               String a2=rs.getString(3); // error
               //out.println(a2);
               String a3=rs.getString(8); // status
               String a4=rs.getString(4); //  description
               String a5=rs.getString(5); //date
               String a6=rs.getString(6); //time
               String a7=rs.getString(7); //url
               
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
            <center><h2> ERROR <% out.println(i); %> </h2> </center>
            <form  action="status_maker_update.jsp" method="post" >
               <center>
                      <table border="1px">
                       
                       <tr>
                           <th width="200" height="25">Error:</th>
                           <td width="200" height="25"> <input type="text" size="39" name="update_error" required="" value="<% out.println(a2);%>"></td>
                           
                       </tr>
                        <tr>
                           <th width="200" height="25">Description:</th>
                           <td width="200" height="25"><textarea  rows="4" cols="40" name="update_description" required="" ><% out.println(a4);%></textarea></td>
                           
                       </tr>
                       
                       <tr>
                           <th width="200" height="25">URL:</th>
                           <td width="200" height="25"> <input type="text" size="39" name="update_url" required="" value="<% out.println(a7);%>"></td>
                       
                       </tr>
                       
                        <tr>
                           <th width="200" height="25">Date:</th>
                           <td width="200" height="25"><% out.println(a5);%></td>
                           
                       </tr>
                        <tr>
                           <th width="200" height="25">Time:</th>
                           <td width="200" height="25"> <% out.println(a6);%></td>
                           
                       </tr>
                        
                        
                       <tr>
                           <th width="200" height="25">Status:</th>
                           <td width="200" height="25"><% out.println(a3);%></td>
                       </tr>
                       
                       <br><br><br>
                   </table>
                       <br>
                       <input id="round" type="submit" value="update<%= a8 %>" name="update_submit" /><br><br><br>
                       
                       
                   </center>
                       </form>
       <%
          }}}
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
