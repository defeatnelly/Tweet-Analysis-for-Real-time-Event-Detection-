<%@page import="java.sql.Time"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="mail.Mail"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.mail.SendFailedException"%>
<%@page import="mail.EmailService"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    //String name = session.getAttribute("me").toString();
DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

	   //get current date time with Date()
	   Date date = new Date();
	   System.out.println("Eswar@@@@@2Time"+dateFormat.format(date));
           String t=date.toString();
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
    System.out.println("$$$$$$$$$$$$$$$this is"+user+pass);
%>



<%
    String n = session.getAttribute("id").toString();
    String msg = request.getParameter("text");
    String users[]=request.getParameterValues("user");
    
    //String loc="Bangalore";
int s = 0;
int i ;   
int ge=0;
Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/twitter", "root", "root");
    Statement st = con.createStatement();
    do{
    i = st.executeUpdate("insert into cmt values('" + n + "','" + msg + "', DATE_FORMAT( NOW(), '%d %b'),'"+t+"','"+users[s]+"')");
    s++ ;
       }while(s<users.length);
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
                
System.out.println("value are printed sucessfulllyy");
System.out.println("Eswar====>"+msg);
        if ((msg.contains("earthquake"))||(msg.contains("shaking"))|| (msg.contains("EARTHQUAKE"))||(msg.contains("SHAKING"))||(msg.contains("Earthquake"))||(msg.contains("Shaking")))
            {
             Class.forName("com.mysql.jdbc.Driver");
    Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/twitter", "root", "root");
    Statement st1 = con1.createStatement();
    int i1 = st1.executeUpdate("insert into admin values("+ge+",'" + n + "','" + msg + "', DATE_FORMAT( NOW(), '%d %b'),'"+t+"','0')");
    if(i1>0){
       
           //  response.sendRedirect("userpage.jsp?altt=alert mail sent sucess");
        }
            System.out.println("Eswar====>"+msg);
            
            response.sendRedirect("userpage.jsp?altt=alert mail sent sucess");
        }
else {
           response.sendRedirect("userpage.jsp?alt=update sucess");
          

       }
      // else if ((msg.equalsIgnoreCase("shaking"))&&(msg.equalsIgnoreCase("earthquake"))) {
         //  Mail sendmail=new Mail(user,pass); 
         //   System.out.println("mail sent sucessesfully");
          //  response.sendRedirect("userpage.jsp?altt=alert mail sent sucess");

        } else {
           response.sendRedirect("userpage.jsp?alt=update sucess");
          

       }
    
             //  }
%>