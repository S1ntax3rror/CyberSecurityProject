FROM openjdk:11-jre-slim

# 1. Install Tomcat
RUN apt-get update && apt-get install -y curl && \
    curl -sSL https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.0.M1/bin/apache-tomcat-9.0.0.M1.tar.gz \
    | tar xz -C /opt && \
    mv /opt/apache-tomcat-9.0.0.M1 /opt/tomcat

# 2. Create writable vulnerable app: /myapp
RUN mkdir -p /opt/tomcat/webapps/myapp/WEB-INF

# Basic HTML page
RUN echo '<h1>My Vulnerable App</h1>' > /opt/tomcat/webapps/myapp/index.html

# Writable servlet config
RUN cat > /opt/tomcat/webapps/myapp/WEB-INF/web.xml <<EOF
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee" version="3.1">

  <servlet>
    <servlet-name>default</servlet-name>
    <servlet-class>org.apache.catalina.servlets.DefaultServlet</servlet-class>
    <init-param>
      <param-name>readonly</param-name>
      <param-value>false</param-value>
    </init-param>
    <init-param>
      <param-name>allowPartialPut</param-name>
      <param-value>true</param-value>
    </init-param>
    <load-on-startup>1</load-on-startup>
  </servlet>

  <servlet-mapping>
    <servlet-name>default</servlet-name>
    <url-pattern>/</url-pattern>
  </servlet-mapping>

</web-app>
EOF

# 3. Expose HTTP
EXPOSE 8080

# 4. ENTRYPOINT to start Tomcat
WORKDIR /opt/tomcat
ENTRYPOINT ["bin/catalina.sh", "run"]
