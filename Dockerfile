# Use a base image with Ubuntu, which is similar to the CI environment
FROM ubuntu:latest

#Default directory
WORKDIR /cJSON


# update dependencies for cifuzz
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl make clang cmake llvm lcov python3.10 openjdk-11-jdk zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/CodeIntelligenceTesting/cifuzz/main/install.sh)"

RUN which cifuzz
RUN cifuzz --version

#Copy files into docker
COPY . .

RUN ls -a

CMD ["bash", "./run_tests.sh"]
