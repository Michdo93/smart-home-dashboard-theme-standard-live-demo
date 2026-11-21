#!/usr/bin/env bash
# Macht aus Smart-Home-Dashboard und smart-home-dashboard-theme-standard
# die Online-Demo:
#   1. Theme "standard" installieren
#   2. js-openhab-proxy-client statt js-openhab-rest-client
#   3. config.demo.js hinter config.js hängen
#
#   ./anpassen.sh <Dashboard> <Proxy-Client> <Theme-Repo>
#   (Theme-Repo: smart-home-dashboard-theme-standard)
set -euo pipefail
SITE="$1"
CLIENT="$2"
THEME="$3"
HIER="$(cd "$(dirname "$0")" && pwd)"

# 1. Theme "standard" installieren und zur Voreinstellung machen
"$THEME/install.sh" "$SITE" --default

# 2. Bibliothek tauschen – beide haben dieselbe Schnittstelle
cp "$CLIENT/openhab-proxy.min.js" "$SITE/lib/"
rm -f "$SITE/lib/openhab.min.js"
sed -i 's|lib/openhab.min.js|lib/openhab-proxy.min.js|' "$SITE/index.html"
grep -q 'lib/openhab-proxy.min.js' "$SITE/index.html"   # Abbruch, falls nicht ersetzt

# 3. Einstellungen der Demo anhängen
{ echo; cat "$HIER/config.demo.js"; } >> "$SITE/config.js"
if [ -n "${PROXY_URL:-}" ]; then                        # nur für lokale Tests
  sed -i "s|https://openhab-demo-proxy[^\"]*|$PROXY_URL|" "$SITE/config.js"
fi
rm -rf "$SITE/.git" "$SITE/.github"
echo "Online-Demo (standard) vorbereitet in $SITE"
