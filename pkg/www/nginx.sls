nginx:
  pkg.installed:
    - name: nginx
  service:
    - running
    - enable: True
    - reload: True
    - watch:
      - pkg: nginx
