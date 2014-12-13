{% macro uwsgi_app(name, port, path, app) %}
uwsgi-site-{{name}}:
  file.managed:
    - name: /etc/uwsgi/apps-available/{{name}}.ini
    - source: salt://srv/www/uwsgi/app-template.ini
    - user: root
    - group: root
    - mode: 640
    - context:
      - port: {{port}}
      - path: {{path}}
      - app: {{app}}
{% endmacro %}
