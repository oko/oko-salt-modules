include:
  - pkg.sys.iptables

# Pre-userconf global rules
/etc/ip6tables.d/0000-global-pre:
  file.managed:
    - source: salt://sys/fw/ip6tables/ip6tables.d/0000-global-pre
    - makedirs: True

{% if pillar.has_key("ip6tables_icmp_accept") %}
/etc/ip6tables.d/9998-icmp:
  file.managed:
    - source: salt://sys/fw/ip6tables/ip6tables.d/9998-icmp-accept
    - makedirs: True
{% else %}
/etc/ip6tables.d/9998-icmp:
  file.managed:
    - source: salt://sys/fw/ip6tables/ip6tables.d/9998-icmp-rfc4890
    - makedirs: True
{% endif %}

# Post-userconf global rules
/etc/ip6tables.d/9999-global-post:
  file.managed:
    - source: salt://sys/fw/ip6tables/ip6tables.d/9999-global-post

/etc/ip6tables.d:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 750
    - file_mode: 640
    - clean: True
    - require:
      - file: /etc/ip6tables.d/0000-global-pre
      - file: /etc/ip6tables.d/9998-icmp
      - file: /etc/ip6tables.d/9999-global-post

build-ip6tables:
  cmd.run:
    - shell: /bin/sh
    - name: "cat /etc/ip6tables.d/* > /etc/ip6tables.rules"
    - require:
      - file: /etc/ip6tables.d
apply-ip6tables:
  cmd.run:
    - shell: /bin/sh
    - name: "ip6tables-restore < /etc/ip6tables.rules"
    - require:
      - cmd: build-ip6tables

/etc/network/if-pre-up.d/ip6tables:
  file.managed:
    - user: root
    - group: root
    - mode: 755
    - source: salt://sys/fw/ip6tables/ip6tables-pre-up
    - require:
      - file: /etc/ip6tables.d
