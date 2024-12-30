
packages {
  development = ["coreutils-full@9.5", "bash@5.2.15", "ruby@~3.1.2"]
  runtime     = ["cacert@3.95"]
}

oci "build" {
  name          = "ttl.sh/ruby-base"
  layers        = ["split(packages.runtime)", "split(packages.dev)"]
  isBase        = true
  cmd           = []
  entrypoint    = []
  envVars       = []
  exposedPorts  = []
  importConfigs = []
}

oci "runtime" {
  name          = "ttl.sh/ruby-base"
  layers        = ["split(packages.runtime)"]
  isBase        = true
  cmd           = []
  entrypoint    = []
  envVars       = []
  exposedPorts  = []
  importConfigs = []
}
