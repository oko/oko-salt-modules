include:
  - pkg.www.nginx

/etc/nginx/ssl_params_modern:
  file.managed:
    - source: salt://srv/www/nginx/ssl/ssl-params-moz-modern
    - require:
      - file: /etc/nginx/conf.d/ssl_params_common.conf
    - watch_in:
      - service: nginx
