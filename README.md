oko-salt-modules
================

Configuration modules for SaltStack.

## Installation

1.  Clone the repository:

  ```
  git clone https://github.com/oko/oko-salt-modules.git /path/to/desired/location
  ```

2.  Add the repository as to Salt's `file_roots` in `/etc/minion`:
  
  ```
  file_roots:
    base:
      ...
      - /path/to/desired/location
      ...
  ```

3. Use the modules!:

  ```
  include:
    - pkg.www.nginx
    ...
  ```

## Module Layout

* `pkg`: package installation states
  * `pkg.dev`: development packages
    * `pkg.dev.python`: Python development files
    * `pkg.dev.lib`: library development packages
      * `pkg.dev.lib.xml2`: `libxml2` development files
  * `pkg.util`: utility packages
    * `pkg.util.pip`: Python `pip` package installer
    * `pkg.util.ssh`: OpenSSH server
    * `pkg.util.zsh`: ZShell
  * `pkg.www`: web server packages
    * `pkg.www.nginx`: Nginx web server
    * `pkg.www.uwsgi`: uWSGI application server
* `srv`: service configuration states
  * `srv.ssh`: OpenSSH server configuration states
  * `srv.www`: web server configuration states
    * `srv.www.nginx`: Nginx configuration
      * `srv.www.nginx.ssl`: SSL parameter configuration
      * `srv.www.nginx.macros`: site macros
    * `srv.www.uwsgi`: uWSGI configuration
      * `srv.www.uwsgi.macros`: app macros
* `sys`: system configuration states
  * `sys.fw`: firewall configuration states
    * `sys.fw.iptables`: iptables configuration states

## Configuration

Certain state modules support configuration via [Pillar](http://docs.saltstack.com/en/latest/topics/pillar/index.html) variables.

### SSL hardening: `pillar['ssl_hardening']`
Use Mozilla's ["Modern"](https://wiki.mozilla.org/Security/Server_Side_TLS#Modern_compatibility) SSL settings instead of ["Intermediate"](https://wiki.mozilla.org/Security/Server_Side_TLS#Intermediate_compatibility_.28default.29). Note that many older browsers do not support the ciphers available in the "Modern" profile.

### IPv6 ICMP control: `pillar['ip6tables_icmp_accept']`
Use an `ACCEPT` policy for incoming ICMPv6 packets instead of the default behavior which follows the recommendations of [RFC4890](http://tools.ietf.org/html/rfc4890).

## License
See [LICENSE](https://github.com/oko/oko-salt-modules/blob/master/LICENSE)
