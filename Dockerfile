FROM amazoncorretto:8

# Set Maven version
ENV MAVEN_VERSION=3.5.2
ENV MAVEN_HOME=/opt/apache-maven-3.5.2
ENV PATH=$MAVEN_HOME/bin:$PATH

# Step 1 - Update packages
RUN yum update -y

# Step 2 - Install tar
RUN yum install -y tar

# Step 3 - Copy Maven from local and extract
COPY apache-maven-3.5.2-bin.tar.gz /tmp/maven.tar.gz
RUN tar -xzf /tmp/maven.tar.gz -C /opt && \
    rm /tmp/maven.tar.gz

# Step 4 - Add to PATH
RUN echo "export PATH=/opt/apache-maven-3.5.2/bin:$PATH" >> ~/.bashrc

# Verify
RUN java -version && mvn -version

EXPOSE 8080