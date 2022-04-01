include "root" {
  path = find_in_parent_folders()
}

dependency "cluster" {
  config_path  = "../cluster"
}

dependency "platform" {
  config_path  = "../platform"
  skip_outputs = true
}
