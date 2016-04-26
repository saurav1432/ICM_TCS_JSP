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
            //out.println(date_reg);
            //out.println(time);
            //out.println("Hello :- "+ "<a href='status_maker.jsp'>"+username+"</a>");
            String error=request.getParameter("update_error");
            String cat=request.getParameter("update_category");
            String description=request.getParameter("update_description");
            String url_reg=request.getParameter("update_url");
            String sub=request.getParameter("update_submit");
            String status="unseen";
            String z=sub.substring(6);  
            //out.println("error is "+error);
            //String del=request.getParameter("update_submit");
            //out.println(sub);
            //out.println(z);
            //String y=del.substring(6);  // delete
            //if(z.equals("24"))
            // out.println("sahi hai");
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
            String  sql="update incident_reg set error='"+error+"',category='"+cat+"',description='"+description+"',url='"+url_reg +"' where primary_key='"+z+"' ";
            st.executeQuery(sql); 
            out.println("<script>alert('DETAILS SAVED')</script>");
            out.println("<script>window.location='new_status_maker.jsp'</script>");
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
