#!/usr/bin/env bash
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

set -e

# Make sure jazzer uses the JVM-TI Agent (once it is final)
# export JAVA_OPTIONS="${JAVA_OPTIONS} -agentlib:/app/agent.so"

# Build the classpath string for jazzer. Contains all files located in /data seperated by a colon
CP=""

for entry in /data/*
do
  CP+="$entry:"
done

echo "Starting Jazzer with classpath: ${CP::-1}"
echo "Autofuzz entry point is: $1"

# Call jazzer. Classpath contains all files located at /data. Full Method reference must be passed as first argument. Optional jazzer args can be passed as second argument.
/app/jazzer \
  --cp="${CP::-1}" \
  --autofuzz="$1" \
  "${@:2}"
