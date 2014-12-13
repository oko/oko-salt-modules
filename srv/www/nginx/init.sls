include:
  - pkg.www.nginx
  - srv.www.nginx.ssl

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
