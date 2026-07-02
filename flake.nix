{
  description = "A library of utility functions for making Hyprland config in home manager more readable.";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05-small";
  outputs = {nixpkgs, ...}:
  {
    lib = import ./lib {lib = nixpkgs.lib;};
  };
}
