<%

SimpleEmail email = new SimpleEmail();
email.setHostName("mail.myserver.com");
email.addTo("jdoe@somewhere.org", "John Doe");
email.setFrom("me@apache.org", "Me");
email.setSubject("Test message");
email.setMsg("This is a simple test of commons-email");
email.send();
%>