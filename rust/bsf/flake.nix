
{
	description = "";
	
	inputs = {
		 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7.url = "github:nixos/nixpkgs/1ebb7d7bba2953a4223956cfb5f068b0095f84a7";
		 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14.url = "github:nixos/nixpkgs/ac5c1886fd9fe49748d7ab80accc4c847481df14";
		 nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746.url = "github:nixos/nixpkgs/a731d0cb71c58f56895f71a5b02eda2962a46746";
		 nixpkgs-d919897915f0f91216d2501b617d670deee993a0.url = "github:nixos/nixpkgs/d919897915f0f91216d2501b617d670deee993a0";
		 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4.url = "github:nixos/nixpkgs/7445ccd775d8b892fc56448d17345443a05f7fb4";
			
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		
		
		
		
		
		
		

		 
		 nix2container.url = "github:nlewo/nix2container";
	};
	
	outputs = inputs@{ self, nixpkgs, 
	
	
	
	
	 nix2container , 
	 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7, 
	 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14, 
	 nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746, 
	 nixpkgs-d919897915f0f91216d2501b617d670deee993a0, 
	 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4, 
	 }: let
	  supportedSystems = [ "x86_64-linux" "aarch64-darwin" "x86_64-darwin" "aarch64-linux" ];
	  
	  
	  forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
		inherit system;
		 nix2containerPkgs = nix2container.packages.${system}; 
		 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs = import nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7 { inherit system; };
		 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs = import nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14 { inherit system; };
		 nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746-pkgs = import nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746 { inherit system; };
		 nixpkgs-d919897915f0f91216d2501b617d670deee993a0-pkgs = import nixpkgs-d919897915f0f91216d2501b617d670deee993a0 { inherit system; };
		 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs = import nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4 { inherit system; };
		
		
		pkgs = import nixpkgs { inherit system;  };
		
		
	  });
	in {
	
	  devShells = forEachSupportedSystem ({ pkgs, 
		
		
		
		 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs, 
		 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs, 
		 nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746-pkgs, 
		 nixpkgs-d919897915f0f91216d2501b617d670deee993a0-pkgs, 
		 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs, 
		 ... }: {
		devShell = pkgs.mkShell {
		  # The Nix packages provided in the environment
		  packages =  [
			nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs.bash  
			nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746-pkgs.cargo  
			nixpkgs-d919897915f0f91216d2501b617d670deee993a0-pkgs.clang_18  
			nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs.coreutils-full  
			nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746-pkgs.libiconv  
			nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs.rustc  
			
		  ];
		};
	  });
	
	  runtimeEnvs = forEachSupportedSystem ({ pkgs,
		
		
		
		 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs,  nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs,  nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746-pkgs,  nixpkgs-d919897915f0f91216d2501b617d670deee993a0-pkgs,  nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs,  ... }: {
		runtime = pkgs.buildEnv {
		  name = "runtimeenv";
		  paths = [ 
			nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs.cacert   
			nixpkgs-d919897915f0f91216d2501b617d670deee993a0-pkgs.patchelfUnstable   
			
		   ];
		};
	   });

	   devEnvs = forEachSupportedSystem ({ pkgs,
		
		
		
	    nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs,  nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs,  nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746-pkgs,  nixpkgs-d919897915f0f91216d2501b617d670deee993a0-pkgs,  nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs,  ... }: {
		development = pkgs.buildEnv {
		  name = "devenv";
		  paths = [ 
			nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs.bash  
			nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746-pkgs.cargo  
			nixpkgs-d919897915f0f91216d2501b617d670deee993a0-pkgs.clang_18  
			nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs.coreutils-full  
			nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746-pkgs.libiconv  
			nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs.rustc  
			
		   ];
		};
	   });
       
	   
	   
	   

ociImage_rust-dev = forEachSupportedSystem ({ pkgs, nix2containerPkgs, system ,  nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs,  nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs,  nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746-pkgs,  nixpkgs-d919897915f0f91216d2501b617d670deee993a0-pkgs,  nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs,  ... }: {
  

  
  ociImage_rust-dev_base = nix2containerPkgs.nix2container.buildImage {
    name = "docker.io/holiodin01/rust-base-dev";
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
				nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs.cacert
			];
		})  (nix2containerPkgs.nix2container.buildLayer { 
			copyToRoot = [
				nixpkgs-d919897915f0f91216d2501b617d670deee993a0-pkgs.patchelfUnstable
			];
		})  (nix2containerPkgs.nix2container.buildLayer { 
			copyToRoot = [
				nixpkgs-d919897915f0f91216d2501b617d670deee993a0-pkgs.clang_18
			];
		})  (nix2containerPkgs.nix2container.buildLayer { 
			copyToRoot = [
				nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs.coreutils-full
			];
		})  (nix2containerPkgs.nix2container.buildLayer { 
			copyToRoot = [
				nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746-pkgs.libiconv
			];
		})  (nix2containerPkgs.nix2container.buildLayer { 
			copyToRoot = [
				nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs.rustc
			];
		})  (nix2containerPkgs.nix2container.buildLayer { 
			copyToRoot = [
				nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs.bash
			];
		})  (nix2containerPkgs.nix2container.buildLayer { 
			copyToRoot = [
				nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746-pkgs.cargo
			];
		}) 
      
    ];
  };
  

  
  
  ociImage_rust-dev_base-as-dir = pkgs.runCommand "image-as-dir" { } "${inputs.self.ociImage_rust-dev.${system}.ociImage_rust-dev_base.copyTo}/bin/copy-to dir:$out";
  
  });

ociImage_rust-runtime = forEachSupportedSystem ({ pkgs, nix2containerPkgs, system ,  nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs,  nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs,  nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746-pkgs,  nixpkgs-d919897915f0f91216d2501b617d670deee993a0-pkgs,  nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs,  ... }: {
  

  
  ociImage_rust-runtime_base = nix2containerPkgs.nix2container.buildImage {
    name = "docker.io/holiodin01/rust-base-runtime";
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
				nixpkgs-d919897915f0f91216d2501b617d670deee993a0-pkgs.patchelfUnstable
			];
		})  (nix2containerPkgs.nix2container.buildLayer { 
			copyToRoot = [
				nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs.cacert
			];
		})  (nix2containerPkgs.nix2container.buildLayer { 
			copyToRoot = [
				nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs.bash
			];
		})  (nix2containerPkgs.nix2container.buildLayer { 
			copyToRoot = [
				nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746-pkgs.cargo
			];
		})  (nix2containerPkgs.nix2container.buildLayer { 
			copyToRoot = [
				nixpkgs-d919897915f0f91216d2501b617d670deee993a0-pkgs.clang_18
			];
		})  (nix2containerPkgs.nix2container.buildLayer { 
			copyToRoot = [
				nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs.coreutils-full
			];
		})  (nix2containerPkgs.nix2container.buildLayer { 
			copyToRoot = [
				nixpkgs-a731d0cb71c58f56895f71a5b02eda2962a46746-pkgs.libiconv
			];
		})  (nix2containerPkgs.nix2container.buildLayer { 
			copyToRoot = [
				nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs.rustc
			];
		}) 
      
    ];
  };
  

  
  
  ociImage_rust-runtime_base-as-dir = pkgs.runCommand "image-as-dir" { } "${inputs.self.ociImage_rust-runtime.${system}.ociImage_rust-runtime_base.copyTo}/bin/copy-to dir:$out";
  
  });



	   
	};
}
