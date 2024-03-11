include "root" {
    path = find_in_parent_folders()
}

dependency "rds" {
    config_path = "../wp-db"
    mock_outputs = {
        rds_username = "wordpress"
        rds_password_arn = "test"
        vpc_id_internal = "abcd1234"
    }
}

dependency "net" {
    config_path = "../wp-net"
    mock_outputs = {
        vpc_id_internal = "abcd1234"
        db_subnet_group_subnets = ["a", "b"]
    }
}

inputs = {
    wp_image = "wordpress:6.4.3-apache"
    rds_username = dependency.rds.outputs.rds_username
    rds_password_arn = dependency.rds.outputs.rds_password_arn
    vpc_id_internal = dependency.net.outputs.vpc_id_internal
    vpc_app_secgroups = dependency.net.outputs.vpc_app_secgroups
    vpc_external_secgroups = dependency.net.outputs.vpc_external_secgroups
    db_subnet_group_subnets = dependency.net.outputs.db_subnet_group_subnets
    external_subnets = dependency.net.outputs.external_subnets
    internal_subnets = dependency.net.outputs.internal_subnets
}