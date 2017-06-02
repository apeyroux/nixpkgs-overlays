self: super:

# [alex@xps15:/tmp/laby]$ nix-build -E '{ pkgs ? import <nixpkgs> {} }: pkgs.python36.withPackages(ps: with ps; [ pip pylint ])'

let
  python = self.python36.withPackages (ps: with ps; [ pylint
                                                      flake8
						                                          pip
						                                          pep8
						                                          ipython ]);
  haskell = self.haskellPackages.ghcWithPackages (pkgs: with pkgs; [ stack  intero QuickCheck stack-run ghc-mod hlint ]); 
in
{
  vscode = super.vscode.overrideDerivation (olds: {
    postFixup = olds.postFixup + ''
        wrapProgram $out/bin/code --prefix PATH : ${self.lib.makeBinPath [ python haskell self.git self.gnumake self.php ]}
    '';
  });
}