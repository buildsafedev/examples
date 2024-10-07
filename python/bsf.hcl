
packages {
  development = ["coreutils-full@9.5", "python3@3.12.2", "poetry@1.8.2", "bash@5.2.15", "cosign@~2.4.0", "grype@~0.80.2"]
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
