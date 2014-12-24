include:
  - pkg.sys.ntp

ntp-service:
  service.running:
    - name: ntp
    - enable: True
