locals {
  f5xc_api_spec_name = format("%s-nocode-example", var.f5xc_prefix)
}

variable "f5xc_api_spec_base_uri" {
  type    = string
  default = "/object_store/namespaces/%s/stored_objects/swagger/%s"
}

variable "f5xc_api_spec_object_uri" {
  type    = string
  default = "/object_store/namespaces/%s/stored_objects/swagger/%s/$(body.metadata.version)"
}

variable "f5xc_api_url" {
  type = string
}

variable "f5xc_api_p12_file" {
  type = string
}

variable "f5xc_api_token" {
  type = string
}

variable "f5xc_prefix" {
  type = string
}

variable "f5xc_namespace" {
  type = string
}

variable "f5xc_tenant_full" {
  type = string
}

variable "f5xc_origin_port" {
  type = string
}

variable "f5xc_origin_ips" {
  type = list(string)
}

variable "f5xc_origin_discovery" {
  type = list(string)
}

variable "f5xc_origin_virtual_site" {
  type = string
}

variable "f5xc_origin_fqdns" {
  type = list(string)
}

variable "f5xc_origin-healthcheck-path" {
  type = string
}

variable "f5xc_lb_domains" {
  type = string
}

variable "f5xc_swagger_filename" {
  type = string
}