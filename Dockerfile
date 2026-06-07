FROM amazoncorretto:8

# Set Maven version
ENV MAVEN_VERSION=3.5.2
ENV MAVEN_HOME=/opt/apache-maven-3.5.2
ENV PATH=$MAVEN_HOME/bin:$PATH

# Step 1 - Update packages
RUN yum update -y

# Step 2 - Install wget and tar
RUN yum install -y wget tar

# Step 3 - Download Maven
RUN wget https://archive.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz

# Step 4 - Extract Maven
RUN tar -xzf apache-maven-3.5.2-bin.tar.gz -C /opt

# Step 5 - Add to PATH and clean up
RUN echo "export PATH=/opt/apache-maven-3.5.2/bin:$PATH" >> ~/.bashrc && \
    rm apache-maven-3.5.2-bin.tar.gz

# Verify
RUN java -version && mvn -version

EXPOSE 8080