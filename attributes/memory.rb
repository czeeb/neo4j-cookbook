
default['neo4j']['config']['neo4j-wrapper.conf']['wrapper.java.initmemory'] = 512

raise 'missing node memory attribute' if !node['memory'] && !node['memory'].key?('total')

# total memory in MB
total_memory = (node['memory']['total'].to_i / 1024).to_i

half_memory = total_memory / 2
half_memory += 1 unless half_memory.even?
default['neo4j']['config']['neo4j-wrapper.conf']['wrapper.java.maxmemory'] = if half_memory >= 32_768
                                                                               32_768
                                                                             end
