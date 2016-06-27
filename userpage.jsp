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
        <script>
            $(document).ready(function(){
                $("button").click(function(){
                    $("#div1").fadeIn();
   
                    $("#div3").fadeIn(3000);
                });
            });
        </script>
        <script>
            $(document).ready(function(){
                $("p").click(function(){
                    $(this).hide();
                });
            });
        </script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tweet Analysis for Real-Time Event Detection and Earthquake Reporting System Development</title>
        <script>
            function flw()
            {
                alert('Now you can see their post');
               
            }
        </script>
        <script>
            function getloc()
            {
               var loc=geoip_city();
              var es= document.getElementById("text");
              es.value="From "+loc+" : ";
               
            }
        </script>
        <script>
            function AnEventHasOccurred()
            {
                //  window.location="onkey.jsp"
            }
            
        </script>

    </head>
    <%
        if (request.getParameter("msg") != null) {
            out.println("<script>alert('login sucess..!')</script>");
        }
    %>
    <%
        if (request.getParameter("alt") != null) {
            out.println("<script>alert('Updated..!')</script>");
        }

    %>

    <%
        if (request.getParameter("altt") != null) {
            out.println("<script> alert('Alert Mail sent to your frndz')</script>");
        }
    %>

    <%

        String name = null;
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/twitter", "root", "root");
        Statement stss = con.createStatement();
        ResultSet res = stss.executeQuery("select * from regpage where user = '" + (String) session.getAttribute("me") + "' ");
        if (res.next()) {
            name = res.getString("name");
            session.setAttribute("id", name);
        }
    %>

    <body class="body">
        <!-- begin header -->
        <div style="position:absolute; right:1500px; top:0px; left:0px; width: 0px; height: ">
            <img src="images/p.jpg" height="60" width="1350"/>
        </div>   
        <div style="position:absolute; right:1500px; top:350px; left:-35px; width: 0px; height: ">
            <img src="images/twitter.png" />
        </div>   
        <div style="position:absolute; right:1500px; top:0px; left:30px; width: 0px; height: ">
            <img src="images/twitter.png" height="52" width="50"/>
        </div>   

        <div style="position:absolute; right:1500px; top:60px; left:200px; width: 0px; height: ">
            <img src="images/white.png" height="40" width="400"/>

            <button class="cmt" ></button>
            
            <form name="ff" action="cmt.jsp" method="get" onkeydown="AnEventHasOccurred();">
                <div id="div1" style="width:0px;height:150px;display:none;background-color:#33ccff;">
                    <input type="text" class="f" name="text"  id="text" placeholder="Tweet here.........." onmouseover="return getloc()">
                     <%
                           
                                    int pid = 0, s = 0;
                                    Connection con2 = null;
                                    Statement st2 = null;
                                    ResultSet rs2 = null;
                                    String sql = "select * from regpage ";
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/twitter", "root", "root");;
                                        st2 = con2.createStatement();
                                        rs2 = st2.executeQuery(sql);


                                %>
                    <tr><td><select name="user" multiple="multiple">
                                            <option value="select">------Select User------</option>
                                            <%while (rs2.next()) {%>
                                            <option value="<%=rs2.getString("name")%>"><%=rs2.getString("name")%></option>
                                            <%}%>

                                        </select></td>
                                </tr>
                                </tr>
                                <tr></tr>
                                <tr></tr>
                                <tr><td><input type="radio" name="statusa" value="Allow">Allow</td></tr>
                    <br><br><input type="submit" value="Tweet" name="Submit" />
