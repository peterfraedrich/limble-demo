include "root" {
    path = find_in_parent_folders()
}

#dependencies {
    #paths = [
    #    "../wp-db"
    #]
#}

inputs = {
    wp_image = "wordpress:6.4.3-apache"
}