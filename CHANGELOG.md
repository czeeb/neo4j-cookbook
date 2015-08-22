# neo4j-cookbook CHANGELOG

This file is used to list changes made in each version of the neo4j cookbook.

## Unreleased

### Added
* Package install support for `rhel` platform family
* yum repository resource for `rhel` platform family
* Attributes for `yum/apt` resources
* Support for `tarball` based installation
* `chefignore`
* Support for `enterprise` edition tarball installation
* Support for `enterprise` edition package installation
* `rake` tasks
* Resources for core directory locations

### Changed
* `java` setup optional
* Move `configuration` files attributes to `default['neo4j']['config']['...']`
* Render `configuration` files attributes instead of managing individual parameters
* Update `.gitignore` for common patterns
* Resource attribute `backup` configurable with default value `5`
* Define global `user/group` node attributes instead of hardcoding for various resources
* `node['ipaddress']` instead for config parameter `default['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.webserver.address']`
* Restrict `java` heap size to 32G limit

### Fixed
* `ulimit` warning for init.d scripts

## 0.1.0 / 2015-06-06

* Initial release of neo4j-cookbook
