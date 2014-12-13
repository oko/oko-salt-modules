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

## License
See LICENSE
