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
            <img src="images/black.jpg" height="60" width="1350"/>
        </div>  
           <div style="position:absolute; right:1500px; top:0px; left:30px; width: 0px; height: ">
            <img src="images/twitter.png" height="52" width="50"/>
        </div> 
           <div style="position:absolute;  top:50px; left:780px;  height: ">
                <a href="index.jsp"><button class="extt"></button></a>

            </div>
           <div style="position:absolute; right:1500px; top:0px; left:65px; width: 1200px; height: ">
                    <font color="white" class="pagetext" size="+2">Tweet Analysis for Real-Time Event Detection and Earthquake Reporting System Development</font>
                </div> 
                
                <div style="position:absolute; right:15px; top:60px; left:250px; width: 225px; height: "> 
                    <img src="images/white.png" height="70" width="400"/>     </div>  
                <div style="position:absolute; right:15px; top:65px; left:260px; width: 225px; height: "><font size="+3" style="font-family: fantasy"> Tweets <img src="images/twitter.png" height="" width="50"/></font></div>
               
               <div style="position:absolute; right:15px; top:130px; left:0px; width: 600px; height:" >       
                
                <fieldset >
                    <%
                        String r1=request.getParameter("tides");
                       String pst = null, names = null, date = null;
                        String user=null,pass=null;
                        int ge=0;
                        System.out.println("r======="+r1);
                        Connection ccc = DriverManager.getConnection("jdbc:mysql://localhost:3306/twitter", "root", "root");
                        Statement sss = ccc.createStatement();
                        ResultSet rss = sss.executeQuery("select * from admin where tid="+r1+"");
                        if (rss.next()) {

                            pst = rss.getString("msg").replaceAll("%20", " ");
                            ge=rss.getInt("tid");
                            names = rss.getString("name");
                            date = rss.getString("date");

                                session.setAttribute("di", pst);
                                 session.setAttribute("msgges",pst);
                                session.setAttribute("tid",ge);
                             //   Class.forName("");
                                Connection cones= DriverManager.getConnection("jdbc:mysql://localhost:3306/twitter", "root", "root");
                                Statement stes = ccc.createStatement();
                        ResultSet rses = stes.executeQuery("select * from regpage where name='"+names+"' ");
                        if(rses.next()) {
                                user = rses.getString("user");
                                pass = rses.getString("pas");

                                session.setAttribute("userfrom", user);
                                session.setAttribute("passes", pass);
                                         }
                       

                    %>


<form action="permission" method="post">
                    <font color="#00FFFF" size="+1">Posted BY:</font>&nbsp;&nbsp;&nbsp;<font size="+1"><b><%=names%></b></font><br>
                    <font color="#1C1C1C" size="+1"><%=pst%> <div style="text-align: right" ><font color="#424242"><%=date%></font></div>
                    Allow <input type="radio" name="r1" value="Allow" /> Deny<input type="radio" name="r1" value="Deny" />
                    <input type="submit" value="Publish" name="submit" />
                    
                       

</form>
                    <br><hr>

                    <%
                        }
                    %>
                    
                    
                </fieldset>
                
                </div>
              
                            </body>
                            </html>
