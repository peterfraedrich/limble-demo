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

inputs = {
    wp_image = "wordpress:6.4.3-apache"
    rds_username = dependency.rds.outputs.rds_username
    rds_password_arn = dependency.rds.outputs.rds_password_arn
    vpc_id_internal = dependency.rds.outputs.vpc_id_internal
}