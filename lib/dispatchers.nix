{lua, toLua}:{
  window = method: (lua "hl.dsp.window.${method}()");
  windowArgs = method: args: (lua "hl.dsp.window.${method}(${toLua {} args})");
  layout = name: (lua "hl.dsp.layout('${name}')");
  focus = rule: (lua "hl.dsp.focus(${toLua {} rule})");
  workspaceArgs = method: args: (lua "hl.dsp.workspace.${method}(${toLua {} args})");
  dspCall = method: (lua "hl.dsp.${method}()");
  dspCallArgs = method: args: (lua "hl.dsp.${method}(${toLua {} args})");
}
