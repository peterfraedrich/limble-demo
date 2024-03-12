include "root" {
    path = find_in_parent_folders()
}

dependency "app" {
    config_path = "../wp-app"
    mock_outputs = {
        wp_app_alb_url = "somedomain.amazonaws.com"
        wp_app_alb_id = "mock"
    }
}

inputs = {
    wp_app_alb_url = dependency.app.outputs.wp_app_alb_url
    wp_app_alb_id = dependency.app.outputs.wp_app_alb_id
}