<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="mail.Mail"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.mail.SendFailedException"%>
<%@page import="mail.EmailService"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
int ge=0;
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
DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

	   //get current date time with Date()
	   Date date = new Date();
	   System.out.println("Eswar@@@@@1Time"+dateFormat.format(date));
           String t=date.toString();
    String n = session.getAttribute("id").toString();
  String s= session.getAttribute("sh").toString();

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/twitter", "root", "root");
    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into cmt values('" + n + "','" + s + "', DATE_FORMAT( NOW(), '%d %b'),'"+t+"')");
    if (i != 0) {

    Class.forName("com.mysql.jdbc.Driver");
    Connection con11 = DriverManager.getConnection("jdbc:mysql://localhost:3306/twitter", "root", "root");
    Statement st11 = con11.createStatement();
    String es="select max(tid) from admin";
    ResultSet rs= st11.executeQuery(es);
    if(rs.next())
               {
        if(rs.getInt(1)==0)
		ge=1;
		else
		ge=rs.getInt(1)+1;
		session.setAttribute( "tid", ge );
    }
        if ((s.contains("earthquake"))||(s.contains("Earthquake"))||(s.contains("EARTHQUAKE"))) {
//Mail sendmail=new Mail(user,pass,s); 

          Class.forName("com.mysql.jdbc.Driver");
    Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/twitter", "root", "root");
    Statement st1 = con1.createStatement();
    int i1 = st1.executeUpdate("insert into admin values("+ge+",'" + n + "','" + s + "', DATE_FORMAT( NOW(), '%d %b'),'"+t+"','0')");
    if(i1>0)
               {
             response.sendRedirect("userpage.jsp?altt=alert mail sent sucess");
        }
       }

       else if ((s.contains("shaking"))||(s.contains("Shaking"))||(s.contains("SHAKING"))) {
        //   Mail sendmail=new Mail(user,pass,s); 
          Class.forName("com.mysql.jdbc.Driver");
    Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/twitter", "root", "root");
    Statement st2 = con2.createStatement();
    int i2 = st2.executeUpdate("insert into admin values("+ge+",'" + n + "','" + s + "', DATE_FORMAT( NOW(), '%d %b'),'"+t+"','0')");
    if(i2>0)
               {
             response.sendRedirect("userpage.jsp?altt=alert mail sent sucess");
        }
            System.out.println("mail sent sucessesfully");
            

        } else {
           response.sendRedirect("userpage.jsp?alt=update sucess");
            //JOptionPane.showMessageDialog(null,"Error Ocuur..!");  

       }
    
               }
%>