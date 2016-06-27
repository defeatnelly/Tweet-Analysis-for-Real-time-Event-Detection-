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

<!DOCTYPE html>
<html>
    <head>
       
        <link href="s.css" rel="stylesheet" type="text/css" media="screen" />
        <script src="min.js">
           
        </script>
        <script src="flw.js">
        </script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
        
       
           </head>
  
       <body class="body">
           <%String email="";
                     String pass="";
                     String namees=""; 
                 //    PrintWriter out=new PrintWriter();
          %>
        <!-- begin header -->
        <div style="position:absolute; right:1500px; top:0px; left:0px; width: 0px; height: ">
            <img src="images/black.jpg" height="60" width="1350"/>
        </div>   
        <div style="position:absolute; right:1500px; top:350px; left:-35px; width: 0px; height: ">
            <img src="images/twitter.png" />
        </div>   
        <div style="position:absolute; right:1500px; top:0px; left:30px; width: 0px; height: ">
            <img src="images/twitter.png" height="52" width="50"/>
        </div>   

        <div style="position:absolute; right:1500px; top:60px; left:200px; width: 0px; height: ">
            <img src="images/white.png" height="40" width="400"/>

                     <br><br>
            
             <div style="position:absolute;  top:0px; left:150px;  height: ">
           <a href="userpage.jsp"><button class="icon">Home</button></a>

            </div>
            
            <div style="position:absolute;  top:0px; left:265px;  height: ">
           <a href="profile.jsp"><button class="extt1">My Profile</button></a>

            </div>
            <div style="position:absolute;  top:0px; left:380px;  height: ">
                <a href="index.jsp"><button class="extt"></button></a>

            </div>
                     <%
                     namees=session.getAttribute("id").toString();
                     System.out.println("Inside My Profile"+namees);
                     Connection ccc = DriverManager.getConnection("jdbc:mysql://localhost:3306/twitter", "root", "root");
                        Statement sss = ccc.createStatement();
                        ResultSet res = sss.executeQuery("select * from regpage where name='"+namees+"'");
                        while (res.next())
                            {
                            email=res.getString("user");
                            pass=res.getString("pas");
                                                     
                        
                     
                     %>
                     <div class ="w1">
                         <center>
                         <table border="0">
                                                      
                                 <tr>
                                     <td>YourName:</td>
                                     <td><%=namees%></td>
                                 </tr>
                                 <tr>
                                     <td>YourEmailId:</td>
                                     <td><%=email%></td>
                                 </tr>
                                 <tr>
                                     <td>Password:</td>
                                     <td><%=pass%></td>
                                 </tr>
                             <%}%>
                         </table></center>

                     </div>
                        
            




                <div style="position:absolute; right:1500px; top:0px; left:5px; width: 325px; height: ">
                    <font size="+3" color="" background=""> </font>

                </div>
                <!--  begin heading -->
                <div style="position:absolute; right:1500px; top:-50px; left:-100px; width: 1200px; height: ">
                    <font color="white" class="pagetext" size="+2">Tweet Analysis for Real-Time Event Detection and Earthquake Reporting System Development</font>
                </div>   
                <!--  end heading -->

                <!-- comment box begin header -->       
                
         


                           



                            <!--  end flow --> 
                            </body>
                            </html>
