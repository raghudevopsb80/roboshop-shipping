FROM        docker.io/redhat/ubi9 AS build
RUN         dnf install unzip -y
RUN         cd /opt && curl -L https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz | tar -xz
RUN         cd /opt && curl -L https://corretto.aws/downloads/latest/amazon-corretto-17-x64-linux-jdk.tar.gz | tar -xz
ENV         PATH=$PATH:/opt/apache-maven-3.9.9/bin:/opt/amazon-corretto-17.0.12.7.1-linux-x64/bin
RUN         mkdir /app
WORKDIR     /app
COPY        src /app/src
COPY        pom.xml run.sh /app/
RUN         mvn clean package


FROM        docker.io/redhat/ubi9
RUN         dnf install unzip -y
RUN         cd /opt && curl -L https://corretto.aws/downloads/latest/amazon-corretto-17-x64-linux-jdk.tar.gz | tar -xz
RUN         mkdir /app
WORKDIR     /app
COPY        --from=build /app/target/shipping-1.0.jar /app/shipping.jar
RUN         curl -L -O https://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic-java.zip && unzip newrelic-java.zip && rm -f newrelic-java.zip
COPY        newrelic.yml /app/newrelic/newrelic.yml
ENTRYPOINT  ["bash", "/app/run.sh"]





