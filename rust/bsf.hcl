
packages {
  development = ["coreutils-full@9.5", "bash@5.2.15", "cargo@1.75.0", "rustc@~1.73.0", "grype@~0.80.2", "libiconv@~1.17", "clang-wrapper@~18.1.8"]
  runtime     = ["cacert@3.95", "patchelf@~0.18.0-unstable-2024-06-15"]
}

rustapp {
  workspaceSrc                  = "./."
  projectName                   = "rust-todo"
  release                       = true
  rustVersion                   = "1.75.0"
  rustToolchain                 = ""
  rustChannel                   = ""
  rustProfile                   = ""
  rootFeatures                  = null
  fetchCrateAlternativeRegistry = ""
  hostPlatformCPU               = ""
  hostPlatformFeatures          = null
  extraRustComponents           = null
  cargoUnstableFlags            = null
  rustcLinkFlags                = null
  rustcBuildFlags               = null
}

oci "rust-dev" {
  name          = "docker.io/holiodin01/rust-base-dev"
  layers        = ["packages.dev"]
  isBase        = true
  cmd           = []
  entrypoint    = []
  envVars       = []
  exposedPorts  = []
  importConfigs = []
}
oci "rust-runtime" {
  name          = "docker.io/holiodin01/rust-base-runtime"
  layers        = ["packages.runtime"]
  isBase        = true
  cmd           = []
  entrypoint    = []
  envVars       = []
  exposedPorts  = []
  importConfigs = []
}
