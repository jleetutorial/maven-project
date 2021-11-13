#! /bin/bash
 unset BUILD_NUMBER || true 
 A=$(ls -l  /var/lib/jenkins/jobs/PIPELINE01/builds/ |tail -n3 | head -n1 | awk '{print $NF}')
  export BUILD_NUMBER=$A

#docker-compose -f pipeline_docker-compose.yml up -d 
