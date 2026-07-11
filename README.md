# Contents
All functions are declared in lib.<function>

## Makers
### mkAnimation (leaf speed curveName)
Takes in the leaf, speed, and curveName, and produces an enabled animation.

### autostart (list)
Takes in a list of commands (as strings) to run on hypland.start,
to be placed into the list of "on" calls.
I.e. ...hyprland.settings.on = [(autostart ["noctalia" "equibop"]) ...]

### mkCurve (name rule)
Produces a curve "name" with the given rule

### env (name value)
Produces an entry for ...settings.env


## Interim Functions
### addStyle (animation style)
Takes a result of mkAnimation and adds a given "style" to it.

### addFlags (bindSet flagSet)
Takes in a result from one of the bind functions (i.e. {_args = [...];}) and adds
flags as an attribute set to it. I.e. {locked = true; repeating = true; }.

### lua (code)
An alias for nixpkgs.lib.generators.mkLuaInline.
Must be called AFTER all string processing is done.

### Dispatchers
Each of:
- window
- windowArgs
- layout
- focus
- workspaceArgs
- exec (for exec_cmd
produce hl.dsp.<name>(<args> for windowArgs, workspaceArgs, and exec) elements,
for use in bindings.

## Bindings
### simpleBind (mod cmd)
Bind a literal cmd
NOTE: "mod" must be a literal lua string

### pvarBind (mod luaVar)
Bind a lua variable command (i.e. local terminal = "foot") to bind+key

### ipcBind (mod cmd)
Similar to pvarBind, but for the ipc prefix "ipc .. <cmd>"

### dspBind (mod dsp)
Binds for hl.dsp.{dsp}

### fullBind (mod dsp rule)
Bind mod to hl.dsp.{dsp} with rule
