terraform {
  required_providers {
    volterra = {
      source  = "volterraedge/volterra"
      version = "0.11.40"
    }
    restful = {
      source  = "magodo/restful"
      version = "0.18.0"
    }
  }
}

provider "volterra" {
  url          = var.f5xc_api_url
  api_p12_file = var.f5xc_api_p12_file
}

provider "restful" {
  alias = "f5_xc_api"
  base_url = var.f5xc_api_url
  security = {
    apikey = [
      {
        in    = "header"
        name  = "Authorization"
        value = format("APIToken %s", var.f5xc_api_token)
      },
    ]
  }  
}