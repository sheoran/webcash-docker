FROM ubuntu:20.04

# Set timezone
ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Refetch missing packages
RUN rm -rf /var/lib/apt/lists/* &&\
    apt update --fix-missing

# Install apt packages and configure them
RUN apt install -y sudo build-essential git autoconf automake libtool python3 python3-dev python3-pip apt-transport-https curl gnupg &&\
    curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg &&\
    mv bazel.gpg /etc/apt/trusted.gpg.d/ &&\
    echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list &&\
    apt update && apt install -y bazel

#######
# # Build and install webcash and webminer
RUN mkdir /src
COPY webcash /src/webcash
COPY webminer /src/webminer

########
# Install Webcash wallet
RUN python3 -m pip install /src/webcash/

# Build webminer
RUN cd /src/webminer && bazel build -c opt webminer && ln -s /src/webminer/bazel-bin/webminer /usr/bin/webminer

# Prepare runtime
WORKDIR /data
