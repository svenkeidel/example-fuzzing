# Copyright 2021 Code Intelligence GmbH
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y curl git python3 openjdk-17-jdk-headless busybox clang

WORKDIR /root
RUN curl -L https://github.com/bazelbuild/bazelisk/releases/download/v1.15.0/bazelisk-linux-amd64 -o /usr/bin/bazelisk && \
    chmod +x /usr/bin/bazelisk && \
    git clone --depth=1 https://github.com/CodeIntelligenceTesting/jazzer.git && \
    cd jazzer && \
    # The LLVM toolchain requires ld and ld.gold to exist, but does not use them.
    touch /usr/bin/ld && \
    touch /usr/bin/ld.gold && \
    bazelisk build --config=docker //launcher:jazzer && \
    mkdir -p /app && \
    cp $(bazelisk cquery --config=docker --output=files //src/main/java/com/code_intelligence/jazzer:jazzer_standalone_deploy.jar) /app/jazzer_standalone.jar && \
    cp $(bazelisk cquery --config=docker --output=files //launcher:jazzer) /app/

COPY ./mutator/src/main/cpp/mutator.cpp .
RUN clang++ -shared -o libmutator.so mutator.cpp && \
    cp libmutator.so /app/

WORKDIR /fuzzing
ENTRYPOINT [ "/app/jazzer" ]