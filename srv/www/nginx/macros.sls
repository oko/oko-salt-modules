{% macro nginx_simple_site(domain, source, user, group, ssl=False) %}
# Create main site file
/etc/nginx/sites-available/{{domain}}.site:
  file.managed:
    - source: {{source}}
    - user: root
    - group: root
    - mode: 640
    - watch_in:
      - service: nginx
    {% if ssl %}
    - require:
      - file: /etc/nginx/ssl_params
    {% endif %}

# Enable via symlink
/etc/nginx/sites-enabled/{{domain}}.site:
  file.symlink:
    - target: /etc/nginx/sites-available/{{domain}}.site
    - user: root
    - group: root
    - mode: 640

# Create a directory under `/srv/http` for static files
/srv/http/{{domain}}:
  file.directory:
    - makedirs: True
    - user: {{user}}
    - group: {{group}}
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - mode
    - require:
      - user: {{user}}
{% endmacro %}
