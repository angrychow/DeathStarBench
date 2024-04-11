#!/bin/bash

(../wrk2/wrk -D exp -t 10 -c 10 -d 10s -L -s ./wrk2/scripts/social-network/compose-post.lua http://localhost:8080/wrk2-api/post/compose -R 1000 & \
../wrk2/wrk -D exp -t 10 -c 10 -d 10s -L -s ./wrk2/scripts/social-network/read-home-timeline.lua http://localhost:8080/wrk2-api/home-timeline/read -R 1000 & \
../wrk2/wrk -D exp -t 10 -c 10 -d 10s -L -s ./wrk2/scripts/social-network/read-user-timeline.lua http://localhost:8080/wrk2-api/user-timeline/read -R 1000 ) \
> benchmark_requests.txt 2>&1

