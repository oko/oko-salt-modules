include:
  - pkg.www.nginx

/etc/nginx/ssl_params_common:
  file.managed:
    - source: salt://srv/www/nginx/ssl/ssl-params-common
    - watch_in:
      - service: nginx
