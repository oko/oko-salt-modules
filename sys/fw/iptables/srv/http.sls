include:
  - sys.fw.iptables

/etc/iptables.d/0100-global-http:
  file.managed:
    - source: salt://sys/fw/iptables/iptables.d/0100-global-http
    - require_in:
      - file: /etc/iptables.d

