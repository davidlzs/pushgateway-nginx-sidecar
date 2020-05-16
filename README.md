Pushgateway NGINX Extras with unzip sidecar Step By Step
==================

Given that Pushgateway and Envoy does not have capability to decompression gzipped request yet, here we are using the NGINX Extras with lua script to unzip the gzipped request then proxy it to the Pushgateway.

The Tools
---------

Tools we'll be using:

1. [minikube](https://github.com/kubernetes/minikube)
2. [NGINX Extras](https://www.getpagespeed.com/nginx-extras)
3. [node exporter](https://github.com/prometheus/node_exporter)
4. [push gateway](https://github.com/prometheus/pushgateway)

References
---------

1. [Howto make Nginx decompress a gzipped request](https://www.pataliebre.net/howto-make-nginx-decompress-a-gzipped-request.html#.Xr6Ip3VKg8q)
2. [Implementing A Reverse Proxy Server In Kubernetes Using The Sidecar](https://www.magalix.com/blog/implemeting-a-reverse-proxy-server-in-kubernetes-using-the-sidecar-pattern)

Step 1: Build the sidecar docker image
================

Start `minikube`,

```minikube start```

Once minikube is started, run

```eval $(minikube docker-env)```

to get hooked up to the Minikube Docker daemon (which we'll be using when we build Docker images later).

In `nginx-extras-with-unzip` folder, run

```docker build -t nginxsidecar .```

You should see your docker image on your local docker registry.


Step 2: Deploy Pushgateway and it's sidecar
================

In root folder, run:

```kubectl apply -f pushgateway_deployment.yaml```

Step 3: Test/Verify
================

If you are running on Linux, you can start `node-exporter`.

Use `push_node_exporter_metrics.sh` to push metrics in gzipped format to the Pushgateway.

```./push_node_exporter_metrics.sh```

If all good, you should see `200` response code from the aforementioned command.
