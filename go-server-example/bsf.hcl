
packages {
  development = ["bash@~5.2.15", "coreutils-full@~9.5", "delve@1.22.1", "go@~1.21.13", "gotools@0.18.0", "tzdata@2024a"]
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
