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

FROM cifuzz/jazzer as jazzer

FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y curl openjdk-17-jdk-headless

WORKDIR /app

# Download agent to fixed location in container (once final)
# RUN curl -o /app/agent.so https://github.com/opalj/JCG/blob/28977b8f3ae0e32439c26733916c70585ac4f547/jcg_dynamic_testadapter/src/main/resources/DynamicCG.so

# Copy entrypoint script to container
COPY entrypoint.sh /app/

# Copy jazzer installation from original jazzer container
COPY --from=jazzer /app/* /app/

WORKDIR /fuzzing
