include:
  - sys.fw.ip6tables

/etc/ip6tables.d/0100-global-https:
  file.managed:
    - source: salt://sys/fw/ip6tables/ip6tables.d/0100-global-https
    - require_in:
      - file: /etc/ip6tables.d

