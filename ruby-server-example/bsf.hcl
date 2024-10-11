
packages {
  development = ["coreutils-full@9.5", "bash@5.2.15", "ruby@~3.3.4", "bundler@~2.5.16"]
  runtime     = ["cacert@3.95"]
}

oci "pkgs" {
  name          = "ttl.sh/ruby-server"
  layers        = ["split(packages.runtime)", "split(packages.dev)"]
  isBase        = true
  cmd           = []
  entrypoint    = []
  envVars       = []
  exposedPorts  = []
  importConfigs = []
}
