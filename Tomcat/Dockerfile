FROM openjdk:11-jre-slim

# 1) Download & unpack Tomcat 9.0.98
RUN apt-get update && apt-get install -y curl vim \
 && curl -SL https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.98/bin/apache-tomcat-9.0.98.tar.gz \
    | tar xz -C /opt \
 && mv /opt/apache-tomcat-9.0.98 /opt/tomcat

# 2) Enable writable default servlet + partial PUT
RUN sed -i 's|<param-value>true</param-value>|<param-value>false</param-value>|' \
      /opt/tomcat/conf/web.xml \
 && cat >> /opt/tomcat/conf/web.xml <<'EOF'
  <!-- ensure allowPartialPut=true -->
  <init-param>
    <param-name>allowPartialPut</param-name>
    <param-value>true</param-value>
  </init-param>
EOF

# 3) Expose and run
EXPOSE 8080
WORKDIR /opt/tomcat/bin
ENTRYPOINT ["sh","catalina.sh","run"]
