terraform {
  required_providers {
    volterra = {
      source  = "volterraedge/volterra"
      version = "0.11.43"
    }
  }
}

provider "volterra" {
  url          = local.f5xc_api_url
  api_p12_file = var.f5xc_api_p12_file
}

resource "volterra_api_credential" "api-creds" {
  name                = local.f5xc_object_name
  api_credential_type = "API_TOKEN"
  created_at          = timestamp()
  lifecycle {
    ignore_changes = [
      created_at
    ]
  }
}