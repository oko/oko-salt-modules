include:
  - pkg.www.nginx

/etc/nginx/ssl_params_intermediate:
  file.managed:
    - source: salt://srv/www/nginx/ssl/ssl-params-moz-intermediate
    - require:
      - file: /etc/nginx/conf.d/ssl_params_common.conf
    - watch_in:
      - service: nginx
