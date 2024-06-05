This is an Example Go repo

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


## Initialize the projct
Now is the time to run `bsf init` which will generate the `bsf.hcl` and `bsf.locl` files. It also generates a bsf folder with all nix files requred to build the project. 

## Add files before building 
`git add . ` <- Required by nix sandboxing.

## Build the porject
`bsf build`

## Run the project 
It automatically creates an artifact that you can run using `./bsf-result/result/bin/go-server-example`





