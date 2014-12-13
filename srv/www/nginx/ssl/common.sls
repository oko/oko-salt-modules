include:
  - pkg.www.nginx
  - util.ssl.dhparam

/etc/nginx/conf.d/ssl_params_common.conf:
  file.managed:
    - source: salt://srv/www/nginx/ssl/ssl-params-common
    - watch_in:
      - service: nginx
