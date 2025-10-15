#!/usr/bin/env bash
set -euo pipefail

# Try safer/robust sleep modes first, fallback to plain hibernate.
# This helps on systems where `systemctl hibernate` powers off due to
# misconfigured/missing swap or resume parameters.

# Prefer suspend-then-hibernate (sleeps now, hibernates after timeout)
if systemctl --quiet is-system-running >/dev/null 2>&1; then
  if systemctl -q suspend-then-hibernate 2>/dev/null; then
    exit 0
  fi
fi

# Fallback to hybrid-sleep (suspend to RAM + hibernate image)
if systemctl -q hybrid-sleep 2>/dev/null; then
  exit 0
fi

# Final fallback to plain hibernate
exec systemctl hibernate
