default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = 7
default['java']['oracle']['accept_oracle_download_terms'] = true

default['neo4j']['release'] = '2.2.3'

# neo4j-server.properties
default['neo4j']['neo4j-server.properties']['org.neo4j.server.database.location'] = 'data/graph.db'
default['neo4j']['neo4j-server.properties']['org.neo4j.server.db.tuning.properties'] = 'conf/neo4j.properties'
default['neo4j']['neo4j-server.properties']['org.neo4j.server.webserver.address'] = 'localhost'
default['neo4j']['neo4j-server.properties']['dbms.security.auth_enabled'] = true
default['neo4j']['neo4j-server.properties']['org.neo4j.server.webserver.port'] = 7474
default['neo4j']['neo4j-server.properties']['org.neo4j.server.webserver.https.enabled'] = true
default['neo4j']['neo4j-server.properties']['org.neo4j.server.https.port'] = 7473
default['neo4j']['neo4j-server.properties']['org.neo4j.server.webserver.https.cert.location'] = 'conf/ssl/snakeoil.cert'
default['neo4j']['neo4j-server.properties']['org.neo4j.server.webserver.https.key.location'] = 'conf/ssl/snakeoil.key'
default['neo4j']['neo4j-server.properties']['org.neo4j.server.webserver.https.keystore.location'] = 'data/keystore'
default['neo4j']['neo4j-server.properties']['org.neo4j.server.http.log.enabled'] = false
default['neo4j']['neo4j-server.properties']['org.neo4j.server.http.log.config'] = 'conf/neo4j-http-logging.xml'
default['neo4j']['neo4j-server.properties']['org.neo4j.server.webadmin.rrdb.location'] = 'data/rrd'
