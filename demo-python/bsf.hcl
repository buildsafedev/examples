
packages {
  development = ["python3@3.12.2", "poetry@1.8.2"]
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
