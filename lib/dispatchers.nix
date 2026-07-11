{lua, toLua}:
let
# Lua-fies sets into tables, leaves string literals alone
checkArgs = args: if builtins.typeOf args == "string" then args else toLua {} args;
in
{
  window = method: (lua "hl.dsp.window.${method}()");
  windowArgs = method: args: (lua "hl.dsp.window.${method}(${checkArgs args})");
  layout = name: (lua "hl.dsp.layout('${name}')");
  focus = rule: (lua "hl.dsp.focus(${checkArgs rule})");
  workspaceArgs = method: args: (lua "hl.dsp.workspace.${method}(${checkArgs args})");
  dspCall = method: (lua "hl.dsp.${method}()");
  dspCallArgs = method: args: (lua "hl.dsp.${method}(${checkArgs args})");
}
