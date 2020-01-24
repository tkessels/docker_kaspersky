#!/bin/bash
build_date=$(date +%Y%m%d)
docker build --no-cache -t "tabledevil/kaspersky:${build_date}" -f Dockerfile_update .
docker login
docker push "tabledevil/kaspersky:${build_date}"
docker tag "tabledevil/kaspersky:${build_date}" "tabledevil/kaspersky:latest"
docker push "tabledevil/kaspersky:latest"

