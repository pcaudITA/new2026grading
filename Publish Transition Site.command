#!/bin/bash
# Publishes the G2026 transition site to GitHub Pages.
# FIRST TIME ONLY: create an empty PUBLIC repo named  g2026-transition
# at https://github.com/new (owner: pcaudITA, no README), then run this.
cd "$(dirname "$0")" || exit 1
clear
echo "==============================================="
echo "   G2026 Transition -> GitHub Pages"
echo "==============================================="
git rev-parse --git-dir >/dev/null 2>&1 || git init -b main
git add -A
git -c user.email=jordi80@gmail.com -c user.name="PCaudit" commit -m "update" >/dev/null 2>&1 || echo "(nothing new to commit)"
git remote get-url origin >/dev/null 2>&1 || git remote add origin git@github.com:pcaudITA/g2026-transition.git
git push -u origin main && {
  echo
  echo "==============================================="
  echo " PUSHED. First time? One manual step on GitHub:"
  echo "   repo Settings -> Pages -> Source:"
  echo "   'Deploy from a branch' -> main / (root) -> Save"
  echo " Live ~1 min later at:"
  echo "   https://pcaudita.github.io/g2026-transition/"
  echo "==============================================="
} || echo ">>> Push failed - screenshot this window for Claude."
echo
read -p "Press Enter to close..." _
