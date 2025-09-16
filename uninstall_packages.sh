#!/bin/bash

# Packages to uninstall
packages=(
  desktop-file-utils
  shared-mime-info
  gobject-introspection
  gtk-mac-integration
  meson
  ninja
  pkg-config
  gtk+3
  gtk4
)

echo "Uninstalling specified Homebrew packages..."

for pkg in "${packages[@]}"; do
  if brew list --formula | grep -q "^$pkg\$"; then
    echo "Uninstalling $pkg..."
    brew uninstall --formula "$pkg"
  elif brew list --cask | grep -q "^$pkg\$"; then
    echo "Uninstalling $pkg (cask)..."
    brew uninstall --cask "$pkg"
  else
    echo "$pkg is not installed."
  fi
done

echo "Running brew cleanup..."
brew cleanup

echo "Done."

