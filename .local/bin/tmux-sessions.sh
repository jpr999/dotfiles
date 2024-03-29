#!/bin/sh

#set -eu

SESSION="$(tmux list-sessions -F "(#{session_attached}) #S [#{pane_current_command} in #{pane_current_path}] #{pane_title}" | sort | wofi -d -p "Running TMUX Sessions" | awk '{print $2}')"
case "$SESSION" in
  "")
  ;;
  *)
    foot tmux attach-session -dEt "$SESSION" &
  ;;
esac

