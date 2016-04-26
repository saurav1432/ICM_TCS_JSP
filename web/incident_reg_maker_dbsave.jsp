<%-- 
    Document   : incident_reg_maker_dbsave
    Created on : Mar 15, 2016, 8:04:06 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ page import="java.io.* "%>
        <%@ page import="java.sql.* "%>
        <title>incident_reg_maker_dbsave</title>
        
    </head>
    <body>
        <%
            Object username = session.getAttribute("username");
            
            //out.println(username);
            String error=request.getParameter("makererror");
            String description=request.getParameter("makerdescription");
            String date_reg=request.getParameter("makerdate");
            String time=request.getParameter("makertime");
            String url_reg=request.getParameter("makerurl");
            String cat=request.getParameter("makercategory");
            String status="Under Process";
        try{
            String driver="oracle.jdbc.driver.OracleDriver" ;
            String url="jdbc:oracle:thin:@localhost:1521:xe";
            String user="system";
            String pass="saurav";
           //out.println("2.succes login");
           Class.forName(driver);
           Connection con=DriverManager.getConnection(url,user,pass);
           Statement st=con.createStatement();
      
           String  sql="insert into incident_reg (username,error,description,date_reg,time,url,status,category) values('"+username+"','"+error+"','"+description+"','"+date_reg+"','"+time+"','"+url_reg+"','"+status+"','"+cat+"')";
           st.executeQuery(sql); 
           out.println("<script>alert('DETAILS SAVED')</script>");
           out.println("<script>window.location='incident_reg_maker.jsp'</script>");
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
