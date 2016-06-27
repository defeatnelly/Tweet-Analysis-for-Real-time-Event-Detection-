<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<% String n = request.getParameter("name");
            String usr = request.getParameter("user");
            String pass = request.getParameter("pass");
            if(!(usr.equalsIgnoreCase("Zamfy_fade21@yahoo.com") || pass.equalsIgnoreCase("kathmandu1234nepal")))
                               {
            Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:1527/twitter","root","root");
                Statement st = con.createStatement();
                int  i = st.executeUpdate("insert into regpage values('"+n+"','"+usr+"','"+pass+"')");
                 if(i!=0){
                     
                   //  JOptionPane.showMessageDialog(null,"Details sucessfully saved");
              
                     response.sendRedirect("index.jsp?alt=Register success");
                 }
                              
                 else {
                response.sendRedirect("index.jsp?alt=Register Failed");
                      
                     
                 }
                }
                       else
                       {
                response.sendRedirect("index.jsp?regt=You cant Registered with admin id");
                       }
                %>