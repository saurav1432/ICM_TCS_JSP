<%-- 
    Document   : login_validate
    Created on : Mar 1, 2016, 4:02:42 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.* "%>
<%@ page import="java.sql.* "%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
       <%
       String username=request.getParameter("newloginname");
       String password=request.getParameter("newloginpass");
       String role=request.getParameter("newloginrole");
       int i;
       i=0;
       //out.println(username);
       //out.println(password);
       //out.println(role);
       //out.println(" ");
       try
       {
          String driver="oracle.jdbc.driver.OracleDriver";
          String url="jdbc:oracle:thin:@localhost:1521:xe";
          String use="system";
          String pas="saurav";
          Class.forName(driver);
          Connection con=DriverManager.getConnection(url,use,pas);
          String sql="select * from incident";  // table name to be mention
          Statement st=con.createStatement();
          ResultSet rs= st.executeQuery(sql);
         
           //out.println("1.login Success");
          while(rs.next())
          {
              //out.println("while");
              String a1=rs.getString(1);  //username
              String a2=rs.getString(3); //password
              String a3=rs.getString(4);//role
              //out.println(a1);
              //out.println(a2);
              //out.println(a3);
              //out.println(" ");
              if(a1.equals(username) && a2.equals(password) && a3.equals(role))
              {
                  //out.println(a3);
                  if(role.equals("maker"))
                  {
                  session.setAttribute("username", username);
                  session.setAttribute("role", role);
                  //out.println(username1);
                  out.println("<script>alert('Login success')</script>");
                  out.println("<script>window.location='incident_reg_maker.jsp'</script>");
                  i=1;
                  break;
                  }
                  else if(role.equals("approver"))
                  {
                      session.setAttribute("username", username);
                      session.setAttribute("role", role);
                      out.println("<script>alert('Login success 2')</script>");
                     // out.println("<script>window.location='new_incident_reg_approver.jsp'</script>");
                      out.println("<script>window.location='incident_list_approver.jsp'</script>");
                      i=1;
                      break;
                  }
                  
              }
          }
          if(i!=1)
          {
          out.println("<script>alert('Login Failed')</script>");
          out.println("<script>window.location='index.jsp'</script>");  
          }
       }
       catch(Throwable e)
       {
           out.println("error is "+e);
       }
       
       %>
    </body>
</html>
