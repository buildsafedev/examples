
packages {
  development = ["go@1.22.3", "gotools@0.18.0", "delve@1.22.1", "coreutils-full@~9.5", "tzdata@2024a", "bash@~5.2.15"]
  runtime     = ["cacert@3.95"]
}

gomodule {
  name    = "go-server-example"
  src     = "./."
  ldFlags = null
  tags    = null
  doCheck = false
}

oci "pkgs" {
  name          = "ttl.sh/holiodin01/multiarch-baseimage"
  cmd           = []
  entrypoint    = []
  envVars       = []
  exposedPorts  = []
  importConfigs = []
}
