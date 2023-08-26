with import <nixpkgs> {};

mkShell {
  buildInputs = [
    python311Packages.ansible-core
  ];
  shellHook = ''
    export LC_ALL="C.UTF-8";
  '';
}
