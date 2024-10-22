
packages {
  development = ["bash@~5.2.15", "coreutils-full@~9.5", "delve@1.22.1", "gotools@0.18.0", "grype@~0.80.2", "skopeo@~1.16.1", "tzdata@2024a", "go@~1.23.1"]
  runtime     = ["cacert@3.95"]
}

gomodule {
  name    = "go-server-example"
  src     = "./."
  ldFlags = null
  tags    = null
  doCheck = false
}

oci "go-dev" {
  name          = "ghcr.io/buildsafedev/go-base-dev"
  layers        = ["packages.dev"]
  isBase        = true
  cmd           = []
  entrypoint    = []
  envVars       = []
  exposedPorts  = []
  importConfigs = []
}
oci "go-runtime" {
  name          = "ghcr.io/buildsafedev/go-base-runtime"
  layers        = ["packages.runtime"]
  isBase        = true
  cmd           = []
  entrypoint    = []
  envVars       = []
  exposedPorts  = []
  importConfigs = []
}
