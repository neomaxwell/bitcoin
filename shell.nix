{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  shellHook = ''
    export Boost_DIR=${pkgs.boost.dev}
  '';

  nativeBuildInputs = with pkgs; [
    pkg-config
  ];

  buildInputs = with pkgs; [
    boost.dev
    libevent
  ];
}

# cmake -B build -DENABLE_WALLET=OFF -DWITH_ZMQ=OFF -DENABLE_IPC=OFF -DBUILD_GUI=OFF
