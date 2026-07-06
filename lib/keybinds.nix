{lua}:
rec {
bindVarParse = mod: key: (mod + " .. \" + " + key + "\"");

exec = cmd: (lua ("hl.dsp.exec_cmd(\"" + cmd + "\")"));

addFlags = bindList: flagSet: bindList ++ [ flagSet ];

bindMap = mod: key:
	if (mod == "mainMod") || (mod == "subMod") then
		lua (bindVarParse mod key)
	else
		mod;

simpleBind = mod: key: cmd: {
	_args = [
		(bindMap mod key)
		(exec cmd)
	];
};
pvarBind = mod: key: luaVar: {
	_args = [
		(bindMap mod key)
		(lua("hl.dsp.exec_cmd(\"app2unit -- \" .. " + luaVar + ")"))
	];
};
ipcBind = mod: key: cmd: {
	_args = [
		(bindMap mod key)
		(lua ("hl.dsp.exec_cmd(ipc .. \"" + cmd + "\")"))
	];
};
dspBind = mod: key: dsp: {
	_args = [
		(bindMap mod key)
		dsp
	];
};
fullBind = mod: key: dsp: rule:
{
	_args = [
		(bindMap mod key)
		dsp
		rule
	];
};
}
