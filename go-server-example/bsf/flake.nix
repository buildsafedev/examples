
{
	description = "";
	
	inputs = {
		 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7.url = "github:nixos/nixpkgs/1ebb7d7bba2953a4223956cfb5f068b0095f84a7";
		 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14.url = "github:nixos/nixpkgs/ac5c1886fd9fe49748d7ab80accc4c847481df14";
		 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4.url = "github:nixos/nixpkgs/7445ccd775d8b892fc56448d17345443a05f7fb4";
		 nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308.url = "github:nixos/nixpkgs/d7570b04936e9b0f5268e0d834dee40368ad3308";
		 nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191.url = "github:nixos/nixpkgs/2af19cfb6aa40768c4bbefd801a136270e099191";
			
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		 gomod2nix.url = "github:nix-community/gomod2nix";
		gomod2nix.inputs.nixpkgs.follows = "nixpkgs";
		
		
		
		
		
		

		 
		 nix2container.url = "github:nlewo/nix2container";
	};
	
	outputs = inputs@{ self, nixpkgs, 
	 gomod2nix, 
	
	
	
	 nix2container , 
	 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7, 
	 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14, 
	 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4, 
	 nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308, 
	 nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191, 
	 }: let
	  supportedSystems = [ "x86_64-linux" "aarch64-darwin" "x86_64-darwin" "aarch64-linux" ];
	  
	  
	  forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
		inherit system;
		 nix2containerPkgs = nix2container.packages.${system}; 
		 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs = import nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7 { inherit system; };
		 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs = import nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14 { inherit system; };
		 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs = import nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4 { inherit system; };
		 nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs = import nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308 { inherit system; };
		 nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs = import nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191 { inherit system; };
		
		 buildGoApplication = gomod2nix.legacyPackages.${system}.buildGoApplication;
		pkgs = import nixpkgs { inherit system;  };
		
		
	  });
	in {
	
	  devShells = forEachSupportedSystem ({ pkgs, 
		 buildGoApplication, 
		
		
		 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs, 
		 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs, 
		 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs, 
		 nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs, 
		 nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs, 
		 ... }: {
		devShell = pkgs.mkShell {
		  # The Nix packages provided in the environment
		  packages =  [
			nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs.bash  
			nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs.coreutils-full  
			nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs.delve  
			nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs.go_1_23  
			nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs.gotools  
			nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs.grype  
			nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs.skopeo  
			nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs.tzdata  
			
		  ];
		};
	  });
	
	  runtimeEnvs = forEachSupportedSystem ({ pkgs,
		 buildGoApplication, 
		
		
		 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs,  nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs,  nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs,  nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs,  nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs,  ... }: {
		runtime = pkgs.buildEnv {
		  name = "runtimeenv";
		  paths = [ 
			nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs.cacert   
			
		   ];
		};
	   });

	   devEnvs = forEachSupportedSystem ({ pkgs,
		 buildGoApplication, 
		
		
	    nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs,  nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs,  nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs,  nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs,  nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs,  ... }: {
		development = pkgs.buildEnv {
		  name = "devenv";
		  paths = [ 
			nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs.bash  
			nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs.coreutils-full  
			nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs.delve  
			nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs.go_1_23  
			nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs.gotools  
			nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs.grype  
			nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs.skopeo  
			nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs.tzdata  
			
		   ];
		};
	   });
       
	   
	   
	   

ociImage_go-dev = forEachSupportedSystem ({ pkgs, nix2containerPkgs, system ,  nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs,  nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs,  nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs,  nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs,  nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs,  ... }: {
  

  
  ociImage_go-dev_base = nix2containerPkgs.nix2container.buildImage {
    name = "docker.io/holiodin01/go-base-dev";
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
  

  
  
  ociImage_go-dev_base-as-dir = pkgs.runCommand "image-as-dir" { } "${inputs.self.ociImage_go-dev.${system}.ociImage_go-dev_base.copyTo}/bin/copy-to dir:$out";
  
  });

ociImage_go-runtime = forEachSupportedSystem ({ pkgs, nix2containerPkgs, system ,  nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs,  nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs,  nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs,  nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs,  nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs,  ... }: {
  

  
  ociImage_go-runtime_base = nix2containerPkgs.nix2container.buildImage {
    name = "docker.io/holiodin01/go-base-runtime";
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
  

  
  
  ociImage_go-runtime_base-as-dir = pkgs.runCommand "image-as-dir" { } "${inputs.self.ociImage_go-runtime.${system}.ociImage_go-runtime_base.copyTo}/bin/copy-to dir:$out";
  
  });



	   
	};
}
