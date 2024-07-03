# The split_3x5_3 rgoulter layout laid out onto ch552-48 keymap.

let { combo, tap, .. } = import "fak/keycode.ncl" in

let ch554_48_layouts = import "../layouts.ncl" in
let split_3x5_3_keymap = import "lib/keymaps/split_3x5_3/rgoulter.ncl" in

ch554_48_layouts.lift_from_split_3x5_3 split_3x5_3_keymap
