with import <nixpkgs> {};

mkShell {
  buildInputs = [
    (python311.withPackages(ps: with ps; [
      ansible-core
    ]))
    nixd
    nixpkgs-fmt
    pre-commit
  ];
  shellHook = ''
    export LC_ALL="C.UTF-8"
    ansible-galaxy collection install -r requirements.yml > /dev/null
    pre-commit
  '';
}
