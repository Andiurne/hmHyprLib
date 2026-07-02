{lua}:
rec {
bindVarParse = bind: key: (bind + " .. \" + " + key + "\"");

exec = cmd: (lua ("hl.dsp.exec_cmd(\"" + cmd + "\")"));

bindMap = bind: key:
	if (bind == "mainMod") || (bind == "subMod") then
		lua (bindVarParse bind key)
	else
		bind;

simpleBind = bind: key: cmd: {
	_args = [
		(bindMap bind key)
		(exec cmd)
	];
};
pvarBind = bind: key: cmd: {
	_args = [
		(bindMap bind key)
		(lua("hl.dsp.exec_cmd(\"app2unit -- \" .. " + cmd + ")"))
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

window = method: (lua ("hl.dsp.window." + method + "()"));
windowArgs = method: args: (lua ("hl.dsp.window." + method + "(" + args + ")"));
layout = name: (lua ("hl.dsp.layout(\"" + name + "\")"));
focus = rule: (lua ("hl.dsp.focus(" + rule + ")"));
workspaceArgs = method: args: (lua ("hl.dsp.workspace." + method + "(\"" + args + "\")"));
}
