# Patches Used
- awesomebar https://dwm.suckless.org/patches/awesomebar/
  - Ability to minimize apps from topbar
- attachaside https://dwm.suckless.org/patches/attachaside/
  - Placing new window on the side instead in the master
- combo https://dwm.suckless.org/patches/combo/
  - Merge multiple selected tags into 1 tag
- cyclelayouts https://dwm.suckless.org/patches/cyclelayouts/
  - Cycle through all layout with a single keybind
- movestack https://dwm.suckless.org/patches/movestack/
  - Ability to move stack around
- pertag https://dwm.suckless.org/patches/pertag/
  - Keeps layout, mwfact, barpos and nmaster per tag.
- swapfocus https://dwm.suckless.org/patches/swapfocus/
  - Switch focus to last used windows with single shortcut (alt + s)
- warp https://dwm.suckless.org/patches/warp/
  - Cursor on the active window
- zoomswap https://dwm.suckless.org/patches/zoomswap/
  - Swapping master/stack sides
- flextile_deluxe_layout https://dwm.suckless.org/patches/flextile/
  - Better layouts
- setborderpx_patch https://dwm.suckless.org/patches/setborderpx/
  - Allows border pixels to be changed during runtime
- vanitygaps https://dwm.suckless.org/patches/vanitygaps/
  - Adding gaps between different windows

# Keybinds Cheatsheet (With Patches)
| Keybinds                           | Action                                              | From Patches      |
| ---------------------------------- | --------------------------------------------------- | ----------------- |
| Alt + Shift + }                    | Increase Border PX (2px)                            | setborderpx_patch |
| Alt + Shift + {                    | Decrease Border PX (2px)                            | setborderpx_patch |
| Alt + Ctrl + ,                     | Cycle Layout to Left                                | cyclelayouts      |
| Alt + Ctrl + .                     | Cycle Layout to Right                               | cyclelayouts      |
| Alt + Shift + j or Alt + Shift + k | Move Window to Left or Right                        | movestack         |
| Alt + 1-9                          | Combining Tags According To What Key Number Pressed | combo             |
| Alt + s                            | Switch Focus to Last Used Windows                   | swapfocus         |
| Alt + Ctrl + z                     | Hide Focused Window                                 | awesomebar (?)    |
| Alt + Ctrl + s                     | Unhide All Window                                   | awesomebar (?)    |
| Alt + p                            | Open Application Menu (dmenu)                       | -                 |
| Alt + Shift + p                    | Open Desktop Application Menu (rofi)                | (self modified)   |
| Alt + Shift + e                    | Launch Thunar                                       | (self modified)   |
| Shift + Alt + Enter                | Launch Terminal (alacritty)                         | (self modified)   |
| Alt + Enter                        | Switch Windows with Master                          | -                 |
| Alt + h                            | Shifting Master to the Left                         | -                 |
| Alt + l                            | Shifting Master to the Right                        | -                 |
| Alt + j or Alt k                   | Focus to Another Window                             | -                 |
| Alt + t                            | Tile Layout                                         | -                 |
| Alt + f                            | Floating Layout                                     | -                 |
| Alt + Shift + f                    | Monocle Layout (fullscreen)                         | (self modified)   |
| Alt + Space                        | Switch with Last Used Layout                        | -                 |
| Alt + Tab                          | Switch to Last Visited Tag (Workspace)              | -                 |
| Alt + Shift + c                    | Close The Program                                   | -                 |
| Alt + Shift + q                    | Quit dwm WM                                         | -                 |

# dwm Basic Tutorial
https://dwm.suckless.org/tutorial/