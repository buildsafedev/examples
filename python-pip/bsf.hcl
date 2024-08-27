
packages {
  development = ["coreutils-full@9.5", "python3@3.12.2", "bash@5.2.15", "python3.12-pip@~24.0"]
  runtime     = ["cacert@3.95"]
}

oci "pkgs" {
  name          = "docker.io/holiodin01/python-pip-base"
  cmd           = []
  entrypoint    = []
  envVars       = []
  exposedPorts  = []
  importConfigs = []
}
