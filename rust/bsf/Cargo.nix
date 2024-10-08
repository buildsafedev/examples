# This file was @generated by cargo2nix 0.11.0.
# It is not intended to be manually edited.

args@{
  release ? true,
  rootFeatures ? [
    "rust-todo/default"
  ],
  rustPackages,
  buildRustPackages,
  hostPlatform,
  hostPlatformCpu ? null,
  hostPlatformFeatures ? [],
  target ? null,
  codegenOpts ? null,
  profileOpts ? null,
  cargoUnstableFlags ? null,
  rustcLinkFlags ? null,
  rustcBuildFlags ? null,
  mkRustCrate,
  rustLib,
  lib,
  workspaceSrc,
  ignoreLockHash,
}:
let
  nixifiedLockHash = "06f7072e204d905e9b59e363169b622decaf66e66707f59c4f787ea575b726d3";
  workspaceSrc = if args.workspaceSrc == null then ./. else args.workspaceSrc;
  currentLockHash = builtins.hashFile "sha256" (workspaceSrc + /Cargo.lock);
  lockHashIgnored = if ignoreLockHash
                  then builtins.trace "Ignoring lock hash" ignoreLockHash
                  else ignoreLockHash;
in if !lockHashIgnored && (nixifiedLockHash != currentLockHash) then
  throw ("Cargo.nix ${nixifiedLockHash} is out of sync with Cargo.lock ${currentLockHash}")
else let
  inherit (rustLib) fetchCratesIo fetchCrateLocal fetchCrateGit fetchCrateAlternativeRegistry expandFeatures decideProfile genDrvsByProfile;
  profilesByName = {
  };
  rootFeatures' = expandFeatures rootFeatures;
  overridableMkRustCrate = f:
    let
      drvs = genDrvsByProfile profilesByName ({ profile, profileName }: mkRustCrate ({ inherit release profile hostPlatformCpu hostPlatformFeatures target profileOpts codegenOpts cargoUnstableFlags rustcLinkFlags rustcBuildFlags; } // (f profileName)));
    in { compileMode ? null, profileName ? decideProfile compileMode release }:
      let drv = drvs.${profileName}; in if compileMode == null then drv else drv.override { inherit compileMode; };
in
{
  cargo2nixVersion = "0.11.0";
  workspace = {
    rust-todo = rustPackages.unknown.rust-todo."0.1.0";
  };
  "registry+https://github.com/rust-lang/crates.io-index".itoa."1.0.11" = overridableMkRustCrate (profileName: rec {
    name = "itoa";
    version = "1.0.11";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "49f1f14873335454500d59611f1cf4a4b0f786f9ac11f4312a78e4cf2566695b"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.86" = overridableMkRustCrate (profileName: rec {
    name = "proc-macro2";
    version = "1.0.86";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"; };
    features = builtins.concatLists [
      [ "proc-macro" ]
    ];
    dependencies = {
      unicode_ident = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".unicode-ident."1.0.12" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".quote."1.0.36" = overridableMkRustCrate (profileName: rec {
    name = "quote";
    version = "1.0.36";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"; };
    features = builtins.concatLists [
      [ "proc-macro" ]
    ];
    dependencies = {
      proc_macro2 = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.86" { inherit profileName; }).out;
    };
  });
  
  "unknown".rust-todo."0.1.0" = overridableMkRustCrate (profileName: rec {
    name = "rust-todo";
    version = "0.1.0";
    registry = "unknown";
    src = fetchCrateLocal workspaceSrc;
    dependencies = {
      serde = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".serde."1.0.204" { inherit profileName; }).out;
      serde_json = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".serde_json."1.0.120" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".ryu."1.0.18" = overridableMkRustCrate (profileName: rec {
    name = "ryu";
    version = "1.0.18";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "f3cb5ba0dc43242ce17de99c180e96db90b235b8a9fdc9543c96d2209116bd9f"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".serde."1.0.204" = overridableMkRustCrate (profileName: rec {
    name = "serde";
    version = "1.0.204";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "bc76f558e0cbb2a839d37354c575f1dc3fdc6546b5be373ba43d95f231bf7c12"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "derive" ]
      [ "serde_derive" ]
      [ "std" ]
    ];
    dependencies = {
      serde_derive = (buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".serde_derive."1.0.204" { profileName = "__noProfile"; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".serde_derive."1.0.204" = overridableMkRustCrate (profileName: rec {
    name = "serde_derive";
    version = "1.0.204";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "e0cd7e117be63d3c3678776753929474f3b04a43a080c744d6b0ae2a8c28e222"; };
    features = builtins.concatLists [
      [ "default" ]
    ];
    dependencies = {
      proc_macro2 = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.86" { inherit profileName; }).out;
      quote = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".quote."1.0.36" { inherit profileName; }).out;
      syn = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".syn."2.0.71" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".serde_json."1.0.120" = overridableMkRustCrate (profileName: rec {
    name = "serde_json";
    version = "1.0.120";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "4e0d21c9a8cae1235ad58a00c11cb40d4b1e5c784f1ef2c537876ed6ffd8b7c5"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "std" ]
    ];
    dependencies = {
      itoa = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".itoa."1.0.11" { inherit profileName; }).out;
      ryu = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".ryu."1.0.18" { inherit profileName; }).out;
      serde = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".serde."1.0.204" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".syn."2.0.71" = overridableMkRustCrate (profileName: rec {
    name = "syn";
    version = "2.0.71";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "b146dcf730474b4bcd16c311627b31ede9ab149045db4d6088b3becaea046462"; };
    features = builtins.concatLists [
      [ "clone-impls" ]
      [ "derive" ]
      [ "parsing" ]
      [ "printing" ]
      [ "proc-macro" ]
    ];
    dependencies = {
      proc_macro2 = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.86" { inherit profileName; }).out;
      quote = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".quote."1.0.36" { inherit profileName; }).out;
      unicode_ident = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".unicode-ident."1.0.12" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".unicode-ident."1.0.12" = overridableMkRustCrate (profileName: rec {
    name = "unicode-ident";
    version = "1.0.12";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"; };
  });
  
}
