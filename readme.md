# F5 XC No-Code Terraform Module Example

The Terraform configuration will create the following objects within the F5 XC Platform:

- HTTPS Load-Balancer, with WAF, API Discovery & Security
- Origin Pool
- Health Check
- WAF Policy
- API Token
- API Swagger Spec
- API Definition

## How to use this example (XC Administrator)

- In [Module lb-origin.tf](./modules/no-code/lb-origin.tf) update the configuration to meet your requirements.
- In [`vars.auto.tfvars.example`](./vars.auto.tfvars.example) update the guidance and provide a list of site names to choose from.
- Update this readme for use by your application teams
- Commit to your private git repo.


## How to use this example (Application Team)

- Fork the repo
- Rename `vars.auto.tfvars.example` to `vars.auto.tfvars` and then update the variables as necessary.
- For F5 XC API cert auth, obtain a new .p12 from the F5 XC console.  Store.  Reference the location in the `volt_api_p12_file` variable.  Then set the .p12 passphrase as ENV:

	`export VES_P12_PASSWORD=<cert passphrase>`

- Replace example swagger-juice.* files with your application swagger file (OpenAPI spec) and reference the file name in `f5xc_swagger_filename` var in [`vars.auto.tfvars`](./vars.auto.tfvars)
- Initialise, plan and apply terraform in the usual way.

## How to use this example (Application Team) to update swagger

- To update swagger, add the new swagger file and reference the new file name in `f5xc_swagger_filename` var in [`vars.auto.tfvars`](./vars.auto.tfvars)
- Initialise, plan and apply terraform in the usual way.