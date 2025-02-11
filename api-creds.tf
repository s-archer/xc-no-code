resource "volterra_api_credential" "api-creds" {
  name                         = format("%s-nocode-example", var.f5xc_prefix)
  api_credential_type          = "API_TOKEN"
}