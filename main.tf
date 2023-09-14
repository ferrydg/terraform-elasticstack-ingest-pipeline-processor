terraform {
  required_providers {
    elasticstack = {
      source  = "elastic/elasticstack"
      version = "0.6.2"
    }
  }
}

data "elasticstack_elasticsearch_ingest_processor_date" "date" {
  count        = var.processor.type == "date" ? 1 : 0
  field        = var.processor.field
  target_field = try(var.processor.target_field, null)
  formats      = try(var.processor.formats, [])
  timezone     = try(var.processor.timezone, null)
}

data "elasticstack_elasticsearch_ingest_processor_geoip" "geoip" {
  count          = var.processor.type == "geoip" ? 1 : 0
  field          = var.processor.field
  target_field   = try(var.processor.target_field, null)
  ignore_missing = try(var.processor.ignore_missing, null)
  first_only     = try(var.processor.first_only, null)
}

data "elasticstack_elasticsearch_ingest_processor_grok" "grok" {
  count       = var.processor.type == "grok" ? 1 : 0
  description = try(var.processor.description, null)
  field       = var.processor.field
  patterns    = try(var.processor.patterns, [])
}

data "elasticstack_elasticsearch_ingest_processor_json" "json" {
  count        = var.processor.type == "json" ? 1 : 0
  description  = try(var.processor.description, null)
  field        = var.processor.field
  target_field = try(var.processor.target_field, var.processor.field)
}

data "elasticstack_elasticsearch_ingest_processor_pipeline" "pipeline" {
  count = var.processor.type == "pipeline" ? 1 : 0
  name  = var.processor.pipeline
  if    = try(var.processor.if, null)
}

data "elasticstack_elasticsearch_ingest_processor_rename" "rename" {
  count          = var.processor.type == "rename" ? 1 : 0
  description    = try(var.processor.description, null)
  field          = var.processor.field
  target_field   = var.processor.target_field
  ignore_missing = try(var.processor.ignore_missing, null)
}

data "elasticstack_elasticsearch_ingest_processor_script" "script" {
  count       = var.processor.type == "script" ? 1 : 0
  description = "Extract 'tags' from 'env' field"
  lang        = "painless"

  source = try(var.processor.source, null)

  params = jsonencode(try(var.processor.params, {}))
  if     = try(var.processor.if, null)

}

data "elasticstack_elasticsearch_ingest_processor_set" "set" {
  count       = var.processor.type == "set" ? 1 : 0
  description = try(var.processor.description, null)
  field       = var.processor.field
  value       = try(var.processor.value, "")
  override    = try(var.processor.override, false)
}