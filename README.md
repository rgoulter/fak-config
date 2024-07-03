# fak-config

[FAK user configuration](https://github.com/semickolon/fak-config) repository.

[FAK](https://github.com/semickolon/fak) is a keyboard firmware for the CH55x series of microcontrollers.

CH55x microcontrollers are both cheap, and very simple to design keyboards for.

FAK uses the [Nickel](https://nickel-lang.org/) configuration language (a
"JSON + functions + types" language) for defining keyboard and keymap definitions.
Nickel is a pleasant and expressive language to use for this.

This repository includes definitions for my keyboards and keymaps.

## Overview

- `shared/lib` - Nickel code which may be shared across keymaps/keyboard Nickel code.

  - [layouts.ncl](shared/lib/layouts.ncl) - helper code for various Alphabetical layouts. (QWERTY, Dvorak, etc.).

  - [keymaps/split_3x5_3/](shared/lib/keymaps/split_3x5_3/) - keymaps for a "split 3x5 + 3" layout.

    - [rgoulter](shared/lib/keymaps/split_3x5_3/rgoulter.ncl) - my split 3x5 + 3 keymap, a miryoku-inspired keymap.

  - `keyboards/` - FAK keyboard definitions.

    - [ch552-36](keyboards/ch552-36)

    - [ch552-36-rhs](keyboards/ch552-36-rhs) - definition for using RHS-only as central. Useful for checking the RHS is soldered correctly.

    - [ch552-44](keyboards/ch552-44)

      - [layouts](keyboards/ch552-44/layouts.ncl) - supports implementing keymaps in other layouts. (e.g. using split_3x5_3 on the ch552-44).

    - [ch552-48](keyboards/ch552-48)

      - [layouts](keyboards/ch552-48/layouts.ncl) - supports implementing keymaps in other layouts. (e.g. using split_3x5_3 on the ch552-44).

## Keyboards

Design files for PCBs, plates, 3DP/CNC from rgoulter's [Keyboard Labs](https://github.com/rgoulter/keyboard-labs).

| Designation  | Summary/Keywords                                                                       | Image                                                                                                                                                 |
|--------------|----------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| [CH552-44](#ch552-44-low-budget-hand-solderable-pcb-in-bm40jj40-form-factor) | 44-key ortholinear, MX, BM40/JJ40-compatible, no frills        | ![](https://raw.githubusercontent.com/rgoulter/keyboard-labs/master/docs/images/keyboards/ch552-44/ch552_44-sandwich-top.JPG) |
| [CH552-48](#ch552-48-low-budget-pcba-in-bm40jj40-form-factor) | 48-key ortholinear (4x12), MX, BM40/JJ40-compatible, no frills        | ![](https://raw.githubusercontent.com/rgoulter/keyboard-labs/master/docs/images/keyboards/ch552-48/ch552-48-top.JPG) |
| [CH552-48-LPR](#ch552-48-lpr-low-budget-pcba-with-low-profile-redragon-switches) | 48-key ortholinear (4x12), low profile redragon, no frills        | ![](https://raw.githubusercontent.com/rgoulter/keyboard-labs/master/docs/images/keyboards/ch552-48-lpr/ch552_48-lpr-sandwich-top.JPG) |
| [CH552-36](#ch552-36-low-budget-36-key-split-keyboard-with-smt-components) | 36 key (2x3x5+3), split, column-staggered, MX, sub-100x100, no frills        | ![](https://raw.githubusercontent.com/rgoulter/keyboard-labs/master/docs/images/keyboards/ch552-36/top-with-coiled-cable.JPG) |

## Setup

Refer to [upstream documentation for setting up fak-config](https://github.com/semickolon/fak-config?tab=readme-ov-file#setup).

### Using Nix

If you have [Nix](https://nixos.org/) [installed on your system](https://github.com/DeterminateSystems/nix-installer), a Nix flake is provided.

With [direnv](https://direnv.net/), allow the `.envrc` using `direnv allow`.

## Commands

Now that you have your development environment set up and ready, compiling is as easy as `fak compile -kb [keyboard] -km [keymap]`. You may omit `-km [keymap]` if keymap is "default" (e.g., `fak compile -kb [keyboard]`). This will also print the path(s) where it put the firmware files in, which is helpful in a remote setup.

If you're using a local setup, you can flash directly with `fak flash -kb [keyboard] -km [keymap]`. Then if you have a split, flash the peripheral side with `fak flash_p -kb [keyboard] -km [keymap]`. Likewise, you may omit `-km [keymap]` if keymap is "default".

If something's off, wrong, or not working, cleaning your build files might help with `fak clean`.

To compile every keyboard with its every keymap, enter `fak compile_all`. Whenever you push, this is what GitHub Actions actually does behind the scenes to update the latest release with all ready-to-flash `.ihx` files.

