FROM openjdk:11-jre-slim

# 1. Install Tomcat
RUN apt-get update && apt-get install -y curl && \
    curl -sSL https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.83/bin/apache-tomcat-9.0.83.tar.gz \
    | tar xz -C /opt && \
    mv /opt/apache-tomcat-9.0.83 /opt/tomcat

# 2. Create writable vulnerable app: /myapp
RUN mkdir -p /opt/tomcat/webapps/myapp

# Basic HTML page
RUN echo '<h1>My Vulnerable App</h1>' > /opt/tomcat/webapps/myapp/index.html

# 3. Expose HTTP
EXPOSE 8080

# 4. ENTRYPOINT to start Tomcat
WORKDIR /opt/tomcat

ENTRYPOINT ["bin/catalina.sh", "run"]
