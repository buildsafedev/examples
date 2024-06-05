
{
	description = "";
	
	inputs = {
		 nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746.url = "github:nixos/nixpkgs/a731d0cb71c58f56895f71a5b02eda2962a46746";
		 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14.url = "github:nixos/nixpkgs/ac5c1886fd9fe49748d7ab80accc4c847481df14";
			
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		
		
		
		
		
		 cargo2nix.url = "github:cargo2nix/cargo2nix/release-0.11.0";
    	 nixpkgs.follows = "cargo2nix/nixpkgs";
		
		

		 
	};
	
	outputs = inputs@{ self, nixpkgs, 
	
	
	 cargo2nix, 
	
	
	 nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746, 
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
		
		 nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746-pkgs = import nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746 { inherit system; };
		 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs = import nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14 { inherit system; };
		
		
		pkgs = import nixpkgs { inherit system;  overlays = [cargo2nix.overlays.default];  };
		
		
	  });
	in {
	  packages = forEachSupportedSystem ({ pkgs,
		
		
		
		 nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746-pkgs, 
		 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs, 
		 ... }: {
		default = pkgs.callPackage ./default.nix {
			
			
			
			 inherit pkgs;
             inherit rustPkgs;
			
			
		};
	  });
	
	  devShells = forEachSupportedSystem ({ pkgs, 
		
		
		 rustPkgs, 
		
		 nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746-pkgs, 
		 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs, 
		 ... }: {
		devShell = pkgs.mkShell {
		  # The Nix packages provided in the environment
		  packages =  [
			nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746-pkgs.cargo  
			
		  ];
		};
	  });
	
	  runtimeEnvs = forEachSupportedSystem ({ pkgs,
		
		
		
		 rustPkgs, 
		 nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746-pkgs,  nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs,  ... }: {
		runtime = pkgs.buildEnv {
		  name = "runtimeenv";
		  paths = [ 
			nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs.cacert   
			
		   ];
		};
	   });

	   devEnvs = forEachSupportedSystem ({ pkgs,
		
		
		 rustPkgs, 
		
	    nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746-pkgs,  nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs,  ... }: {
		development = pkgs.buildEnv {
		  name = "devenv";
		  paths = [ 
			nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746-pkgs.cargo  
			
		   ];
		};
	   });
       
	   
	   
	};
}
