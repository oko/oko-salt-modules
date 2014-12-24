include:
  - pkg.sys.iptables

# Pre-userconf global rules
/etc/iptables.d/0000-global-pre:
  file.managed:
    - source: salt://sys/fw/iptables/iptables.d/0000-global-pre
    - makedirs: True

# Post-userconf global rules
/etc/iptables.d/9999-global-post:
  file.managed:
    - source: salt://sys/fw/iptables/iptables.d/9999-global-post

/etc/iptables.d:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 750
    - file_mode: 640
    - clean: True
    - require:
      - file: /etc/iptables.d/0000-global-pre
      - file: /etc/iptables.d/9999-global-post

build-iptables:
  cmd.run:
    - shell: /bin/sh
    - name: "cat /etc/iptables.d/* > /etc/iptables.rules"
    - require:
      - file: /etc/iptables.d
apply-iptables:
  cmd.run:
    - shell: /bin/sh
    - name: "iptables-restore < /etc/iptables.rules"
    - require:
      - cmd: build-iptables
/etc/network/if-pre-up.d/iptables:
  file.managed:
    - user: root
    - group: root
    - mode: 755
    - source: salt://sys/fw/iptables/iptables-pre-up
    - require:
      - file: /etc/iptables.d
