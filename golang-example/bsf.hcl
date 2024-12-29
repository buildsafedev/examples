
packages {
  development = ["coreutils-full@9.5", "bash@5.2.15", "go@1.22.3", "gotools@0.18.0", "delve@1.22.1", "grype@~0.81.0"]
  runtime     = ["cacert@3.95"]
}

oci "go-dev" {
  name          = "ttl.sh/buildsafedev/go-base-dev"
  layers        = ["split(packages.runtime)", "split(packages.dev)"]
  isBase        = true
  cmd           = []
  entrypoint    = []
  envVars       = []
  exposedPorts  = []
  importConfigs = []
}
oci "go-runtime" {
  name          = "ttl.sh/buildsafedev/go-base-runtime"
  layers        = ["split(packages.runtime)"]
  isBase        = true
  cmd           = []
  entrypoint    = []
  envVars       = []
  exposedPorts  = []
  importConfigs = []
}
