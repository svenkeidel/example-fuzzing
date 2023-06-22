#!/bin/sh

# Clean up files of prior fuzzing runs
./gradlew clean

# Build the application
./gradlew build

# Create required files
touch build/merge_control

# Run the fuzzer
docker-compose up

# Copy coverage files from container into host system
docker-compose cp jazzer:/fuzzing/coverage.txt build/coverage.txt
docker-compose cp jazzer:/fuzzing/coverage.exec build/coverage.exec