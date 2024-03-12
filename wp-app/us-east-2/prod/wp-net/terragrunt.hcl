include "root" {
    path = find_in_parent_folders()
}

inputs = {
    vpc_cidr= "10.0.0.0/16"
    subnet-db-a-cidr= "10.0.1.0/26"
    subnet-db-b-cidr= "10.0.1.64/26"
    subnet-app-a-cidr= "10.0.2.0/26"
    subnet-app-b-cidr= "10.0.2.64/26"
    subnet-external-a-cidr= "10.0.10.0/26"
    subnet-external-b-cidr= "10.0.10.64/26"
}