{ pkgs ? import <nixpkgs> {} }:

let
  easy-ps = import (pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "easy-purescript-nix";
    rev = "ccc9b9abff991fd474a452976fe7d50063f1855b";
    sha256 = "0mmjvqpkns964sjkbw0waqb47vfhg9r0fp9y0b5pizpikmw3fbp2";
  }) {
    inherit pkgs;
  };
in with easy-ps;
  pkgs.stdenv.mkDerivation {
    name = "easy-purescript";
    buildInputs = [
      purs
      spago
      pkgs.jq
      pkgs.nodejs
    ];
    shellHook = ''
      export PATH="$PWD/node_modules/.bin/:$PATH"
    '';
  }
