
packages {
  development = ["bash@5.2.15", "coreutils-full@9.5", "python3.12-pip@~24.0", "python3@3.12.2"]
  runtime     = ["cacert@3.95"]
}

oci "python-dev" {
  name          = "docker.io/holiodin01/python-pip-base"
  layers        = ["packages.runtime + packages.dev"]
  isBase        = true
  cmd           = []
  entrypoint    = []
  envVars       = []
  exposedPorts  = []
  importConfigs = []
}
