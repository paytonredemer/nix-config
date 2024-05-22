{ inputs, pkgs, ... }: {
  nixpkgs.overlays = [ inputs.emacs-overlay.overlays.default ];

  environment.systemPackages = with pkgs; [
    # required dependencies
    git
    emacsGcc # Installs Emacs 28 + native-comp
    # emacs    # Emacs 27.2
    ripgrep
    # optional dependencies
    coreutils # basic GNU utilities
    fd
    clang
  ];
  # TODO: Add system.userActivationScripts to install doom emacs?
}
