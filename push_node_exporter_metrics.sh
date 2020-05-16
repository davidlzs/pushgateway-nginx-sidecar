#!/bin/bash
PUSHGATEWAY_SERVER=http://`minikube ip`:30901
NODE_NAME=`hostname`
# curl -s localhost:9100/metrics | curl -u USERNAME:PASSWORD --data-binary @- $PUSHGATEWAY_SERVER/metrics/job/node-exporter/instance/$NODE_NAME

# curl -s localhost:9100/metrics | curl -v --data-binary @- $PUSHGATEWAY_SERVER/metrics/job/node-exporter/instance/$NODE_NAME

curl -s localhost:9100/metrics | gzip | curl -v -H'Content-Encoding: gzip' --data-binary @- $PUSHGATEWAY_SERVER/metrics/job/node-exporter/instance/$NODE_NAME

# curl -s localhost:9100/metrics | curl -v -H'Content-Encoding: gzip' --data-binary @- $PUSHGATEWAY_SERVER/