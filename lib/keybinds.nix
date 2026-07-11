{lua}:
rec {
	exec = cmd: (lua ("hl.dsp.exec_cmd('${cmd}')"));
	execLiteral = cmd: (lua("hl.dsp.exec_cmd(${cmd})"));

	addFlags = bindSet: flagSet: bindSet // {_args = bindSet._args ++ [flagSet];};

	simpleBind = mod: cmd: {
		_args = [
			mod
			(exec cmd)
		];
	};
	pvarBind = mod: luaVar: {
		_args = [
			mod
			(execLiteral "'app2unit -- ' .. ${luaVar}")
		];
	};
	ipcBind = mod: cmd: {
		_args = [
			mod
			(execLiteral "ipc .. '${cmd}'")
		];
	};
	dspBind = mod: dsp: {
		_args = [
			mod
			dsp
		];
	};
	fullBind = mod: dsp: flags:
	{
		_args = [
			mod
			dsp
			flags
		];
	};
}
