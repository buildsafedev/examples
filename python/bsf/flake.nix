
{
	description = "";
	
	inputs = {
		 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14.url = "github:nixos/nixpkgs/ac5c1886fd9fe49748d7ab80accc4c847481df14";
		 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4.url = "github:nixos/nixpkgs/7445ccd775d8b892fc56448d17345443a05f7fb4";
		 nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308.url = "github:nixos/nixpkgs/d7570b04936e9b0f5268e0d834dee40368ad3308";
		 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7.url = "github:nixos/nixpkgs/1ebb7d7bba2953a4223956cfb5f068b0095f84a7";
			
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		
		
		 poetry2nix = {
			url = "github:nix-community/poetry2nix";
			inputs.nixpkgs.follows = "nixpkgs";
		  }; 
		
		
		
		

		 
		 nix2container.url = "github:nlewo/nix2container";
	};
	
	outputs = inputs@{ self, nixpkgs, 
	
	 poetry2nix, 
	
	
	 nix2container , 
	 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14, 
	 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4, 
	 nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308, 
	 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7, 
	 }: let
	  supportedSystems = [ "x86_64-linux" "aarch64-darwin" "x86_64-darwin" "aarch64-linux" ];
	  
	  
	  forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
		inherit system;
		 nix2containerPkgs = nix2container.packages.${system}; 
		 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs = import nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14 { inherit system; };
		 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs = import nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4 { inherit system; };
		 nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs = import nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308 { inherit system; };
		 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs = import nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7 { inherit system; };
		
		
		pkgs = import nixpkgs { inherit system;  };
		 inherit (poetry2nix.lib.mkPoetry2Nix { pkgs = nixpkgs.legacyPackages.${system}; }) mkPoetryApplication; 
		
	  });
	in {
	
	packages = forEachSupportedSystem ({ pkgs,
		
		 mkPoetryApplication, 
		
		 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs, 
		 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs, 
		 nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs, 
		 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs, 
		 ... }: {
		default = pkgs.callPackage ./default.nix {
			
			 inherit mkPoetryApplication; 
			
			
		};
	  });
	
	  devShells = forEachSupportedSystem ({ pkgs, 
		
		 mkPoetryApplication, 
		
		 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs, 
		 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs, 
		 nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs, 
		 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs, 
		 ... }: {
		devShell = pkgs.mkShell {
		  # The Nix packages provided in the environment
		  packages =  [
			nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs.bash  
			nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs.coreutils-full  
			nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs.poetry  
			nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs.python312  
			
		  ];
		};
	  });
	
	  runtimeEnvs = forEachSupportedSystem ({ pkgs,
		
		 mkPoetryApplication, 
		
		 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs,  nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs,  nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs,  nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs,  ... }: {
		runtime = pkgs.buildEnv {
		  name = "runtimeenv";
		  paths = [ 
			nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs.cacert   
			
		   ];
		};
	   });

	   devEnvs = forEachSupportedSystem ({ pkgs,
		
		 mkPoetryApplication, 
		
	    nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs,  nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs,  nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs,  nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs,  ... }: {
		development = pkgs.buildEnv {
		  name = "devenv";
		  paths = [ 
			nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs.bash  
			nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs.coreutils-full  
			nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs.poetry  
			nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs.python312  
			
		   ];
		};
	   });
       
	   
	   
	   
	ociImages = forEachSupportedSystem ({ pkgs, nix2containerPkgs, system , ...}: {
		
		
		ociImage_python-dev_app = nix2containerPkgs.nix2container.buildImage {
			name = "docker.io/holiodin01/python-base";
			copyToRoot = [ inputs.self.packages.${system}.default ];
			config = {
				cmd = [  ];

				entrypoint = [  ];
				env = [
					
				];
				ExposedPorts = {
					
				};
			};
			maxLayers = 100;
			layers = [
				(nix2containerPkgs.nix2container.buildLayer { 
					copyToRoot = [
						inputs.self.runtimeEnvs.${system}.runtime
						
					];
				})
			];      
		};

		ociImage_python-dev_app_with_dev = nix2containerPkgs.nix2container.buildImage {
			name = "docker.io/holiodin01/python-base";
			copyToRoot = [ inputs.self.packages.${system}.default ];
			config = {
				cmd = [  ];

				entrypoint = [  ];
				env = [
					
				];
				ExposedPorts = {
					
				};
			};
			maxLayers = 100;
			layers = [
				(nix2containerPkgs.nix2container.buildLayer { 
					copyToRoot = [
						inputs.self.runtimeEnvs.${system}.runtime
						
						inputs.self.devEnvs.${system}.development
					];
				})
			];      
		};
		

		
		

		
		
		ociImage_python-dev_app-as-dir = pkgs.runCommand "image-as-dir" { } "${inputs.self.ociImages.${system}.ociImage_python-dev_app.copyTo}/bin/copy-to dir:$out";
		ociImage_python-dev_app_with_dev-as-dir = pkgs.runCommand "image-as-dir" { } "${inputs.self.ociImages.${system}.ociImage_python-dev_app_with_dev.copyTo}/bin/copy-to dir:$out";
		
		
		
	});

	   
	};
}
