
{
	description = "";
	
	inputs = {
		 nixpkgs-47f1ce82e5d33c5d737c7fb2b3e83036f0f8963a.url = "github:nixos/nixpkgs/47f1ce82e5d33c5d737c7fb2b3e83036f0f8963a";
		 nixpkgs-cde85e73739930e3fd10216416ca1bcc57138a7a.url = "github:nixos/nixpkgs/cde85e73739930e3fd10216416ca1bcc57138a7a";
		 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7.url = "github:nixos/nixpkgs/1ebb7d7bba2953a4223956cfb5f068b0095f84a7";
		 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14.url = "github:nixos/nixpkgs/ac5c1886fd9fe49748d7ab80accc4c847481df14";
		 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4.url = "github:nixos/nixpkgs/7445ccd775d8b892fc56448d17345443a05f7fb4";
		 nixpkgs-d4f247e89f6e10120f911e2e2d2254a050d0f732.url = "github:nixos/nixpkgs/d4f247e89f6e10120f911e2e2d2254a050d0f732";
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
	 nixpkgs-47f1ce82e5d33c5d737c7fb2b3e83036f0f8963a, 
	 nixpkgs-cde85e73739930e3fd10216416ca1bcc57138a7a, 
	 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7, 
	 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14, 
	 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4, 
	 nixpkgs-d4f247e89f6e10120f911e2e2d2254a050d0f732, 
	 nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191, 
	 }: let
	  supportedSystems = [ "x86_64-linux" "aarch64-darwin" "x86_64-darwin" "aarch64-linux" ];
	  
	  
	  forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
		inherit system;
		 nix2containerPkgs = nix2container.packages.${system}; 
		 nixpkgs-47f1ce82e5d33c5d737c7fb2b3e83036f0f8963a-pkgs = import nixpkgs-47f1ce82e5d33c5d737c7fb2b3e83036f0f8963a { inherit system; };
		 nixpkgs-cde85e73739930e3fd10216416ca1bcc57138a7a-pkgs = import nixpkgs-cde85e73739930e3fd10216416ca1bcc57138a7a { inherit system; };
		 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs = import nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7 { inherit system; };
		 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs = import nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14 { inherit system; };
		 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs = import nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4 { inherit system; };
		 nixpkgs-d4f247e89f6e10120f911e2e2d2254a050d0f732-pkgs = import nixpkgs-d4f247e89f6e10120f911e2e2d2254a050d0f732 { inherit system; };
		 nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs = import nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191 { inherit system; };
		
		
		pkgs = import nixpkgs { inherit system;  };
		 inherit (poetry2nix.lib.mkPoetry2Nix { pkgs = nixpkgs.legacyPackages.${system}; }) mkPoetryApplication; 
		
	  });
	in {
	
	  devShells = forEachSupportedSystem ({ pkgs, 
		
		 mkPoetryApplication, 
		
		 nixpkgs-47f1ce82e5d33c5d737c7fb2b3e83036f0f8963a-pkgs, 
		 nixpkgs-cde85e73739930e3fd10216416ca1bcc57138a7a-pkgs, 
		 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs, 
		 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs, 
		 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs, 
		 nixpkgs-d4f247e89f6e10120f911e2e2d2254a050d0f732-pkgs, 
		 nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs, 
		 ... }: {
		devShell = pkgs.mkShell {
		  # The Nix packages provided in the environment
		  packages =  [
			nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs.bash  
			nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs.coreutils-full  
			nixpkgs-d4f247e89f6e10120f911e2e2d2254a050d0f732-pkgs.cosign  
			nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs.grype  
			nixpkgs-47f1ce82e5d33c5d737c7fb2b3e83036f0f8963a-pkgs.poetry  
			nixpkgs-cde85e73739930e3fd10216416ca1bcc57138a7a-pkgs.python3Full  
			
		  ];
		};
	  });
	
	  runtimeEnvs = forEachSupportedSystem ({ pkgs,
		
		 mkPoetryApplication, 
		
		 nixpkgs-47f1ce82e5d33c5d737c7fb2b3e83036f0f8963a-pkgs,  nixpkgs-cde85e73739930e3fd10216416ca1bcc57138a7a-pkgs,  nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs,  nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs,  nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs,  nixpkgs-d4f247e89f6e10120f911e2e2d2254a050d0f732-pkgs,  nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs,  ... }: {
		runtime = pkgs.buildEnv {
		  name = "runtimeenv";
		  paths = [ 
			nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs.cacert   
			
		   ];
		};
	   });

	   devEnvs = forEachSupportedSystem ({ pkgs,
		
		 mkPoetryApplication, 
		
	    nixpkgs-47f1ce82e5d33c5d737c7fb2b3e83036f0f8963a-pkgs,  nixpkgs-cde85e73739930e3fd10216416ca1bcc57138a7a-pkgs,  nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs,  nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs,  nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs,  nixpkgs-d4f247e89f6e10120f911e2e2d2254a050d0f732-pkgs,  nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs,  ... }: {
		development = pkgs.buildEnv {
		  name = "devenv";
		  paths = [ 
			nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs.bash  
			nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs.coreutils-full  
			nixpkgs-d4f247e89f6e10120f911e2e2d2254a050d0f732-pkgs.cosign  
			nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs.grype  
			nixpkgs-47f1ce82e5d33c5d737c7fb2b3e83036f0f8963a-pkgs.poetry  
			nixpkgs-cde85e73739930e3fd10216416ca1bcc57138a7a-pkgs.python3Full  
			
		   ];
		};
	   });
       
	   
	   
	   

ociImage_python-dev = forEachSupportedSystem ({ pkgs, nix2containerPkgs, system ,  nixpkgs-47f1ce82e5d33c5d737c7fb2b3e83036f0f8963a-pkgs,  nixpkgs-cde85e73739930e3fd10216416ca1bcc57138a7a-pkgs,  nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs,  nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs,  nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs,  nixpkgs-d4f247e89f6e10120f911e2e2d2254a050d0f732-pkgs,  nixpkgs-2af19cfb6aa40768c4bbefd801a136270e099191-pkgs,  ... }: {
  

  
  ociImage_python-dev_base = nix2containerPkgs.nix2container.buildImage {
    name = "ttl.sh/buildsafedev/python-base";
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
