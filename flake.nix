{
  description = "Ruby Web Application";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; 
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        ruby = pkgs.ruby_3_4; 
        nodejs = pkgs.nodejs_22;
      in {
        devShells.default = pkgs.mkShell {
          name = "ruby-node-dev-shell";

          # Native dependencies for building gems and node modules
          buildInputs = with pkgs; [
            ruby
            pnpm
            git
          ];

          RUBYOPT = "-W0";

          shellHook = ''
            # Activate the Ruby environment (Bundler-installed gems)
            export PATH="$PWD/vendor/bundle/ruby/3.4.0/bin:$PATH"

            echo "🔧 Ruby + Node.js development shell"
            echo "Ruby version: $(ruby -v)"
            echo "Node version: $(node -v)"
            echo "PNPM version: $(pnpm -v)"
          '';
        };
      }
    );
}
