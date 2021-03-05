#!/bin/bash
function start_service() {
  echo -n "Starting Service... "
  /etc/init.d/kesl-supervisor start && echo "Done!" || echo "Failed!"
}

case "${1}" in
  shell )
    echo "stage: ${1}"
    start_service
    echo "Usage:"
    cat /root/readme
    /bin/bash
    ;;
  version )
    echo "stage: ${1}"
    start_service
    kesl-control -S --app-info | grep -v '^$'
    cat /etc/issue
    ;;
  scan )
    echo "stage: ${1}"
    start_service
    echo "Starting Scan of /data:"
    kesl-control --scan-file --action Skip /data
    echo "Found Threats"
    kesl-control -E --query 'EventType == "ThreatDetected"'
    ;;
  debug )
    echo "stage: ${1}"
    echo "Usage:"
    cat /root/readme
    /bin/bash
    ;;
esac
