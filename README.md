# Contents
All functions are declared in lib.<function>

## lua (code)
An alias for nixpkgs.lib.generators.mkLuaInline.
Must be called AFTER all string processing is done.

## autostart (list)
Takes in a list of commands (as strings) to run on hypland.start,
to be placed into the list of "on" calls.
I.e. ...hyprland.settings.on = [(autostart ["noctalia" "equibop"]) ...]

## bezierRule (p1 p2), springRule (mass stiffness dampening)
Produce attrSets of type bezier or spring respectively.

## mkCurve (name rule)
Produces a curve "name" with the given rule

## addStyle (animation style)
Takes a result of mkAnimation and adds a given "style" to it.

## mkAnimation (leaf speed curveName)
Takes in the leaf, speed, and curveName, and produces an enabled animation.

## Dispatchers
Each of:
    - window
    - windowArgs
    - layout
    - focus
    - workspaceArgs
    - exec (for exec_cmd)
produce hl.dsp.<name>(<args> for windowArgs, workspaceArgs, and exec) elements,
for use in bindings.

## env (name value)
Produces am entry for ...settings.env

## Bindings
### bindMap (mod key)
Takes in a mod (a lua var, either mainMod or subMod) and a key, and produces a full keybind.
If key is "", the binding will just be "mod" literal.
I.e., to bind Print Screen, (bindMap "Print" "")

### simpleBind (mod key cmd)
Bind a literal cmd to mod+key

### pvarBind (mod key luaVar)
Bind a lua variable command (i.e. local terminal = "foot") to bind+key

### ipcBind (mod key cmd)
Similar to pvarBind, but for the ipc prefix "ipc .. <cmd>"

### dspBind (mod key dsp)
Bind mod + key to a dispatcher

### fullBind (mod key dsp rule)
Bind mod + key to dsp with rule
