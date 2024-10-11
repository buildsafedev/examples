
{
	description = "";
	
	inputs = {
		 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7.url = "github:nixos/nixpkgs/1ebb7d7bba2953a4223956cfb5f068b0095f84a7";
		 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14.url = "github:nixos/nixpkgs/ac5c1886fd9fe49748d7ab80accc4c847481df14";
		 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4.url = "github:nixos/nixpkgs/7445ccd775d8b892fc56448d17345443a05f7fb4";
		 nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191.url = "github:nixos/nixpkgs/2af19cfb6aa40768c4bbefd801a136270e099191";
			
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
	 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7, 
	 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14, 
	 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4, 
	 nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191, 
	 }: let
	  supportedSystems = [ "x86_64-linux" "aarch64-darwin" "x86_64-darwin" "aarch64-linux" ];
	  
	  
	  forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
		inherit system;
		 nix2containerPkgs = nix2container.packages.${system}; 
		 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs = import nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7 { inherit system; };
		 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs = import nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14 { inherit system; };
		 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs = import nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4 { inherit system; };
		 nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs = import nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191 { inherit system; };
		
		
		pkgs = import nixpkgs { inherit system;  };
		 inherit (poetry2nix.lib.mkPoetry2Nix { pkgs = nixpkgs.legacyPackages.${system}; }) mkPoetryApplication; 
		
	  });
	in {
	
	  devShells = forEachSupportedSystem ({ pkgs, 
		
		 mkPoetryApplication, 
		
		 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs, 
		 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs, 
		 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs, 
		 nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs, 
		 ... }: {
		devShell = pkgs.mkShell {
		  # The Nix packages provided in the environment
		  packages =  [
			nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs.bash  
			nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs.coreutils-full  
			nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs.cosign  
			nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs.grype  
			nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs.poetry  
			nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs.python312Full  
			
		  ];
		};
	  });
	
	  runtimeEnvs = forEachSupportedSystem ({ pkgs,
		
		 mkPoetryApplication, 
		
		 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs,  nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs,  nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs,  nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs,  ... }: {
		runtime = pkgs.buildEnv {
		  name = "runtimeenv";
		  paths = [ 
			nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs.cacert   
			
		   ];
		};
	   });

	   devEnvs = forEachSupportedSystem ({ pkgs,
		
		 mkPoetryApplication, 
		
	    nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs,  nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs,  nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs,  nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs,  ... }: {
		development = pkgs.buildEnv {
		  name = "devenv";
		  paths = [ 
			nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs.bash  
			nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs.coreutils-full  
			nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs.cosign  
			nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs.grype  
			nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs.poetry  
			nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs.python312Full  
			
		   ];
		};
	   });
       
	   
	   
	   

ociImage_python-dev = forEachSupportedSystem ({ pkgs, nix2containerPkgs, system ,  nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs,  nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs,  nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs,  nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs,  ... }: {
  

  
  ociImage_python-dev_base = nix2containerPkgs.nix2container.buildImage {
    name = "docker.io/holiodin01/python-base";
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
  

  
  
  ociImage_python-dev_base-as-dir = pkgs.runCommand "image-as-dir" { } "${inputs.self.ociImage_python-dev.${system}.ociImage_python-dev_base.copyTo}/bin/copy-to dir:$out";
  
  });



	   
	};
}
