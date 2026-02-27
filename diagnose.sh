#!/bin/bash
# AgentForge npm diagnostic — run with: curl -fsSL https://agentsforge.dev/diagnose.sh | bash

echo "=== npm config ==="
echo "prefix:      $(npm config get prefix 2>/dev/null)"
echo "npm root -g: $(npm root -g 2>/dev/null)"
echo ""

echo "=== ~/.npm-global layout ==="
echo "bin/:"
ls ~/.npm-global/bin/ 2>/dev/null || echo "  (empty or missing)"
echo "lib/node_modules/:"
ls ~/.npm-global/lib/node_modules/ 2>/dev/null || echo "  (empty or missing)"
echo ""

echo "=== openclaw package root ==="
ls ~/.npm-global/lib/node_modules/openclaw/ 2>/dev/null || echo "  (not found)"
echo ""

echo "=== openclaw package.json bin field ==="
cat ~/.npm-global/lib/node_modules/openclaw/package.json 2>/dev/null \
  | python3 -c "import json,sys; p=json.load(sys.stdin); print('bin:', p.get('bin')); print('version:', p.get('version'))" \
  2>/dev/null || echo "  (package.json not found)"
echo ""

echo "=== any openclaw executables? ==="
find ~/.npm-global -name "openclaw*" -type f 2>/dev/null | head -10
find ~/.npm-global -name "openclaw*" -type l 2>/dev/null | head -10
echo ""

echo "=== ~/.npmrc ==="
cat ~/.npmrc 2>/dev/null || echo "(missing)"
