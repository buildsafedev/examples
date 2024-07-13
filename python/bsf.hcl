
packages {
  development = ["coreutils-full@9.5", "python3@3.12.2", "poetry@1.8.2", "bash@5.2.15"]
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

oci "pkgs" {
  name          = "ttl.sh/python-base:2h"
  cmd           = []
  entrypoint    = []
  envVars       = []
  exposedPorts  = []
  importConfigs = []
}
