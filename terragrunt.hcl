
locals {
    account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
    region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
    env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
    account_name = local.account_vars.locals.account_name
    account_id = local.account_vars.locals.aws_account_id
    aws_region = local.region_vars.locals.aws_region
}

generate "provider" {
    path = "provider.tf"
    if_exists = "overwrite_terragrunt"
    contents = <<EOF
provider "aws" {
    region = "${local.aws_region}"
    allowed_account_ids = ["${local.account_id}"]
}
EOF
}


inputs = merge(
    local.account_vars.locals,
    local.region_vars.locals,
    local.env_vars.locals,
)