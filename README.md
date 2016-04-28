# nginx_auto_proxy
This project represents a Docker container that will create auto-configuring Nginx reverse proxies via integration with Consul. You can find the Consul-related stuff in the `consul` branch. Similar stuff for `etcd` integration (basically deprecated at this point) is available in the `master` branch

After you've built your container,  start it like this:
`docker run -d -P -e MONITORED_SERVICE=<service_name_in_consul> -e CONSUL_PORT=8500 -e HOST_IP=172.17.0.1 <container_name>`

NOTE:
- The `CONSUL_PORT` variable will default to 8500, so you only need to override if using something else.
- The `HOST_IP` variable is where Consul Agent should be running. Defaults to 172.17.0.1; change if yours is different.

# Background
This project started as an experiment with Kelsey Hightower's terrific confd project (https://github.com/kelseyhightower/confd) and was informed by [this](https://www.digitalocean.com/community/tutorials/how-to-use-confd-and-etcd-to-dynamically-reconfigure-services-in-coreos) document from Digital Ocean on nginx/etcd/confd integration. Instead of using Ubuntu base image, this Dockerfile is built on a lightweight Alpine Linux image. You can find this original experiment in the `master` branch. But the `consul` branch is more up-to-date.

If you want the Consul integration, with Consul Template, you should change to the `consul` branch and build the Docker container from there.


Next steps:
* Support HTTPS connections to the nginx proxy via SSL cert injection.
* Allow passing a service tag as an ENV variable, so that you could filter a service based on a tag (perhaps used to store a software revision)
