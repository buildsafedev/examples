
packages {
  development = ["go@1.22.3", "gotools@0.18.0", "delve@1.22.1", "coreutils-full@~9.5", "tzdata@2024a", "bash@~5.2.15", "grype@~0.80.2", "skopeo@~1.16.1"]
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
  name          = "docker.io/holiodin01/go-base-dev"
  layers        = ["packages.runtime + packages.dev"]
  isBase        = true
  cmd           = []
  entrypoint    = []
  envVars       = []
  exposedPorts  = []
  importConfigs = []
}
oci "go-runtime" {
  name          = "docker.io/holiodin01/go-base-runtime"
  layers        = ["packages.runtime"]
  isBase        = true
  cmd           = []
  entrypoint    = []
  envVars       = []
  exposedPorts  = []
  importConfigs = []
}
