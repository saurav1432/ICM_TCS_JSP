<%-- 
    Document   : incident_reg_approver
    Created on : Mar 15, 2016, 11:53:30 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ page import="java.io.* "%>
        <%@ page import="java.sql.* "%>
        <title>Incident Approver</title>
        
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
            out.println("Hello :-"+username);
         %> 
             <br>
         <% 
             out.println("Role :-&nbsp;&nbsp;&nbsp;"+role+"");
         %>
             <br><a href='logout.jsp'>Logout</a>
             <CENTER><h2> INCIDENT UNDER PROCESSED ERRORS OF MAKERS    </h2></CENTER>
         <%
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
      
           String sql="select * from incident_reg where status='Under Process'";
           ResultSet rs=st.executeQuery(sql);
           while(rs.next())
           {
               i++;
               String a7=rs.getString(1); // primary_key
               String a1=rs.getString(3);// error
               String a2=rs.getString(4);// des
               String a3=rs.getString(5);// date
               String a4=rs.getString(6);// time
               String a5=rs.getString(7);// url
               String a6=rs.getString(2);
               
               %>
           <center>
              <form  action="incident_reg_approver_dbsave.jsp" method="post" >
                 <table border="1px">
                            <br><br><br>
             <tr>
                <th width="100" height="25">Error : <%out.println(i); %></th>
                <td width="100" height="25"><%out.println(a1); %></td>
             <tr>
             <tr>
                <th width="100" height="25"></th>
                <td width="100" height="25"></td>
             </tr>
             <tr>
                <th width="100" height="25">Username</th>
                <td width="100" height="25"><%out.println(a6); %></td>
             </tr>
             <tr>
                <th width="100" height="25"></th>
                <td width="100" height="25"></td>
             </tr>
             <tr>
                <th width="100" height="25">Description</th>
                <td width="150" height="25"><%out.println(a2); %></td>
             </tr>
             <tr>
                <th width="100" height="25"></th>
                <td width="150" height="25"></td>
             </tr>
             <tr>
                <th width="100" height="25"> URL</th>
                <td width="150" height="25"><%out.println(a5); %></td>
             </tr>
             <tr>
                <th width="100" height="25"></th>
                <td width="150" height="25"></td>
             </tr>
             <tr>
                <th width="100" height="25">Date</th>
                <td width="150" height="25"><%out.println(a3); %></td>
             </tr>
             <tr>
                <th width="100" height="25"></th>
                <td width="150" height="25"></td>
             </tr>
              <tr>
                <th width="100" height="25">Time</th>
                <td width="150" height="25"> <%out.println(a4); %></td>
              </tr>
                  
             <tr>
                <th width="100" height="25"></th>
                <td width="150" height="25"></td>
             </tr>
             
             <tr>
                <th width="100" height="25">Status</th>
                <td width="150" height="25"><input type="radio" value="Under Process" required="" name="app_status">Under Process &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" value="Processed" required="" name="app_status">Processed</td>
             </tr>
               
                  </table>
             <br>
             <input id="round" type="submit" value="update<%=a7%>" name="update_submit"/>
                  </form>
                 </center>
               
     <%
          }}
        catch(Throwable e)
          { out.println("error is "+e);  }}
        else
          {
            response.sendRedirect("index.jsp");
          }
     %>
    </body>
</html>
