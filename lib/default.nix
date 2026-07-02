{lib}:
let
lua = lib.generators.mkLuaInline;
in
{
  lua = lua;
  autostart = list: {
	  _args = [
		  "hyprland.start"
		  (lua ("function()\n " +
			  builtins.concatStringsSep " \n "
			  (map (cmd: "hl.exec_cmd(\"" + cmd + "\")") list) +
			  "\n end"
			))
	  ];
  };
}
// import ./animations.nix {inherit lib;}
// import ./env.nix
// import ./keybinds.nix {inherit lua;}
