{lua}:{
  window = method: (lua ("hl.dsp.window.${method}()"));
  windowArgs = method: args: (lua ("hl.dsp.window.${method}(${args})"));
  layout = name: (lua ("hl.dsp.layout('${name}')"));
  focus = rule: (lua ("hl.dsp.focus(${rule})"));
  workspaceArgs = method: args: (lua ("hl.dsp.workspace.${method}('${args}')"));
}
