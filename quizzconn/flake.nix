{
  inputs = { nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05"; };
  
  outputs = { self, nixpkgs}:
    let
      pkgs = import nixpkgs {
	      system = "x86_64-linux";
	      config.allowUnfree = true;
	    };
    in {
      devShell.${system} = pkgs.mkShell {
        buildInputs = with pkgs; [ python3Minimal ngrok poetry  docker docker-compose];
      };
    };
}
