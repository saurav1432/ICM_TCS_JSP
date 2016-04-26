<%-- 
    Document   : deatail_save
    Created on : Mar 1, 2016, 4:12:19 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.* "%>
<%@ page import="java.sql.* "%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Save</title>
        
    </head>
    <body>
        
        <%
        int check=0; 
        String username=request.getParameter("newloginusername");
        String name=request.getParameter("newloginname");
        String password=request.getParameter("newloginpass");
        String role=request.getParameter("newloginrole");
        String email=request.getParameter("newloginemail");
        String gender=request.getParameter("newlogingender");
        String age=request.getParameter("newloginage");
        String mob=request.getParameter("newloginmob");
          //out.println("3.succes login");
        
      try{
           String driver="oracle.jdbc.driver.OracleDriver" ;
           String url="jdbc:oracle:thin:@localhost:1521:xe";
           String user="system";
           String pass="saurav";
           //out.println("2.succes login");
           Class.forName(driver);
           Connection con=DriverManager.getConnection(url,user,pass);
           Statement st=con.createStatement();
            
           //out.println("1.succes login");
            String sql_1="select * from incident";
            ResultSet rs= st.executeQuery(sql_1);
            while(rs.next())
           {
               String user_1=rs.getString(1);
               //out.print(username);
               if(user_1.equals(username))
               {
                   check=1;
                   //out.print(username);
                   out.println("<script>alert('Username already Exist')</script>");
                   //out.println("<script>window.location='detail.jsp.jsp'</script>");
                   out.println("<script>window.location='newuser.jsp'</script>");  
                   //out.println("<script>document.myform1.newloginusername.focus();</script>")
                   //break;
               }
           }
           if(check == 0)
           {
           String  sql_2="insert into INCIDENT values('"+username+"','"+name+"','"+password+"','"+role+"','"+email+"','"+gender+"','"+age+"','"+mob+"')";
           st.executeQuery(sql_2);
           out.println("<script>alert('LOGIN SUCCESS')</script>");
           //out.println("<script>window.location='index.jsp'</script>");
           out.println("<script>window.location='index.jsp'</script>");
           //RequestDispatcher rd=request.getRequestDispatcher("index.html");
           //rd.include(req,res);
           }
        }
        catch(Throwable e)
        {
        out.println("error is "+e);
        }
      %>
     
    </body>
</html>
