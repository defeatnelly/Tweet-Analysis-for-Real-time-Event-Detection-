<%@page import="java.sql.ResultSet"%>
<%@page import="javax.mail.SendFailedException"%>
<%@page import="mail.EmailService"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    //String name = session.getAttribute("me").toString();
    String name = null, pass = null, user = null;
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/twitter", "root", "root");
    Statement stss = conn.createStatement();
    ResultSet rest = stss.executeQuery("select * from regpage where user = '" + (String) session.getAttribute("me") + "' ");
    if (rest.next()) {
        name = rest.getString("name");
        user = rest.getString("user");
        pass = rest.getString("pas");
        session.setAttribute("id", name);
    }
%>



<%
    String n = session.getAttribute("id").toString();
  String msgg= session.getAttribute("sh").toString();

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/twitter", "root", "root");
    Statement st = con.createStatement();
    String nn = "delete from cmt where msg   ='" + msgg + "' and name ='"+n+"'";
   // String nn = "delete from cmt where msg   ='" + msgg + "'";
    System.out.println("    values Query "+nn);
    int i = st.executeUpdate(nn);
    
    if (i != 0) {


        if ((msgg.equalsIgnoreCase("earthquake"))) {


         //   EmailService m1 = new EmailService();
          //  m1.test(user, pass);
          //  System.out.println("mail sent sucessesfully");
             response.sendRedirect("userpage.jsp?");
        }

       else if ((msgg.equalsIgnoreCase("shaking"))) {
           
            //EmailService m = new EmailService();
          //  m.test(user, pass);
            //System.out.println("mail sent sucessesfully");
            response.sendRedirect("userpage.jsp");

        } else {
           response.sendRedirect("userpage.jsp?alt=update sucess");
           
       }
    
               }
%>