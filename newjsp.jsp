<%-- 
    Document   : newjsp
    Created on : Oct 26, 2013, 4:16:16 PM
    Author     : Mindsoft
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
String frnd=null;
             Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/twitter", "root","root");
             Statement st=con.createStatement();
             ResultSet res = st.executeQuery("select * from regpage");
            while (res.next()) {
       frnd = res.getString("user");
                System.out.println(" here#################"+frnd);
            
             %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
         <%=frnd%> 
          
        <%
         }
             %>
        <form action="newjsp.jsp" method="get">
            
            <input type="submit" value="click">
        </form>
        
      
       
        <h1>Hello World!</h1>
    </body>
</html>
