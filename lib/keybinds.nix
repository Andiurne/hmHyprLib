{lua}:
rec {
exec = cmd: (lua ("hl.dsp.exec_cmd('" + cmd + "')"));

addFlags = bindSet: flagSet: bindSet // {_args = bindSet._args ++ [flagSet];};

simpleBind = bindString: cmd: {
	_args = [
		(lua bindString)
		(exec cmd)
	];
};
pvarBind = bindString: luaVar: {
	_args = [
		(lua bindString)
		(lua ("hl.dsp.exec_cmd('app2unit -- ' .. " + luaVar + ")"))
	];
};
ipcBind = bindString: cmd: {
	_args = [
		(lua bindString)
		(lua ("hl.dsp.exec_cmd(ipc .. '" + cmd + '")"))
	];
};
dspBind = bindString: dsp: {
	_args = [
		(lua bindString)
		dsp
	];
};
fullBind = bindString: dsp: rule:
{
	_args = [
		(lua bindString)
		dsp
		rule
	];
};
}
