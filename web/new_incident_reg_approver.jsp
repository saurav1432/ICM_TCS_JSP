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
             .dropbtn {
    background-color: #4CAF50;  
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
    <body bgcolor="#E6E6FA">
     <%
            response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
            response.addHeader("Pragma", "no-cache"); 
            response.addDateHeader ("Expires", 0);
            if((request.getSession(false) !=null ))
            {
                Object username1 = session.getAttribute("username"); 
                Object role = session.getAttribute("role"); 
                //out.println("Hello :-"+username1);
                String username_maker=request.getParameter("list_username");
                String cat_maker=request.getParameter("list_category");
                String status_maker=request.getParameter("list_status");
                //out.println("ok "+username_maker);
                //out.println("Role :-&nbsp;&nbsp;&nbsp;"+role+"");
      %>
                <div class="dropdown" >
                <button onclick="myFunction()" class="dropbtn"><% Object username = session.getAttribute("username"); out.println("Approver :- "+username); %> </button>
                <div id="myDropdown" class="dropdown-content">
                <a href="index.jsp">Home<%-- Object role = session.getAttribute("role"); out.println(role);--%></a>
                <a href="logout.jsp">Logout</a>
                <a href="#contact">Contact</a>
                </div>
                </div><br><br><br>
            
      <%
           try
           {
                int i=0;
                String driver="oracle.jdbc.driver.OracleDriver" ;
                String url="jdbc:oracle:thin:@localhost:1521:xe";
                String user="system";
                String pass="saurav";
                //out.println("2.succes login");
                Class.forName(driver);
                Connection con=DriverManager.getConnection(url,user,pass);
                Statement st=con.createStatement();
                String sql="";
                // UNDER PROCESSED INCIDENTS 
           if(status_maker.equalsIgnoreCase("Under Process"))
           {
                if(username_maker.equalsIgnoreCase("ALL") && cat_maker.equalsIgnoreCase("ALL"))
                {
                    sql="select * from incident_reg where status='Under Process' ";
                }
                else if(username_maker.equalsIgnoreCase("ALL") && (!cat_maker.equalsIgnoreCase("ALL")))
                {
                    sql="select * from incident_reg where  category='"+cat_maker+"' AND status='Under Process' ";
                }
                    else if(!(username_maker.equalsIgnoreCase("ALL")) && (cat_maker.equalsIgnoreCase("ALL")))
                {
                    sql="select * from incident_reg where  username='"+username_maker+"' AND status='Under Process' ";
                }
                else if(!(username_maker.equalsIgnoreCase("ALL")) && (!cat_maker.equalsIgnoreCase("ALL")))
                {
                    sql="select * from incident_reg where  username='"+username_maker+"' AND category='"+cat_maker+"' AND status='Under Process' ";
                }
                ResultSet rs=st.executeQuery(sql);
      %>
                <CENTER><h2> UNDER PROCESS INCIDENTS OF MAKERS    </h2></CENTER>
                <center>
                <table border="1px">
                <th width="80" height="25">S.NO</th>  
                <th width="200" height="25">ERROR </th>
                <th width="150" height="25">CATEGORY </th>
                <th width="130" height="25">USERNAME</th>
                <th width="350" height="25">DESCRIPTION</th>
                <th width="100" height="25">URL</th>
                <th width="50" height="25">DATE</th>
                <th width="50" height="25">TIME</th>
                <th width="150" height="25">STATUS</th>
                <th width="100" height="25">UPDATE</th>            
      <%
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
                    String a9=rs.getString(9);  // category
      %>
                <form  action="incident_reg_approver_dbsave.jsp" method="post" >
                <tr>
                <td width="10" height="25"><center><%out.println(i); %></center></td> 
                <td width="100" height="25"><%out.println(a1); %></td>
                <td width="100" height="25"><%out.println(a9); %></td>
                <td width="100" height="25"><center><%out.println(a6); %></center></td>
                <td width="150" height="25"><%out.println(a2); %></td>
                <td width="150" height="25"><center><%out.println(a5); %></center></td>
                <td width="150" height="25"><center><%out.println(a3); %></center></td>
                <td width="150" height="25"> <center><%out.println(a4); %></center></td>
                <td width="100" height="25"> <center><%out.println("Under Process"); %></center></td>
                <td><center><input id="round" type="submit" value="update<%=a7%>" name="update_submit"/></center></td>
                </tr>
                </form>
      <%        
                } // while cloase bracket 
      %>
                </table>
                </center>
      <% 
                } // if close bracket
      
           // PROCESSED INCIDENTS
           else if(status_maker.equalsIgnoreCase("Processed"))
           {
                if(username_maker.equalsIgnoreCase("ALL") && cat_maker.equalsIgnoreCase("ALL"))
                {
                    sql="select * from incident_reg where status='Processed' ";
                }
                else if(username_maker.equalsIgnoreCase("ALL") && (!cat_maker.equalsIgnoreCase("ALL")))
                {
                    sql="select * from incident_reg where  category='"+cat_maker+"' AND status='Processed' ";
                }
                else if(!(username_maker.equalsIgnoreCase("ALL")) && (cat_maker.equalsIgnoreCase("ALL")))
                {
                    sql="select * from incident_reg where  username='"+username_maker+"' AND status='Processed' ";
                }
                else if(!(username_maker.equalsIgnoreCase("ALL")) && (!cat_maker.equalsIgnoreCase("ALL")))
                {
                    sql="select * from incident_reg where  username='"+username_maker+"' AND category='"+cat_maker+"' AND status='Processed' ";
                }
                ResultSet rs=st.executeQuery(sql);
     %>
                <CENTER><h2> PROCESSED INCIDENTS OF MAKERS    </h2></CENTER>
                <center>
                <table border="1px">
                <th width="80" height="25">S.NO</th>  
                <th width="200" height="25">ERROR </th>
                <th width="150" height="25">CATEGORY </th>
                <th width="130" height="25">USERNAME</th>
                <th width="350" height="25">DESCRIPTION</th>
                <th width="100" height="25">URL</th>
                <th width="50" height="25">DATE</th>
                <th width="50" height="25">TIME</th>
                <th width="150" height="25">STATUS</th>
    <%
                while(rs.next())
                {
                    i++;
                    String a7=rs.getString(1); // primary_key
                    String a1=rs.getString(3);// error
                    String a2=rs.getString(4);// des
                    String a3=rs.getString(5);// date
                    String a4=rs.getString(6);// time
                    String a5=rs.getString(7);// url
                    String a6=rs.getString(2);// username
                    String a9=rs.getString(9);  // category
    %>
           
               <tr>
                 <td width="10" height="25"><center><%out.println(i); %></center></td> 
                 <td width="100" height="25"><%out.println(a1); %></td>
                 <td width="100" height="25"><%out.println(a9); %></td>
                 <td width="100" height="25"><center><%out.println(a6); %></center></td>
                 <td width="150" height="25"><%out.println(a2); %></td>
                 <td width="150" height="25"><center><%out.println(a5); %></center></td>
                 <td width="150" height="25"><center><%out.println(a3); %></center></td>
                 <td width="150" height="25"> <center><%out.println(a4); %></center></td>
                 <td width="150" height="25"> <center><%out.println("Processed"); %></center></td>
              </tr>
           
    <%
              }  // while close
    %> 
              </table>
              </center>
    <% 
              }  // else if cloase
        
      // All STATUS 
        else if(status_maker.equalsIgnoreCase("ALL"))
        {
           if(username_maker.equalsIgnoreCase("ALL") && cat_maker.equalsIgnoreCase("ALL"))
           {
               sql="select * from incident_reg where status='Under Process' ";
           }
           else if(username_maker.equalsIgnoreCase("ALL") && (!cat_maker.equalsIgnoreCase("ALL")))
           {
                sql="select * from incident_reg where  category='"+cat_maker+"' AND status='Under Process' ";
           }
           else if(!(username_maker.equalsIgnoreCase("ALL")) && (cat_maker.equalsIgnoreCase("ALL")))
           {
                sql="select * from incident_reg where  username='"+username_maker+"' AND status='Under Process' ";
           }
           else if(!(username_maker.equalsIgnoreCase("ALL")) && (!cat_maker.equalsIgnoreCase("ALL")))
           {
                sql="select * from incident_reg where  username='"+username_maker+"' AND category='"+cat_maker+"' AND status='Under Process' ";
           }
           ResultSet rs=st.executeQuery(sql);
   %>
           <CENTER><h2> UNDER PROCESS INCIDENTS OF MAKERS    </h2></CENTER>
           <center>
           <table border="1px">
             <th width="80" height="25">S.NO</th>  
             <th width="200" height="25">ERROR </th>
             <th width="150" height="25">CATEGORY </th>
             <th width="130" height="25">USERNAME</th>
             <th width="350" height="25">DESCRIPTION</th>
             <th width="100" height="25">URL</th>
             <th width="50" height="25">DATE</th>
             <th width="50" height="25">TIME</th>
             <th width="150" height="25">STATUS</th>
             <th width="150" height="25">UPDATE</th>
   <%
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
               String a9=rs.getString(9);  // category
               
   %>
             <form  action="incident_reg_approver_dbsave.jsp" method="post" >
              <tr>
                 <td width="10" height="25"><center><%out.println(i); %></center></td> 
                 <td width="100" height="25"><%out.println(a1); %></td>
                 <td width="100" height="25"><%out.println(a9); %></td>
                 <td width="100" height="25"><center><%out.println(a6); %></center></td>
                 <td width="150" height="25"><%out.println(a2); %></td>
                 <td width="150" height="25"><center><%out.println(a5); %></center></td>
                 <td width="150" height="25"><center><%out.println(a3); %></center></td>
                 <td width="150" height="25"> <center><%out.println(a4); %></center></td>
                 <td width="150" height="25"> <center><%out.println("Under Process"); %></td>
                 <td><center><input id="round" type="submit" value="update<%=a7%>" name="update_submit"/></center></td>
              </tr>
            </form>
   <% 
            }  // while close
   %>
            </table>
            </center>
            <br><br>
      
    
    <% 
           if(username_maker.equalsIgnoreCase("ALL") && cat_maker.equalsIgnoreCase("ALL"))
           {
               sql="select * from incident_reg where status='Processed' ";
           }
           else if(username_maker.equalsIgnoreCase("ALL") && (!cat_maker.equalsIgnoreCase("ALL")))
           {
                sql="select * from incident_reg where  category='"+cat_maker+"' AND status='Processed' ";
           }
           else if(!(username_maker.equalsIgnoreCase("ALL")) && (cat_maker.equalsIgnoreCase("ALL")))
           {
                sql="select * from incident_reg where  username='"+username_maker+"' AND status='Processed' ";
           }
           else if(!(username_maker.equalsIgnoreCase("ALL")) && (!cat_maker.equalsIgnoreCase("ALL")))
           {
                sql="select * from incident_reg where  username='"+username_maker+"' AND category='"+cat_maker+"' AND status='Processed' ";
           }
           
           ResultSet rs1=st.executeQuery(sql);
           %>
           <CENTER><h2> PROCESSED INCIDENTS OF MAKERS    </h2></CENTER>
           <center>
           <table border="1px">
             <th width="80" height="25">S.NO</th>  
             <th width="200" height="25">ERROR </th>
             <th width="150" height="25">CATEGORY </th>
             <th width="130" height="25">USERNAME</th>
             <th width="350" height="25">DESCRIPTION</th>
             <th width="100" height="25">URL</th>
             <th width="50" height="25">DATE</th>
             <th width="50" height="25">TIME</th>
             <th width="150" height="25">STATUS</th>
    <%
           while(rs1.next())
           {
               i++;
               String a7=rs1.getString(1); // primary_key
               String a1=rs1.getString(3);// error
               String a2=rs1.getString(4);// des
               String a3=rs1.getString(5);// date
               String a4=rs1.getString(6);// time
               String a5=rs1.getString(7);// url
               String a6=rs1.getString(2);// username
               String a9=rs1.getString(9);  // category
               
    %>
           
              <tr>
                 <td width="10" height="25"><center><%out.println(i); %></center></td> 
                 <td width="100" height="25"><%out.println(a1); %></td>
                 <td width="100" height="25"><%out.println(a9); %></td>
                 <td width="100" height="25"><center><%out.println(a6); %></center></td>
                 <td width="150" height="25"><%out.println(a2); %></td>
                 <td width="150" height="25"><center><%out.println(a5); %></center></td>
                 <td width="150" height="25"><center><%out.println(a3); %></center></td>
                 <td width="150" height="25"> <center><%out.println(a4); %></center></td>
                 <td width="150" height="25"> <center><%out.println("Processed"); %></center></td>
              </tr>
           
    <%
           }   // while close ALL
    %> 
              </table>
              </center>
           <br><br><br><br><br><br><br><br>
    <%     
           }    // else if close
    %> 
                   
     
    <%    
           } // try close bracket  
           catch(Throwable e)
           { 
              out.println("error is "+e);  
           } 
          
          }  // if close
          else
          {
            response.sendRedirect("index.jsp");
          }
     %>
    </body>
</html>
