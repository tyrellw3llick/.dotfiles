#!/bin/bash

# Base Colors from Gruvbox Theme (based on the provided image)
# Using the "medium" variations primarily
export GRUVBOX_BG="#282828"        # bg0
export GRUVBOX_BG_H="#1d2021"      # bg0_h (darker background highlight)
export GRUVBOX_BG_S="#32302f"      # bg_s (dark background soft)
export GRUVBOX_BG1="#3c3836"       # bg1
export GRUVBOX_BG2="#504945"       # bg2
export GRUVBOX_BG3="#665c54"       # bg3
export GRUVBOX_BG4="#7c6f64"       # bg4
export GRUVBOX_FG="#fbf1c7"        # fg0
export GRUVBOX_FG1="#ebdbb2"       # fg1
export GRUVBOX_FG2="#d5c4a1"       # fg2
export GRUVBOX_FG3="#bdae93"       # fg3
export GRUVBOX_FG4="#a89984"       # fg4
export GRUVBOX_RED="#fb4934"       # red
export GRUVBOX_GREEN="#b8bb26"     # green
export GRUVBOX_YELLOW="#fabd2f"    # yellow
export GRUVBOX_BLUE="#83a598"      # blue
export GRUVBOX_PURPLE="#d3869b"    # purple
export GRUVBOX_AQUA="#8ec07c"      # aqua
export GRUVBOX_ORANGE="#fe8019"    # orange
export GRUVBOX_GRAY="#928374"      # gray (lighter one)

# Convert hex to sketchybar format (0xff + hex without #)
# Mapping Rose Pine concepts to Gruvbox colors
export BAR_COLOR=0xff282828              # Mapped from Rose Pine BASE to Gruvbox bg0
export ITEM_BG_COLOR=0xff504945          # Mapped from Rose Pine OVERLAY to Gruvbox bg2
export ACCENT_COLOR=0xfffb4934           # Mapped from Rose Pine LOVE to Gruvbox red
export TEXT_COLOR=0xfffbf1c7             # Mapped from Rose Pine TEXT to Gruvbox fg0
export HIGHLIGHT_COLOR=0xfffabd2f        # Mapped from Rose Pine GOLD to Gruvbox yellow
export POPUP_BACKGROUND_COLOR=0xff3c3836 # Mapped from Rose Pine SURFACE to Gruvbox bg1
export POPUP_BORDER_COLOR=0xff928374     # Mapped from Rose Pine MUTED to Gruvbox gray
export SHADOW_COLOR=0xff504945           # Mapped from Rose Pine OVERLAY to Gruvbox bg2

# Additional Theme Colors (Mapping to similar dark/light background shades)
export HIGHLIGHT_LOW=0xff1d2021          # Mapped to Gruvbox bg0_h
export HIGHLIGHT_MED=0xff32302f          # Mapped to Gruvbox bg_s
export HIGHLIGHT_HIGH=0xff3c3836         # Mapped to Gruvbox bg1

# System Colors
export TRANSPARENT=0x00000000          # Fully transparent (remains the same)
export BLACK=0xff282828                # Using Gruvbox bg0 for black
export WHITE=0xfffbf1c7                # Using Gruvbox fg0 for white

# Status Colors
export SUCCESS_COLOR=0xff8ec07c          # Mapped from Rose Pine FOAM to Gruvbox aqua
export WARNING_COLOR=0xfffabd2f          # Mapped from Rose Pine GOLD to Gruvbox yellow
export DANGER_COLOR=0xfffb4934           # Mapped from Rose Pine LOVE to Gruvbox red
export INFO_COLOR=0xff83a598             # Mapped from Rose Pine PINE to Gruvbox blue
