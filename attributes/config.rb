# neo4j-server.properties
default['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.database.location'] = node['neo4j']['data_dir']
default['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.db.tuning.properties'] = 'conf/neo4j.properties'
default['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.webserver.address'] = node['ipaddress']
default['neo4j']['config']['neo4j-server.properties']['dbms.security.auth_enabled'] = true
default['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.webserver.port'] = 7474
default['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.webserver.https.enabled'] = true
default['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.https.port'] = 7473
default['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.webserver.https.cert.location'] = 'conf/ssl/snakeoil.cert'
default['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.webserver.https.key.location'] = 'conf/ssl/snakeoil.key'
default['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.webserver.https.keystore.location'] = 'data/keystore'
default['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.http.log.enabled'] = false
default['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.http.log.config'] = 'conf/neo4j-http-logging.xml'
default['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.webadmin.rrdb.location'] = 'data/rrd'
default['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.webserver.max.request.header'] = nil
default['neo4j']['config']['neo4j-server.properties']['org.neo4j.server.webserver.max.response.header'] = nil

# neo4j.properties
default['neo4j']['config']['neo4j.properties']['allow_store_upgrade'] = nil
default['neo4j']['config']['neo4j.properties']['dbms.pagecache.memory'] = nil
default['neo4j']['config']['neo4j.properties']['cypher_parser_version'] = nil
default['neo4j']['config']['neo4j.properties']['keep_logical_logs'] = '7 days'
default['neo4j']['config']['neo4j.properties']['node_auto_indexing'] = nil
default['neo4j']['config']['neo4j.properties']['node_keys_indexable'] = nil
default['neo4j']['config']['neo4j.properties']['relationship_auto_indexing'] = nil
default['neo4j']['config']['neo4j.properties']['relationship_keys_indexable'] = nil
default['neo4j']['config']['neo4j.properties']['remote_shell_enabled'] = false
default['neo4j']['config']['neo4j.properties']['remote_shell_host'] = '127.0.0.1'
default['neo4j']['config']['neo4j.properties']['remote_shell_port'] = 1337
default['neo4j']['config']['neo4j.properties']['cache_type'] = nil
default['neo4j']['config']['neo4j.properties']['allow_file_urls'] = true
default['neo4j']['config']['neo4j.properties']['dbms.cypher.min_replan_interval'] = nil
default['neo4j']['config']['neo4j.properties']['dbms.cypher.planner'] = nil
default['neo4j']['config']['neo4j.properties']['dbms.querylog.enabled'] = false
default['neo4j']['config']['neo4j.properties']['dbms.querylog.filename'] = nil
default['neo4j']['config']['neo4j.properties']['dbms.querylog.threshold'] = nil
default['neo4j']['config']['neo4j.properties']['dbms.querylog.max_archives'] = nil
default['neo4j']['config']['neo4j.properties']['dbms.querylog.rotation.threshold'] = nil
default['neo4j']['config']['neo4j.properties']['dense_node_threshold'] = nil
default['neo4j']['config']['neo4j.properties']['dump_configuration'] = nil
default['neo4j']['config']['neo4j.properties']['index_background_sampling_enabled'] = nil
default['neo4j']['config']['neo4j.properties']['index_sampling_buffer_size'] = nil
default['neo4j']['config']['neo4j.properties']['index_sampling_update_percentage'] = nil
default['neo4j']['config']['neo4j.properties']['logical_log_rotation_threshold'] = nil
default['neo4j']['config']['neo4j.properties']['logical_log'] = ::File.join(node['neo4j']['log_dir'], 'logical.log')
default['neo4j']['config']['neo4j.properties']['lucene_searcher_cache_size'] = nil
default['neo4j']['config']['neo4j.properties']['query_cache_size'] = nil
default['neo4j']['config']['neo4j.properties']['read_only'] = nil
default['neo4j']['config']['neo4j.properties']['relationship_grab_size'] = nil
default['neo4j']['config']['neo4j.properties']['remote_logging_enabled'] = nil
default['neo4j']['config']['neo4j.properties']['remote_logging_host'] = nil
default['neo4j']['config']['neo4j.properties']['remote_logging_port'] = nil
default['neo4j']['config']['neo4j.properties']['store_dir'] = nil

# neo4j-wrapper
default['neo4j']['config']['neo4j-wrapper.conf']['wrapper.java.additional'] = %w(
  -Dorg.neo4j.server.properties=conf/neo4j-server.properties
  -Djava.util.logging.config.file=conf/logging.properties
  -XX:+UseConcMarkSweepGC
  -XX:+CMSClassUnloadingEnabled
  -XX:-OmitStackTraceInFastThrow
  -XX:hashCode=5
)

default['neo4j']['config']['neo4j-wrapper.conf']['wrapper.pidfile'] = node['neo4j']['pid_file']
default['neo4j']['config']['neo4j-wrapper.conf']['wrapper.name'] = 'neo4j'
default['neo4j']['config']['neo4j-wrapper.conf']['wrapper.user'] = 'neo4j'

# logging.properties
default['neo4j']['config']['logging.properties']['handlers'] = 'java.util.logging.FileHandler, java.util.logging.ConsoleHandler'
default['neo4j']['config']['logging.properties']['.level'] = 'INFO'
default['neo4j']['config']['logging.properties']['org.neo4j.server.level'] = 'INFO'
default['neo4j']['config']['logging.properties']['java.util.logging.ConsoleHandler.level'] = 'INFO'
default['neo4j']['config']['logging.properties']['java.util.logging.ConsoleHandler.formatter'] = 'org.neo4j.server.logging.SimpleConsoleFormatter'
default['neo4j']['config']['logging.properties']['java.util.logging.ConsoleHandler.filter'] = 'org.neo4j.server.logging.NeoLogFilter'
default['neo4j']['config']['logging.properties']['java.util.logging.FileHandler.level'] = 'ALL'
default['neo4j']['config']['logging.properties']['java.util.logging.FileHandler.pattern'] = ::File.join(node['neo4j']['log_dir'], 'neo4j.%u.%g.log')
default['neo4j']['config']['logging.properties']['java.util.logging.FileHandler.append'] = true
default['neo4j']['config']['logging.properties']['java.util.logging.FileHandler.limit'] = '10000000'
default['neo4j']['config']['logging.properties']['java.util.logging.FileHandler.count'] = '10'
default['neo4j']['config']['logging.properties']['java.util.logging.FileHandler.formatter'] = 'java.util.logging.SimpleFormatter'
