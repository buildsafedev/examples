
packages {
  development = ["coreutils-full@9.5", "bash@5.2.15", "cargo@1.75.0", "rustc@~1.73.0", "libiconv@~1.17", "clang-wrapper@~18.1.8"]
  runtime     = ["cacert@3.95", "patchelf@~0.18.0-unstable-2024-06-15"]
}


oci "rust-dev" {
  name          = "docker.io/holiodin01/rust-base-dev"
  layers        = ["split(packages.runtime)", "split(packages.dev)"]
  isBase        = true
  cmd           = []
  entrypoint    = []
  envVars       = []
  exposedPorts  = []
  importConfigs = []
}

oci "rust-runtime" {
  name          = "docker.io/holiodin01/rust-base-runtime"
  layers        = ["split(packages.runtime)", "split(packages.dev)"]
  isBase        = true
  cmd           = []
  entrypoint    = []
  envVars       = []
  exposedPorts  = []
  importConfigs = []
}
