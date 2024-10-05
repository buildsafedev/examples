
packages {
  development = ["coreutils-full@9.5", "python3@3.12.2", "bash@5.2.15", "python3.12-pip@~24.0", "cosign@~2.4.0"]
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
