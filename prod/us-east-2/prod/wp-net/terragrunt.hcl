include "root" {
    path = find_in_parent_folders()
}

inputs = {
    aws_region = local.aws_region
    octet_base = "10"
    subnet_mask = "26"

}