#!/bin/bash

# Base Colors from Rose Pine Theme
export BASE="#191724"        # Base
export SURFACE="#1f1d2e"     # Surface
export OVERLAY="#26233a"     # Overlay
export MUTED="#6e6a86"       # Muted
export SUBTLE="#908caa"      # Subtle
export TEXT="#e0def4"        # Text
export LOVE="#eb6f92"        # Love
export GOLD="#f6c177"        # Gold
export ROSE="#ebbcba"        # Rose
export PINE="#31748f"        # Pine
export FOAM="#9ccfd8"        # Foam
export IRIS="#c4a7e7"        # Iris

# Convert hex to sketchybar format (0xff + hex without #)
export BAR_COLOR=0xff191724          # Base color for bar background
export ITEM_BG_COLOR=0xff26233a      # Overlay color for item backgrounds
export ACCENT_COLOR=0xffeb6f92       # Love color for primary accent
export TEXT_COLOR=0xffe0def4         # Text color for labels
export HIGHLIGHT_COLOR=0xfff6c177    # Gold color for highlights
export POPUP_BACKGROUND_COLOR=0xff1f1d2e  # Surface color for popup backgrounds
export POPUP_BORDER_COLOR=0xff6e6a86     # Muted color for borders
export SHADOW_COLOR=0xff26233a       # Overlay color for shadows

# Additional Theme Colors
export HIGHLIGHT_LOW=0xff21202e      # Highlight Low from theme
export HIGHLIGHT_MED=0xff403d52      # Highlight Med from theme
export HIGHLIGHT_HIGH=0xff524f67     # Highlight High from theme

# System Colors
export TRANSPARENT=0x00000000        # Fully transparent
export BLACK=0xff191724              # Using Base color for black
export WHITE=0xffe0def4              # Using Text color for white

# Status Colors
export SUCCESS_COLOR=0xff9ccfd8      # Foam color for success states
export WARNING_COLOR=0xfff6c177      # Gold color for warnings
export DANGER_COLOR=0xffeb6f92       # Love color for danger/error states
export INFO_COLOR=0xff31748f         # Pine color for info states
