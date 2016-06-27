<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%

String username = request.getParameter("user");
String name="" ;
            String password = request.getParameter("pass");
           
            
            
            
               if((username.equalsIgnoreCase("zamfy_fade21@yahoo.com"))&&(password.equals("Kathmandu1234nepal"))){
            response.sendRedirect("adminhome.jsp");
            
        }else{
            
           // if(username.equals("admin")){
                //System.out.println("hi jjjj");
           //     response.sendRedirect("index.jsp?login sucess");
                
         //   }
            //System.out.println("useranme : "+username+"password :"+password);
            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/twitter","root","root");
            Statement st = con.createStatement();
            String Q = "select * from regpage where user= '"+username+"'   ";
                    
                    ResultSet rs = st.executeQuery(Q);
              
                    
                    if(rs.next()){
                          
         
                    if((rs.getString("user").equals(username))&&(rs.getString("pas").equals(password))){
                         name=rs.getString("name");
                        session.setAttribute("me", username);
                        session.setAttribute("name1",name );
                        System.out.println("Name1========="+name);
             response.sendRedirect("userpage.jsp?msg=login sucess");
             
                        
                    }
                    else{
                      response.sendRedirect("index.jsp?msgr=password error");
                    }
            
                       
                    }
                    else{
                        response.sendRedirect("index.jsp?msge=username error");
                      
                    }
               
        
               }
       %>