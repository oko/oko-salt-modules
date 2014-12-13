include:
  - pkg.www.nginx
  - srv.www.nginx.ssl.common
  {% if pillar.has_key('www_ssl_intermediate') %}
  - srv.www.nginx.ssl.intermediate
  {% else %}
  - srv.www.nginx.ssl.modern
  {% endif %}

/etc/nginx/ssl:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 700
    - file_mode: 600
    # Enforce root-only access to SSL certificates
    - recurse:
      - user
      - group
      - mode
    - require:
      - pkg: nginx

/etc/nginx/conf.d/hardening.conf:
  file.managed:
    - source: salt://srv/www/nginx/hardening.conf
    - watch_in:
      - service: nginx
