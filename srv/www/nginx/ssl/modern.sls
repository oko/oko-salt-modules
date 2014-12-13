include:
  - pkg.www.nginx

/etc/nginx/ssl_params:
  file.managed:
    - source: salt://srv/www/nginx/ssl/ssl-params-moz-modern
    - require:
      - file: /etc/nginx/ssl_params_common
    - watch_in:
      - service: nginx
