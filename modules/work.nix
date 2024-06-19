{ pkgs, ... }:

{
  # Add /bin/bash. Yes, it's not pure, but it is pragmatic to do so.
  system.activationScripts.binbash = ''
    mkdir -m 755 -p /bin
    ln -sfn ${pkgs.bash}/bin/bash /bin/bash
    '';

  environment.systemPackages = with pkgs; [
    (writeShellScriptBin "gb" ''
      # Launch Git Bash in current directory on Windows D drive
      powershell.exe -NoExit -Command "Set-Location 'D:$(pwd)'; C:\Program\` Files\Git\bin\bash.exe --login -i"
    '')
    (writeShellScriptBin "ps" ''
      # Launch Powershell in current directory on Windows D drive
      powershell.exe -NoExit -Command "Set-Location 'D:$(pwd)'"
    '')
  ];

  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [
    alsa-lib
    at-spi2-atk
    at-spi2-core
    atk
    cairo
    cups
    curl
    dbus
    expat
    fontconfig
    freetype
    fuse3
    gdk-pixbuf
    glib
    gtk3
    icu
    libGL
    libappindicator-gtk3
    libdrm
    libglvnd
    libnotify
    libpulseaudio
    libunwind
    libusb1
    libuuid
    libxkbcommon
    libxml2
    mesa
    ncurses5
    ncurses6
    nspr
    nss
    openssl
    pango
    pipewire
    stdenv.cc.cc
    systemd
    vulkan-loader
    xorg.libX11
    xorg.libXScrnSaver
    xorg.libXcomposite
    xorg.libXcursor
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXi
    xorg.libXrandr
    xorg.libXrender
    xorg.libXtst
    xorg.libxcb
    xorg.libxkbfile
    xorg.libxshmfence
    zlib
  ];
}
