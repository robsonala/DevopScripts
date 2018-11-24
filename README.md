# DevopScripts
Scripts to automise install / deploy projects

### Before installation
Give permission to `run-permissions` and execute it
```bash
$ chmod +x run-permissions
$ sudo ./run-permissions
```

### PHP Installation
PHP installation is performed by `install-php`
**The script must be executed as SUDO**
```bash
$ sudo ./install-php -h
PHP installation for Ubuntu / Debian / CentOS

Usage
    [-h] Help
    [-l] List available PHP version to install
    [-pv] Set PHP Version
    [-c] Check if it is installed
    [-u] Run Uninstall mode
    
$ sudo ./install-php -l
7.1  7.2
    
$ sudo ./install-php -pv 7.1
Using PHP version 7.1
Reading package lists... Done
(...)
Finished...
    
$ sudo ./install-php -pv 7.1 -c
Using PHP version 7.1
PHP Version found
Packages found
php7.1-cli                                      install
php7.1-common                                   install
Finished...
    
$ sudo ./install-php -pv 7.1 -u
Unistalling mode
Using PHP version 7.1
Reading package lists... Done
(...)
Finished...
```
### Todos
 - Add support to CentOS
 - Test it on Debian :P
 - Improve documentation

License
----
MIT

**Free Software, Hell Yeah!**