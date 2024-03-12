include "root" {
    path = find_in_parent_folders()
}

dependency "net" {
    config_path = "../wp-net"
    mock_outputs = {
        vpc_id_internal = "mock"
        db_subnet_group_subnets = ["mock"]
        vpc_app_secgroups = ["mock"]
        vpc_external_secgroups = ["mock"]
    }
}

inputs = {
    rds_username = "wordpress"
    rds_instance_class = "db.t4g.small"
    vpc_id_internal = dependency.net.outputs.vpc_id_internal
    db_subnets = dependency.net.outputs.db_subnet_group_subnets
    vpc_app_secgroups = dependency.net.outputs.vpc_app_secgroups
    vpc_external_secgroups = dependency.net.outputs.vpc_external_secgroups
}