<%
                                            } catch (Exception ex) {
                                                System.out.println(ex);
                                            } finally {
                                                con2.close();
                                                st2.close();
                                            }

                                        %>
                </div><br>
               <!-- <input type="text" name="loc" id="es" onmouseover="return getloc()">-->
            </form>
             <div style="position:absolute;  top:0px; left:150px;  height: ">
           <a href="#"><button class="icon">Home</button></a>

            </div>
            
            <div style="position:absolute;  top:0px; left:265px;  height: ">
           <a href="profile.jsp"><button class="extt1">My Profile</button></a>

            </div>
            <div style="position:absolute;  top:0px; left:380px;  height: ">
                <a href="index.jsp"><button class="extt"></button></a>

            </div>
                        <!-- comment box  -->
            <div style="margin-left:450px; margin-top:-20px; width: 400px;" >
                <fieldset >
                    <%


                        String pst = null, names = null, date = null;
                        Connection ccc = DriverManager.getConnection("jdbc:mysql://localhost:3306/twitter", "root", "root");
                        Statement sss = ccc.createStatement();
                        ResultSet rss = sss.executeQuery("select * from cmt where user='"+session.getAttribute("name1") +"' or name='"+session.getAttribute("name1")+"'ORDER BY 'time' DESC");
                        while (rss.next()) {

                            pst = rss.getString("msg").replaceAll("%20", " ");

                            names = rss.getString("name");
                            date = rss.getString("date");

                            session.setAttribute("di", pst);

                    %>



                    <font color="purple" size="+1">Posted BY:</font>&nbsp;&nbsp;&nbsp;<font size="+1"><b><%=names%></b></font><br>
                    <font color="#1C1C1C" size="+1"><%=pst%> <div style="text-align: right" ><font color="#424242"><%=date%></font></div>
                        <%
                            String shr = rss.getString("msg").replaceAll("%20", " ");
                            String rmv = rss.getString("msg").replaceAll("%20", "");
                            System.out.println(" sfjsfjslf$$$$$$$$$$$$$" + shr);
                            session.setAttribute("rm", rmv);
                            session.setAttribute("sh", shr);
                        %>


                    <br><hr>

                    <%
                        }
                    %>
                    </div>
                    <div style="margin-left:500px; margin-top:-15px; width: 400px;" >
                        <a href="share.jsp">Share</a>  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        <a href="remove.jsp">Remove</a></font></div>
                </fieldset>

                <!-- comment box end -->




                <div style="position:absolute; right:1500px; top:0px; left:5px; width: 325px; height: ">
                    <font size="+3" color="" background=""><%=name%> </font>

                </div>
                <!--  begin heading -->
                <div style="position:absolute; right:1500px; top:-50px; left:-100px; width: 1200px; height: ">
                    <font color="white" class="pagetext" size="+2">Tweet Analysis for Real-Time Event Detection and Earthquake Reporting System Development</font>
                </div>   
                <!--  end heading -->

                <!-- comment box begin header -->       
                <div style="position:absolute; right:15px; top:20px; left:450px; width: 325px; height: "> 
                    <img src="images/white.png" height="70" width="400"/>     </div>  
                <div style="position:absolute; right:15px; top:15px; left:460px; width: 325px; height: "><font size="+3" style="font-family: fantasy"> Tweets <img src="images/twitter.png" height="" width="50"/></font></div>
                <!-- comment box end header -->
                <!--  begin flow -->      
                <div style="position:absolute; right:15px; top:450px; left:0px; width: 300px; height:" >       

                    <fieldset> 
                        <form action="frnd.jsp" method="get">
                            <font size="+1">Who to follow</font>&nbsp;&nbsp;&nbsp;<font color="#00FFFF" size="+1">Popular Accounts</font><br><br>

                            <%

                                //String me= session.getAttribute("me").toString();
                                String flw = null, us = null;
                                Connection cf = DriverManager.getConnection("jdbc:mysql://localhost:3306/twitter", "root", "root");
                                Statement sf = cf.createStatement();

                                ResultSet rf = sf.executeQuery("select distinct(friend ) from friend where myname = '" + name + "' ");
                                while (rf.next()) {

                                    flw = rf.getString("friend");
                                    session.setAttribute("fr", flw);
                            %>

                            <img src="images/userr.png" >  &nbsp; &nbsp; &nbsp;
                            <font size="+1"><%=flw%></font></img><br><div style="margin-left: 200px;">


                            </div><hr>

                            <%
                                }

                            %>
                            </fieldset>  </div>  
                        </form>
                             <div style="position:absolute; right:0px; top:70px; left:900px; width: 300px; height:" > 
                        <form action="frnd.jsp" method="get">
                            <p><font size="+1" color="red">Available friends&nbsp;&nbsp;&nbsp;</p>
                            <select name ="frn" >
<%

                                String me= session.getAttribute("me").toString();
                               String flww = null, uss = null;
                               Connection cff = DriverManager.getConnection("jdbc:mysql://localhost:3306/twitter", "root", "root");
                                Statement sff = cff.createStatement();

                               ResultSet rff = sff.executeQuery("select * from regpage where name not like  '" + name + "'");
                                while (rff.next()) {

                                   flww = rff.getString("name");
                                    
                                   session.setAttribute("fr", flw);
                            %>

                      
                                
                                
                                
                            <option><%=flww%></option>
                                    
                                <%
                                }
                                %>
                            </select>
                            <input type="submit" value="Add" style="background-color: orange"></font></p>
                                </form>
                             </div>


                           



                            <!--  end flow --> 
                            </body>
                            </html>
