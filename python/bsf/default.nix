
    { pkgs, mkPoetryApplication }:
     let app = mkPoetryApplication {
            projectDir = ../.;
            src = ../.;
            pyproject = ../pyproject.toml;
            poetryLock = ../poetry.lock;
            python = pkgs.python3;
            preferWheels = false;
			
			checkGroups = [
		      "dev" 
	       ];
		   
    };
	in app.dependencyEnv
    