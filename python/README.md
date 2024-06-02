This is an xample python repo

## Install nix
```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

```

```
To get started using Nix, open a new shell or run `. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh`
```
You can experiment if the installation was successful by runing `nix run "nixpkgs#hello"`
## Install bsf cli 
nix profile install {{URL}}

## Install poetry 
nix profile install "nixpkgs#poetry"

## Poety init and then add dependencies intercativly
poetry init
After adding these interactively you will get pyproject.toml file like below, or you can directly use this file and add dependencies with specific versions required by your python application. 

```
[tool.poetry]
name = "exampleypy"
version = "0.1.0"
description = "python demo app"
authors = ["Saiyam Pathak <saiyam911@gmail.com>"]
readme = "README.md"

[tool.poetry.dependencies]
python = "^3.11"
Flask = "^3.0.3"
psycopg2-binary = "^2.9.9"
gunicorn = "^22.0.0"


[build-system]
requires = ["poetry-core"]
build-backend = "poetry.core.masonry.api"
[tool.poetry.scripts]
app = "app.app:main"

```

Feel free to use `poetry add $(cat requirements.txt)` to add the whol requirements.txt file later.

## Generate the lock file
Generate lock file using `poetry lock'

## Initialize the projct
Now is the time to run `bsf init` which will generate the `bsf.hcl` and `bsf.locl` files. It also generates a bsf folder with all nix files requred to build the project. 

## Add files before building 
`git add . ` <- Required by nix sandboxing.

## Build the porject
`bsf build`

## Run the project 
It automatically creates an artifact that you can run using `./bsf-result/result/bin/app`




