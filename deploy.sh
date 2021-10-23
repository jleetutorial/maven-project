#! /bin/bash

A=$(ls -l  /var/lib/jenkins/jobs/maven-project/builds | tail -n3 | head -n1 | awk '{print $NF}')
unset BUILD_NUMBER || true
export BUILD_NUMBER=$A

docker-compose -f /var/lib/jenkins/workspace/maven-project/docker-compose.yml up -d
