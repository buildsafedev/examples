
packages {
  development = ["coreutils-full@9.5", "bash@5.2.15", "cargo@1.75.0", "rustc@~1.73.0", "libiconv@~1.17", "clang-wrapper@~18.1.8"]
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
  name          = "ttl.sh/rust-base:dev-7h"
  cmd           = []
  entrypoint    = []
  envVars       = []
  exposedPorts  = []
  importConfigs = []
}
