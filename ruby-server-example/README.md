This is an Example Ruby repo

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

## Develop the porject
This will get you in the development shell of your application
`bsf develop`

## Interact with the project
You can checkout the ruby version
`ruby -v`
Try to install rails
`gem install rails`

## Create a base image with Ruby dependencies and using it the Dockerfile
```Dockerfile
# Ruby Alpine image (after using bsf dockerfile digest)
FROM ttl.sh/ruby-server AS build

# Install all required dependencies for Ruby gems
RUN apk add --no-cache build-base libxml2-dev libxslt-dev tzdata

WORKDIR /src

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock /src/

# Install the required gems
RUN bundle install

# Copy the rest of the application files to the container
COPY . /src

# Expose the application port
EXPOSE 9898

# Command to run the Ruby application
CMD ["ruby", "main.rb"]
```

Lets build this image
`docker build -t ttl.sh/ruby-server:dev`

Now Run the image
`docker run -d -p 9898:9898 ttl.sh/ruby-server:dev`

## Checkout your application
`curl localhost:9898/ping` here the response should be `Pong!`