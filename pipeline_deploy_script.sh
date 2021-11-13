#! /bin/bash
 unset BUILD_NUMBER || true 
 A=$(ls /var/lib/jenkins/jobs/PIPELINE01/builds > file && sort -n file  | tail -1)
  export BUILD_NUMBER=$A

docker-compose -f pipeline_docker-compose.yml up -d 
