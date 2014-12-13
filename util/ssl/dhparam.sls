gen-dhparam:
  cmd.run:
    - name: openssl dhparam 4096 > /etc/ssl/private/dhparam.pem
    - unless: test -f /etc/ssl/private/dhparam.pem
