# es-mappings
Project to manage Elasticsearch mapping files and scripts needed to easily re-create indices.

Create a mapping file. The name of mapping file should be the desired name of the elasticsearch index. 
Use `load_mapping.sh` PUT the mapping file in Elasticsearch.

`./load_mapping.sh earthquake.json`

Verify index creation
`http://localhost:9200/_cat/indices`
`http://localhost:9200/earthquake/_mapping?pretty=true`
