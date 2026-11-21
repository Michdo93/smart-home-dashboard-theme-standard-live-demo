# smart-home-dashboard-theme-standard-live-demo

**→ <https://michdo93.github.io/smart-home-dashboard-theme-standard-live-demo/>**

Online-Demo des [Smart-Home-Dashboards](https://github.com/Michdo93/Smart-Home-Dashboard) mit dem Theme standard aus [smart-home-dashboard-theme-standard](https://github.com/Michdo93/smart-home-dashboard-theme-standard). Begleit-Repo zum Buch *openHAB Online Demos*.

Die Demo ist mit einem openHAB 5 verbunden, auf dem das [virtuelle Haus](https://github.com/Michdo93/openHAB-Virtual-Smart-Home) läuft – alles simuliert. Was Sie schalten, sehen andere Besucher live mit. Sperrbildschirm zum Ausprobieren: PIN `1234`.

## Aufbau

```text
GitHub Pages (dieses Repo)      Cloudflare Worker              myopenHAB        Proxmox-VM
Dashboard + standard        →   cloudflare-openhab-rest-   →   Cloud       →    openHAB 5
+ js-openhab-proxy-client       proxy: Freigaben, Prüfung      Connector        virtuelles Haus
```

Alle Online-Demos teilen sich denselben Proxy: Sie liegen unter `michdo93.github.io` und haben damit dieselbe Herkunft (Origin), die der Proxy erlaubt.

## Was dieses Repo enthält

| Datei | Inhalt |
|---|---|
| `config.demo.js` | Adresse des Proxys, Titel, Demo-PIN; wird an `config.js` des Dashboards angehängt |
| `anpassen.sh` | tauscht `js-openhab-rest-client` gegen `js-openhab-proxy-client`, installiert standard mit dessen `install.sh`, hängt `config.demo.js` an |
| `.github/workflows/pages.yml` | holt Dashboard, standard und Proxy-Client, ruft `anpassen.sh` auf, veröffentlicht auf GitHub Pages |

Die Demo übernimmt den Stand von `main` des Dashboards und von smart-home-dashboard-theme-standard bei jedem Push hierher, von Hand (Actions → *Online-Demo veröffentlichen* → *Run workflow*) und montags automatisch.

## Lokal ausprobieren

```bash
git clone https://github.com/Michdo93/Smart-Home-Dashboard site
git clone https://github.com/Michdo93/smart-home-dashboard-theme-standard theme
git clone https://github.com/Michdo93/js-openhab-proxy-client proxy-client
PROXY_URL=http://localhost:8787 ./anpassen.sh site proxy-client theme
python3 -m http.server 5173 -d site
```

## Eigene Demo mit diesem Proxy

Der Proxy nimmt nur Anfragen von freigegebenen Herkünften an. Wer eine eigene Demo-Seite gegen das virtuelle Haus betreiben möchte, bittet per Issue in [cloudflare-openhab-rest-proxy](https://github.com/Michdo93/cloudflare-openhab-rest-proxy) um Freigabe seiner Adresse (z. B. `https://<name>.github.io`). Für einen eigenen Proxy vor dem eigenen openHAB beschreibt das Buch *openHAB Online Demos* alle Schritte.

## Unterstützen

Wenn Ihnen dieses Projekt hilft, freue ich mich über einen Kaffee:

[![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-ffdd00?logo=buymeacoffee&logoColor=black)](https://buymeacoffee.com/Michdo93)

## Lizenz

MIT – siehe [LICENSE](LICENSE).
