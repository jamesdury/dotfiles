    nixos-rebuild switch --flake ".#slurm"

    find . -type f -name "*.nix" | xargs nixfmt
