FROM amazoncorretto:8

# Set Maven version
ENV MAVEN_VERSION=3.5.2
ENV MAVEN_HOME=/opt/apache-maven-3.5.2
ENV PATH=$MAVEN_HOME/bin:$PATH

# Install Maven
RUN yum update -y && \
    yum install -y wget tar && \
    wget https://archive.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz && \
    tar -xzf apache-maven-3.5.2-bin.tar.gz -C /opt && \
    echo "export PATH=/opt/apache-maven-3.5.2/bin:$PATH" >> ~/.bashrc && \
    rm apache-maven-3.5.2-bin.tar.gz && \
    yum clean all

# Verify Java and Maven
RUN java -version && mvn -version

# Expose port 8080
EXPOSE 8080