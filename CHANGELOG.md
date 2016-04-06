# neo4j-cookbook CHANGELOG

This file is used to list changes made in each version of the neo4j cookbook.

## 1.0.6 / 2016-04-06

### Added
* sha256 hashes for 2.3.3 release

### Changed
* Updated Gemfile.lock

## 1.0.5 / 2016-02-23

### Added
* sha256 hashes for 2.3.2 release

### Changed
* Updated Gemfile.lock
* Fixed rubocop violations

## 1.0.4 / 2015-12-02

### Fixed
* Version constraints for cookbook dependencies loosened to make them play nice with other cookbook dependencies.
* Package lsof not always existing on EPEL installs.  It is required by the tarball installation.

## 1.0.3 / 2015-11-26

### Added
* Tests for Chef 11.10, the version of Chef that AWS Opsworks uses
* sha256 hashes for 2.2.7, and 2.3.1 releases

### Changed
* Updated Gemfile.lock
* Test Kitchen for latest release changed to tarball from package installation method so that new hashes can more easily be tested

## 1.0.2 / 2015-10-26

### Added
* sha256 hashes for 2.2.5, 2.2.6, and 2.3.0 releases
* New configuration options introduced in 2.2.6 and 2.3.0 releases

## 1.0.1 / 2015-09-03

### Fixed
* Minor issue with README formatting where a merge conflict wasn't fully resolved.

## 1.0.0 / 2015-09-03

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
* default version installed updated from 2.2.3 to 2.2.4
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
