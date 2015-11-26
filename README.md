neo4j Cookbook
==============
[![Build Status](https://travis-ci.org/czeeb/neo4j-cookbook.svg?branch=master)](https://travis-ci.org/czeeb/neo4j-cookbook)
[![Dependency Status](https://gemnasium.com/czeeb/neo4j-cookbook.svg)](https://gemnasium.com/czeeb/neo4j-cookbook)
[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/czeeb/neo4j-cookbook?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

This is a [Chef] cookbook to manage [Neo4j] (Community & Enterprise Edition).

Platforms
---------
The following platforms and versions are tested and supported using [test-kitchen](http://kitchen.ci/)

* CentOS 6.6, 7.1
* Debian 7.8, 8.1
* Ubuntu 12.04, 14.04

Other versions that should work fine but are not testing in [test-kitchen].
* Amazon Linux 2015-03
* RHEL >= 6.6

Java Attributes
---------------

This cookbook uses the [java](https://supermarket.chef.io/cookbooks/java) cookbook to install java.  A [wrapper cookbook](https://www.chef.io/blog/2013/12/03/doing-wrapper-cookbooks-right/) can be used to change the default behaviour and install other flavours of the JDK and/or different versions.

Attributes
----------

Wherever possible I use the default settings from Neo4j for the defaults in the attributes file.

* `node['neo4j']['release']` - Package version to install
* `node['neo4j']['release_suffix']` - If the release version requires a suffix, add it here. Such as `2.2.4-1` set it to '-1'
* `node['neo4j']['edition']` - Valid values are `community` and `enterprise`
* `node['neo4j']['install_java']` - Boolean for if the neo4j cookbook should install java. Default: `true`
* `node['neo4j']['install_method']` - Valid values are `package` or `tarball`
* `node['neo4j']['package']` - Name of package to install.  You shouldn't need to change this
* `node['neo4j']['service_action']` - Action to set neo4j service to.  Type: Array
* `node['neo4j']['notify_restart']` - Type: Boolean.  If template updates should notify the neo4j service to restart or not
* `node['neo4j']['cookbook']` - The cookbook used for configuration file template resources
* `node['neo4j']['chef_backup']` - Type: Integer.  Number of backups to keep for template resources

### Tarball installation method specific attributes

* `node['neo4j']['tarball_url']` - URL used to download neo4j tarball
* `node['neo4j']['tarball_checksum'][<version>][<edition>]` - Checksum used to verify tarball download
* `node['neo4j']['parent_dir']` - Parent directory used
* `node['neo4j']['install_dir']` - Directory that neo4j is installed into
* `node['neo4j']['source_dir']` - Directory used to explode the tarball into

### neo4j-server.properties

* `node['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.database.location']` - location of the database directory
* `node['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.db.tuning.properties']` - Low-level graph tuning engine file
* `node['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.webserver.address']` - web server port
* `node['neo4j']['config']['neo4j-server.properties']['dbms.security.auth_enabled']` - Enabled or disable auth to access neo4j
* `node['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.webserver.port']` - Web server port
* `node['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.webserver.https.enabled']` - Turn https support on/off
* `node['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.https.port']` - https port
* `node['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.webserver.https.cert.location']` - SSL cert location
* `node['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.webserver.https.key.location']` - SSL key location
* `node['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.webserver.https.keystore.location']` - keystore location
* `node['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.http.log.enabled']` - enable/disable http logging
* `node['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.http.log.config']` - http logging config
* `node['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.webadmin.rrdb.location']` - location of rrd database directory
* `node['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.webserver.max.request.header']` - Set maximum request header size. Introduced in 2.3.0.
* `node['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.webserver.max.response.header']` -  Set maximum reqponse header size.  Introduced in 2.3.0.

### neo4j-server.properties

[Neo4j Documentation](http://neo4j.com/docs/stable/configuration-settings.html)

* `node['neo4j']['config']['neo4j.properties']['allow_store_upgrade']` - Enable this to be able to upgrade a store from an older version
* `node['neo4j']['config']['neo4j.properties']['dbms.pagecache.memory']` - Set pagecache memory to use. Neo4j usually does a good job of figuring this out on its own
* `node['neo4j']['config']['neo4j.properties']['cypher_parser_version']` - Enable this to specify a parser other than the default one
* `node['neo4j']['config']['neo4j.properties']['keep_logical_logs']` - Keep logical logs
* `node['neo4j']['config']['neo4j.properties']['node_auto_indexing']` - Enable auto-indexing for nodes
* `node['neo4j']['config']['neo4j.properties']['node_keys_indexable']` - The node property keys to be auto-indexed
* `node['neo4j']['config']['neo4j.properties']['relationship_auto_indexing']` - Enable auto-indexing for relationships
* `node['neo4j']['config']['neo4j.properties']['relationship_keys_indexable']` - The relationship property keys to be auto-indexed, if enabled
* `node['neo4j']['config']['neo4j.properties']['remote_shell_enabled']` - Enable shell server so that remote clients can connect via Neo4j shell
* `node['neo4j']['config']['neo4j.properties']['remote_shell_host']` - The network interface IP the shell will listen on (use 0.0.0 for all interfaces)
* `node['neo4j']['config']['neo4j.properties']['remote_shell_port']` - The port the shell will listen on
* `node['neo4j']['config']['neo4j.properties']['cache_type']` - The type of cache to use for nodes and relationships. Depreciated in 2.3.0.
* `node['neo4j']['config']['neo4j.properties']['allow_file_urls']` - Determines if Cypher will allow using file URLs when loading data using LOAD CSV
* `node['neo4j']['config']['neo4j.properties']['dbms.cypher.min_replan_interval']` - The minimum lifetime of a query plan before a query is considered for replanning.
* `node['neo4j']['config']['neo4j.properties']['dbms.cypher.planner']` - Set this to specify the default planner.
* `node['neo4j']['config']['neo4j.properties']['dbms.querylog.enabled']` - Log executed queries that takes longer than the configured threshold.
* `node['neo4j']['config']['neo4j.properties']['dbms.querylog.filename']` - The file where queries will be recorded.
* `node['neo4j']['config']['neo4j.properties']['dbms.querylog.threshold']` - If the execution of query takes more time than this threshold, the query is logged - provided query logging is enabled.
* `node['neo4j']['config']['neo4j.properties']['dbms.querylog.rotation.threshold']` - Specifies maximum number of history files to keep. Introduced in 2.3.0.
* `node['neo4j']['config']['neo4j.properties']['dbms.querylog.rotation.threshold']` - Specifies at which file size the query log will autorotate.  Introduced in 2.2.6.
* `node['neo4j']['config']['neo4j.properties']['dense_node_threshold']` - Relationship count threshold for considering a node to be dense.
* `node['neo4j']['config']['neo4j.properties']['dump_configuration']` - Print out the effective Neo4j configuration after startup.
* `node['neo4j']['config']['neo4j.properties']['index_background_sampling_enabled']` - Enable or disable background index sampling.
* `node['neo4j']['config']['neo4j.properties']['index_sampling_buffer_size']` - Size of buffer used by index sampling.
* `node['neo4j']['config']['neo4j.properties']['index_sampling_update_percentage']` - Percentage of index updates of total index size required before sampling of a given index is triggered.
* `node['neo4j']['config']['neo4j.properties']['logical_log_rotation_threshold']` - Specifies at which file size the logical log will auto-rotate.
* `node['neo4j']['config']['neo4j.properties']['lucene_searcher_cache_size']` - The maximum number of open Lucene index searchers.
* `node['neo4j']['config']['neo4j.properties']['query_cache_size']` - The number of Cypher query execution plans that are cached.
* `node['neo4j']['config']['neo4j.properties']['read_only']` - Only allow read operations from this Neo4j instance.
* `node['neo4j']['config']['neo4j.properties']['relationship_grab_size']` - How many relationships to read at a time during iteration.
* `node['neo4j']['config']['neo4j.properties']['remote_logging_enabled']` - Whether to enable logging to a remote server or not.
* `node['neo4j']['config']['neo4j.properties']['remote_logging_host']` - Host for remote logging using Logback SocketAppender.
* `node['neo4j']['config']['neo4j.properties']['remote_logging_port']` - Port for remote logging using Logback SocketAppender.
* `node['neo4j']['config']['neo4j.properties']['store_dir']` - The directory where the database files are located.

### neo4j-wrapper.conf
* `node['neo4j']['config']['neo4j-wrapper.conf']['wrapper.java.additional']` - Array of arguements to pass to java
* `node['neo4j']['config']['neo4j-wrapper.conf']['wrapper.java.initmemory']` - Set heap size
* `node['neo4j']['config']['neo4j-wrapper.conf']['wrapper.java.maxmemory']` - Set heap size maximum
* `node['neo4j']['config']['neo4j-wrapper.conf']['wrapper.pidfile']` - Set pidfile

Usage
-----
#### neo4j::default

e.g.
Just include `neo4j` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[neo4j]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github to the development branch

License and Authors
-------------------
Authors: Chris Zeeb <chris.zeeb@gmail.com> and [Contributors]

```text
Copyright:: 2015 Chris Zeeb <chris.zeeb@gmail.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

[Chef]: https://www.chef.io
[Neo4j]: http://neo4j.com
[Contributors]: https://github.com/czeeb/neo4j-cookbook/graphs/contributors
