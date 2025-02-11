resource "restful_resource" "api-spec" {
  provider      = restful.f5_xc_api
  create_method = "PUT"
  path          = format(var.f5xc_api_spec_base_uri, var.f5xc_namespace, local.f5xc_api_spec_name)
  read_path     = format(var.f5xc_api_spec_object_uri, var.f5xc_namespace, local.f5xc_api_spec_name)
  delete_path   = format(var.f5xc_api_spec_object_uri, var.f5xc_namespace, local.f5xc_api_spec_name)

  poll_create = {
    status_locator = "code"
    status = {
      success = "200"
    }
  }

  poll_delete = {
    status_locator = "code"
    status = {
      success = "404"
    }
  }

  header = {
    Content-Type = "application/yaml"
  }

  body = {
    name           = local.f5xc_api_spec_name
    namespace      = var.f5xc_namespace
    string_value   = file(format("%s/%s", "${path.root}", var.f5xc_swagger_filename))
    content_format = "yaml"
    object_type    = "swagger"
  }

  lifecycle {
    ignore_changes = [
      body
    ]
  }
}


resource "volterra_api_definition" "api-def" {
  name                 = format("%s-nocode-example", var.f5xc_prefix)
  namespace            = var.f5xc_namespace
  strict_schema_origin = true
  swagger_specs = [
      restful_resource.api-spec.output.metadata.url
    ]
}