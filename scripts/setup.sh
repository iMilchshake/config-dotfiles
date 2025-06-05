#!/usr/bin/bash 

# exit on fail
set -euo pipefail

info()  { printf '\n>>> %s\n' "$*"; }
warn()  { printf '\n!!! %s\n' "$*" >&2; }

REPO_URL="https://github.com/iMilchshake/config-dotfiles.git"
REPO_DIR="$HOME/.dotfiles"

CFG_SRC="$REPO_DIR/config"
CFG_DST="$HOME/.config"

FONTS_SRC="$REPO_DIR/fonts"
FONTS_DST="$HOME/.local/share/fonts"   # modern per-user path

###############################################################################
clone_repo() {
  info "Repository target: $REPO_DIR"
  if [[ ! -e $REPO_DIR ]]; then
    read -r -p "Clone $REPO_URL into ~/.dotfiles? [Y/n] " ans
    [[ ${ans:-Y} =~ ^[Yy]$ ]] || { info "Skipped cloning"; return; }
    git clone --depth=1 "$REPO_URL" "$REPO_DIR"
    return
  fi

  warn "$REPO_DIR already exists."
  printf "Choose action: [o]verwrite  [k]eep  [a]bort : "
  read -r choice
  case ${choice:-k} in
    o|O)
      info "Overwriting repo..."
      rm -rf "$REPO_DIR"
      git clone --depth=1 "$REPO_URL" "$REPO_DIR"
      ;;
    k|K)
      info "Keeping existing repo (no clone)."
      ;;
    *)  info "Aborted."; exit 1 ;;
  esac
}

###############################################################################
link_configs() {
  mkdir -p "$CFG_DST"

  to_replace=()
  for src in "$CFG_SRC"/*; do
    name=${src##*/}
    dst="$CFG_DST/$name"

    if [[ -L $dst && "$(readlink -f "$dst")" == "$src" ]]; then
      info "$name already linked ⇒ skipped"
      continue
    fi

    if [[ -e $dst || -L $dst ]]; then
      to_replace+=("$dst")
    fi
  done

  if ((${#to_replace[@]})); then
    warn "These paths will be removed and replaced by symlinks:"
    printf '  %s\n' "${to_replace[@]}"
    read -r -p "Continue? [Y/n] " ans
    [[ ${ans:-Y} =~ ^[Yy]$ ]] || { info "Aborted."; exit 1; }
    for p in "${to_replace[@]}"; do rm -rf "$p"; done
  fi

  info "Linking config directories → $CFG_DST"
  for src in "$CFG_SRC"/*; do
    ln -sfn "$src" "$CFG_DST/$(basename "$src")"
  done
}

###############################################################################
install_fonts() {
  info "Installing fonts to $FONTS_DST (files will be overwritten)"
  mkdir -p "$FONTS_DST"
  cp -rT "$FONTS_SRC" "$FONTS_DST"
  fc-cache -f
}

###############################################################################
clone_repo
link_configs
install_fonts
info "All done."
