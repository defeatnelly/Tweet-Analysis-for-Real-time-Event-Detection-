<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<% String me = session.getAttribute("id").toString();
           // String frn = session.getAttribute("fr").toString();
            String frn = request.getParameter("frn");
            Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/twitter","root","root");
                Statement st = con.createStatement();
                int  i = st.executeUpdate("insert into friend values('"+me+"','"+frn+"')");
                 if(i!=0){
                     
                   //  JOptionPane.showMessageDialog(null,"Details sucessfully saved");
              
                     response.sendRedirect("userpage.jsp?alt=frnd req success");
                 }
                 else {
                
                     //JOptionPane.showMessageDialog(null,"Error Ocuur..!");  
                     
                 }
                %>