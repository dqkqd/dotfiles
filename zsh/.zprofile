export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# nvim
export EDITOR=nvim
export VISUAL=nvim

# firefox
export MOZ_ENABLE_WAYLAND=1
export MOZ_DRM_DEVICE=/dev/dri/renderD128
export XDG_CURRENT_DESKTOP=sway

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec sway
fi

