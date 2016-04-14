# nginx_auto_proxy
Experimentations using Nginx and etcd and Consul to create automatically-configured service proxies

# TL;DR
The etcd integration for this container is based on Kelsey Hightower's terrific confd project (https://github.com/kelseyhightower/confd) and was informed by [this](https://www.digitalocean.com/community/tutorials/how-to-use-confd-and-etcd-to-dynamically-reconfigure-services-in-coreos) document from Digital Ocean on nginx/etcd/confd integration. Instead of using Ubuntu base image, this Dockerfile is built on a lightweight Alpine Linux image.

You can start your container like this:
`docker run -e ETCD_PORT=8501 -e HOST_IP=$(hostname -s) -P <container_name> /usr/local/bin/confd-watch`

The consul integration for this container is based on Hashicorp's Consul Template, which is used as an equivalent to confd (but working for Consul's service registry).

Build your container for the correct backend by pointing to the backend-specific Dockerfile.

Next steps:
* Support HTTPS connections to the nginx proxy
