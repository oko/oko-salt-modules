include:
  - sys.fw.iptables

/etc/iptables.d/0100-global-https:
  file.managed:
    - source: salt://sys/fw/iptables/iptables.d/0100-global-https
    - require_in:
      - file: /etc/iptables.d

