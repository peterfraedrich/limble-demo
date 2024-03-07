include "root" {
    path = find_in_parent_folders()
}

inputs = {
    rds_instance_class = "db.t4g.small"
}

dependencies {
    paths = [
        "../wp-net"
    ]
}