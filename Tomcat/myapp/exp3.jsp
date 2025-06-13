<%@ page import="java.io.*" %>
<%
    String sourcePath = "/opt/tomcat/webapps/myapp/SESSIONS.ser";
    String destPath = "/opt/tomcat/work/Catalina/localhost/myapp/SESSIONS.ser";
    try (InputStream in = new FileInputStream(sourcePath);
         OutputStream fileOut = new FileOutputStream(destPath)) {

        byte[] buffer = new byte[1024];
        int length;
        while ((length = in.read(buffer)) > 0) {
            fileOut.write(buffer, 0, length);
        }

        fileOut.flush();
        out.println("File copied successfully.");
    } catch (IOException e) {
        out.println("Error copying file: " + e.getMessage());
    }
%>
