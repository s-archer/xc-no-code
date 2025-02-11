terraform {
  required_providers {
    volterra = {
      source  = "volterraedge/volterra"
      version = "0.11.40"
    }
  }
}

provider "volterra" {
  url          = local.f5xc_api_url
  api_p12_file = var.f5xc_api_p12_file
}