
packages {
  development = ["bash@5.2.15", "coreutils-full@9.5", "cosign@~2.4.0", "grype@~0.80.2", "python3@~3.12.5", "poetry@~1.8.3"]
  runtime     = ["cacert@3.95"]
}

poetryapp {
  projectDir   = "./."
  src          = "./."
  pyproject    = "./pyproject.toml"
  poetrylock   = "./poetry.lock"
  preferWheels = false
  checkGroups  = ["dev"]
}

oci "python-dev" {
  name          = "docker.io/holiodin01/python-base"
  layers        = ["packages.runtime + packages.dev"]
  isBase        = true
  cmd           = []
  entrypoint    = []
  envVars       = []
  exposedPorts  = []
  importConfigs = []
}
