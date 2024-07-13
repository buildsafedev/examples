
{
	description = "";
	
	inputs = {
		 nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746.url = "github:nixos/nixpkgs/a731d0cb71c58f56895f71a5b02eda2962a46746";
		 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4.url = "github:nixos/nixpkgs/7445ccd775d8b892fc56448d17345443a05f7fb4";
		 nixpkgs-d919897915f0f91216d2501b617d670deee993a0.url = "github:nixos/nixpkgs/d919897915f0f91216d2501b617d670deee993a0";
		 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7.url = "github:nixos/nixpkgs/1ebb7d7bba2953a4223956cfb5f068b0095f84a7";
		 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14.url = "github:nixos/nixpkgs/ac5c1886fd9fe49748d7ab80accc4c847481df14";
			
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		
		
		
		
		
		 cargo2nix.url = "github:cargo2nix/cargo2nix/release-0.11.0";
    	 nixpkgs.follows = "cargo2nix/nixpkgs";
		
		

		 
		 nix2container.url = "github:nlewo/nix2container";
	};
	
	outputs = inputs@{ self, nixpkgs, 
	
	
	 cargo2nix, 
	
	 nix2container , 
	 nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746, 
	 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4, 
	 nixpkgs-d919897915f0f91216d2501b617d670deee993a0, 
	 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7, 
	 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14, 
	 }: let
	  supportedSystems = [ "x86_64-linux" "aarch64-darwin" "x86_64-darwin" "aarch64-linux" ];
	  
	  rustPkgs = pkgs: pkgs.rustBuilder.makePackageSet {
		packageFun = import ./Cargo.nix;
		workspaceSrc = ../.;
		
		rustVersion = "1.75.0"; 
		
		
		
		
		
		
		
		
		
		
		
		
	  }; 
	  
	  forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
		inherit system;
		 nix2containerPkgs = nix2container.packages.${system}; 
		 nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746-pkgs = import nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746 { inherit system; };
		 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs = import nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4 { inherit system; };
		 nixpkgs-d919897915f0f91216d2501b617d670deee993a0-pkgs = import nixpkgs-d919897915f0f91216d2501b617d670deee993a0 { inherit system; };
		 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs = import nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7 { inherit system; };
		 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs = import nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14 { inherit system; };
		
		
		pkgs = import nixpkgs { inherit system;  overlays = [cargo2nix.overlays.default];  };
		
		
	  });
	in {
	
	  runtimeEnvs = forEachSupportedSystem ({ pkgs,
		
		
		
		 nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746-pkgs,  nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs,  nixpkgs-d919897915f0f91216d2501b617d670deee993a0-pkgs,  nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs,  nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs,  ... }: {
		runtime = pkgs.buildEnv {
		  name = "runtimeenv";
		  paths = [ 
			nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs.cacert   
			
		   ];
		};
	   });

	   devEnvs = forEachSupportedSystem ({ pkgs,
		
		
		
	    nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746-pkgs,  nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs,  nixpkgs-d919897915f0f91216d2501b617d670deee993a0-pkgs,  nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs,  nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs,  ... }: {
		development = pkgs.buildEnv {
		  name = "devenv";
		  paths = [ 
			nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs.bash  
			nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746-pkgs.cargo  
			nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs.coreutils-full  
			nixpkgs-d919897915f0f91216d2501b617d670deee993a0-pkgs.gcc-unwrapped  
			
		   ];
		};
	   });
       
	   
	   
	   
	ociImages = forEachSupportedSystem ({ pkgs, nix2containerPkgs, system , ...}: {
		
		

		
		ociImage_pkgs_runtime = nix2containerPkgs.nix2container.buildImage {
			name = "ttl.sh/rust-base:dev-3h";
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

		ociImage_pkgs_dev = nix2containerPkgs.nix2container.buildImage {
			name = "ttl.sh/rust-base:dev-3h";
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
		
		

		
		
		
		ociImage_pkgs_runtime-as-dir = pkgs.runCommand "image-as-dir" { } "${inputs.self.ociImages.${system}.ociImage_pkgs_runtime.copyTo}/bin/copy-to dir:$out";
		ociImage_pkgs_dev-as-dir = pkgs.runCommand "image-as-dir" { } "${inputs.self.ociImages.${system}.ociImage_pkgs_dev.copyTo}/bin/copy-to dir:$out";
		
		
	});

	   
	};
}
