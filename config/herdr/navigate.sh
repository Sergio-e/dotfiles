#!/bin/sh
# vim-tmux-navigator for herdr: when vim is the focused pane's foreground
# process, pass C-h/j/k/l through to it; otherwise move herdr focus.
# Usage: navigate.sh left|down|up|right

case "$1" in
  left) key=h ;;
  down) key=j ;;
  up) key=k ;;
  right) key=l ;;
  *) echo "usage: $0 left|down|up|right" >&2; exit 2 ;;
esac

herdr="${HERDR_BIN_PATH:-herdr}"
pane="$HERDR_ACTIVE_PANE_ID"

# Same process names as is_vim in tmux.conf
if "$herdr" pane process-info --pane "$pane" | jq -e \
  'any(.result.process_info.foreground_processes[]; .name | test("^g?(view|n?vim?x?)(diff)?$"))' \
  >/dev/null; then
  exec "$herdr" pane send-keys "$pane" "ctrl+$key"
fi

exec "$herdr" pane focus --pane "$pane" --direction "$1"
