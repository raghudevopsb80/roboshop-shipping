FROM        docker.io/redhat/ubi9
RUN         cd /opt && curl -L https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz | tar -xz
ENV         PATH=$PATH:/opt/apache-maven-3.9.9-bin/bin
RUN        ls -l /opt


