# Another docker image for graphite

* built on centos:7
* runs carbon-cache and graphite-web (gunicorn_django) through supervisord
* support setting a few things through ENV
  * TIME_ZONE
  * STORAGE_SCHEMA
  * CARBON_SCHEMA
