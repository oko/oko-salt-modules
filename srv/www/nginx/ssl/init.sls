include:
  - srv.www.nginx.ssl.common
  - srv.www.nginx.ssl.modern
  - srv.www.nginx.ssl.intermediate

/etc/nginx/ssl_params:
  file.symlink:
    {% if pillar.has_key('ssl_hardening') %}
    - target: /etc/nginx/ssl_params_modern
    {% else %}
    - target: /etc/nginx/ssl_params_intermediate
    {% endif %}
