
packages {
  development = ["coreutils-full@9.5", "python3@3.12.2", "bash@5.2.15", "python3.12-pip@~24.0", "python3.10-pyinstaller-versionfile@~2.1.1"]
  runtime     = ["cacert@3.95"]
}

oci "python-pip-dev" {
  name          = "docker.io/holiodin01/python-pip"
  layers        = ["packages.runtime + packages.dev"]
  isBase        = true
  cmd           = []
  entrypoint    = []
  envVars       = []
  exposedPorts  = []
  importConfigs = []
}
