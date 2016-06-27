<%-- 
    Document   : newjsp1
    Created on : Nov 23, 2013, 5:36:30 PM
    Author     : Mindsoft
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            List<String> list = new ArrayList<String>();
            StringBuilder nn = new StringBuilder();

            String flww = null, uss = null;
            Connection cff = DriverManager.getConnection("jdbc:mysql://localhost:3306/twitter", "root", "root");
            Statement sff = cff.createStatement();

            //ResultSet rff = sff.executeQuery("select * from friend where myname  LIKE  '" + (String) session.getAttribute("me") + "' and friend  ");
            //ResultSet rff = sff.executeQuery("SELECT * FROM `regpage` where name not like ="SELECT * FROM friend where myname='parthy'"")";//  '" + (String) session.getAttribute("me") + "' and friend  ");
            while (rff.next()) {
                //  kl = "";
                list.add(rff.getString("name"));
            }
            for (String hh : list) {
                System.out.println(hh);
            }
            //   System.out.println();
        %>
    </body>
</html>
