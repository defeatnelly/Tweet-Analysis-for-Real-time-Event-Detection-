<%-- 
    Document   : userpage
    Created on : Oct 25, 2013, 12:44:26 PM
    Author     : Mindsoft
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.xml.internal.fastinfoset.util.StringArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script language="JavaScript" src="http://j.maxmind.com/app/geoip.js"></script>
<!DOCTYPE html>
<html>
    <head>
        <script language="JavaScript" src="http://j.maxmind.com/app/geoip.js"></script>
        <link href="s.css" rel="stylesheet" type="text/css" media="screen" />
        <script src="min.js">
           
        </script>
        <script src="flw.js">
        </script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tweet Analysis for Real-Time Event Detection and Earthquake Reporting System Development</title>
        

    </head>
    
       <body class="body">
            <div style="position:absolute; right:1500px; top:0px; left:0px; width: 0px; height: ">
            <img src="images/p.jpg" height="60" width="1350"/>
        </div>  
           <div style="position:absolute; right:1500px; top:0px; left:30px; width: 0px; height: ">
            <img src="images/twitter.png" height="52" width="50"/>
        </div> 
           <div style="position:absolute;  top:60px; left:780px;  height: ">
               <a href="index.jsp"><button class="extt" value="Logout"></button></a>

            </div>
           <div style="position:absolute; right:1500px; top:0px; left:65px; width: 1200px; height: ">
                    <font color="white" class="pagetext" size="+2">Tweet Analysis for Real-Time Event Detection and Earthquake Reporting System Development</font>
                </div> 
                
                <div style="position:absolute; right:15px; top:60px; left:250px; width: 225px; height: "> 
                    <img src="images/white.png" height="90" width="500"/>     </div>  
                <div style="position:absolute; right:15px; top:65px; left:260px; width: 350px; height: "><font size="+3" style="font-family: fantasy"> TWEETS RECEIVED <img src="images/b.jpg" height="70" width="100"/></font></div>
               
               <div style="position:absolute; right:15px; top:180px; left:50px; width: 600px; height:" >       
                   <form action="Adminindex.jsp" method="POST">
                       <table>
                           <tr><td>Select Tweet ID for verification</td><td><select name="tides">
                           <%
                           Connection ccc = DriverManager.getConnection("jdbc:mysql://localhost:3306/twitter", "root", "root");
                        Statement sss = ccc.createStatement();
                        ResultSet rss = sss.executeQuery("select tid from admin where per='0'");
                        while (rss.next()) {
                           %>
                           
                                       <option value="<%=rss.getInt(1)%>"><%=rss.getInt(1)%></option>
                                       <%
                                                                             }
                                       %>
                                   </select></td></tr>
                           <tr><td colspan="2"><input type="submit" value="Search" name="submit" /></td></tr>
                       </table>
                   </form>
           
                
                </div>
              
                            </body>
                            </html>
