# Provide GOOGLE_CREDENTIALS environment variable to enable storing state to GCS
remote_state {
  backend = "gcs" 
  config = {
    bucket      = "imple-prov-gke"
    prefix      = "gke/${path_relative_to_include()}"
    location    = "asia-southeast2"
    project     = "project-prov"
    credentials = get_env("GOOGLE_CREDENTIALS")
  }
}
