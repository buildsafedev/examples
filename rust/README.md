This is an example rust repo

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

## Build the porjeThis is an xample python repo

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
It automatically creates an artifact that you can run using `./bsf-result/result-bin/bin/rust-todo`

## Check SBOM 
Get the attestations first which can be SBOM or provenance.

```
bsf att ls bsf-result/attestations.intoto.jsonl
```
Now we get the SBOM, say spdx
```
bsf att cat bsf-result/attestations.intoto.jsonl --predicate-type spdx --predicate

```
This gives the SBOM that we can give to grype to scan  for vulnerabilities. 





ct
`bsf build`

## Run the project 
It automatically creates an artifact that you can run using `./bsf-result/result/bin/app`

## Check SBOM 
Get the attestations first which can be SBOM or provenance.

```
bsf att ls bsf-result/attestations.intoto.jsonl
```
Now we get the SBOM, say spdx
```
bsf att cat bsf-result/attestations.intoto.jsonl --predicate-type spdx --predicate

```
This gives the SBOM that we can give to grype to scan  for vulnerabilities. 





