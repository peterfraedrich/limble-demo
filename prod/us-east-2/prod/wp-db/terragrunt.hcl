include "root" {
    path = find_in_parent_folders()
}

dependency "net" {
    config_path = "../wp-net"
    mock_outputs = {
        internal_vpc = "abcd1234"
        db_subnet_group_subnets = ["a", "b"]
    }


}

inputs = {
    rds_username = "wordpress"
    rds_instance_class = "db.t4g.small"
    vpc_id_internal = dependency.net.outputs.internal_vpc
    db_subnets = dependency.net.outputs.db_subnet_group_subnets
}

