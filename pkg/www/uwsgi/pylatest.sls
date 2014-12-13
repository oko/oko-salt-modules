include:
  - pkg.dev.python
  - pkg.dev.lib.xml2

uwsgi:
  pip.installed:
    - require:
      - pkg: libxml2-dev
uwsgi-init:
  file.managed:
    - name: /etc/init/uwsgi.conf
    - source: salt://pkg/www/uwsgi/upstart-script
    - user: root
    - group: root
    - mode: 644
uwsgi-conf:
  file.directory:
    - name: /etc/uwsgi/sites.d
    - makedirs: True
    - file_mode: 640
    - dir_mode: 750
    - user: root
    - group: root
    - require:
      - pip: uwsgi
      - file: uwsgi-init
