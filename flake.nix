{
  description = "Fixing hash mismatch demo";

  inputs.nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1";

  outputs = inputs:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f: inputs.nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import inputs.nixpkgs { inherit system; };
      });
    in
    {
      packages = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.buildGoModule {
          name = "hash-mismatch-demo";
          src = builtins.path { path = ./.; name = "hash-mismatch-demo-source"; };
          vendorHash = "sha256-7c9WFEFaftTkPUmKa/SSCy/7djKbmcxM3Jt8RZv5un0=";
        };
      });
    };
}
