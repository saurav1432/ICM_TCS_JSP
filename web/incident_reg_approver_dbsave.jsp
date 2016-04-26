<%-- 
    Document   : status_maker_update
    Created on : Mar 16, 2016, 9:53:58 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Details</title>
        <%@ page import="java.io.* "%>
        <%@ page import="java.sql.* "%>
    </head>
    <body>
         <%
            Object username = session.getAttribute("username"); 
            Object date_reg = session.getAttribute("date_reg");
            Object time = session.getAttribute("time");
            String sub=request.getParameter("update_submit");
            String z=sub.substring(6);
            //out.println(sub);
            
            out.println("Hello :- "+ "<a href='status_maker.jsp'>"+username+"</a>");
            String status=request.getParameter("app_status");
            
            try{
            String driver="oracle.jdbc.driver.OracleDriver" ;
            String url="jdbc:oracle:thin:@localhost:1521:xe";
            String user="system";
            String pass="saurav";
            //out.println("2.succes login");
            Class.forName(driver);
            Connection con=DriverManager.getConnection(url,user,pass);
            Statement st=con.createStatement();
             //out.println("2.succes login");    
            String  sql="update incident_reg set status='"+status+"' where primary_key='"+z+"'  ";
            st.executeQuery(sql); 
            out.println("<script>alert('DETAILS SAVED')</script>");
            out.println("<script>window.location='incident_list_approver.jsp'</script>");
            //out.println("<script>window.location='index.jsp'</script>");
            //res.sendRedirect("welcomenewuser.html");
            //RequestDispatcher rd=request.getRequestDispatcher("index.html");
            //rd.include(req,res);
        }
        catch(Throwable e)
        {
        out.println("error is "+e);
        }
        %>
    </body>
</html>
