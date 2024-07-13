
packages {
  development = ["coreutils-full@9.5", "bash@5.2.15", "cargo@1.75.0", "gcc@~13.3.0"]
  runtime     = ["cacert@3.95"]
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

oci "pkgs" {
  name          = "ttl.sh/rust-base:dev-3h"
  cmd           = []
  entrypoint    = []
  envVars       = []
  exposedPorts  = []
  importConfigs = []
}
