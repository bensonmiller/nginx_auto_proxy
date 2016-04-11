# nginx_auto_proxy
Experimentations using nginx and etcd to create automatically-configured service proxies

# TL;DR
This project is based on Kelsey Hightower's terrific confd project (https://github.com/kelseyhightower/confd) and was informed by [this](https://www.digitalocean.com/community/tutorials/how-to-use-confd-and-etcd-to-dynamically-reconfigure-services-in-coreos) document from Digital Ocean on nginx/etcd/confd integration. Instead of using Ubuntu base image, this Dockerfile is built on a lightweight Alpine Linux image.

You can start your container like this:
`docker run -e ETCD_PORT=8501 -e HOST_IP=$(hostname -s) -P <container_name> /usr/local/bin/confd-watch`

Next steps:
* Fix the`reload_command` in `confd` configuration to eliminate the startup error (`[8]: ERROR "sh: you need to specify whom to kill\n"`)
* Support HTTPS connections to the nginx proxy

# Other tips
* This container has hard-coded keys in the etcd keystore (specifically: `/cluster_alpha/hello-80`). If you want this to run for your own application, you can update the two "helloworld" example files under etc/confd/{conf.d,templates}, rebuild the docker container, and push. In the near future, this should support drop-in application support so app-config can be selected at container runtime.
