#!/bin/sh

./gradlew build
docker-compose up
docker-compose cp jazzer:/fuzzing/coverage coverage