output "json" {
  value = one(compact(concat(
    data.elasticstack_elasticsearch_ingest_processor_date.date[*].json,
    data.elasticstack_elasticsearch_ingest_processor_geoip.geoip[*].json,
    data.elasticstack_elasticsearch_ingest_processor_grok.grok[*].json,
    data.elasticstack_elasticsearch_ingest_processor_json.json[*].json,
    data.elasticstack_elasticsearch_ingest_processor_pipeline.pipeline[*].json,
    data.elasticstack_elasticsearch_ingest_processor_rename.rename[*].json,
    data.elasticstack_elasticsearch_ingest_processor_script.script[*].json,
    data.elasticstack_elasticsearch_ingest_processor_set.set[*].json
  )))
}