#!/bin/bash
# AgentForge npm diagnostic — run with: curl -fsSL https://agentsforge.dev/diagnose.sh | bash

echo "=== npm config ==="
echo "prefix:     $(npm config get prefix 2>/dev/null)"
echo "npm bin -g: $(npm bin -g 2>/dev/null || echo 'deprecated/unavailable')"
echo "npm root -g: $(npm root -g 2>/dev/null)"
echo "npm_config_prefix env: ${npm_config_prefix:-'(not set)'}"
echo ""

echo "=== ~/.npm-global layout ==="
echo "bin/:"
ls ~/.npm-global/bin/ 2>/dev/null || echo "  (empty or missing)"
echo "lib/node_modules/:"
ls ~/.npm-global/lib/node_modules/ 2>/dev/null || echo "  (empty or missing)"
echo ""

echo "=== openclaw anywhere? ==="
find ~/.npm-global /usr/lib/node_modules /usr/local/lib/node_modules -name "openclaw" 2>/dev/null | head -10 || echo "not found"
echo ""

echo "=== ~/.npmrc ==="
cat ~/.npmrc 2>/dev/null || echo "(missing)"
echo ""

echo "=== NodeSource npmrc ==="
cat /usr/lib/node_modules/npm/npmrc 2>/dev/null || echo "(missing)"
