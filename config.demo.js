// Online-Demo: wird an config.js des Dashboards angehängt und überschreibt
// nur, was sich gegenüber der lokalen Installation ändert.
Object.assign(window.DASHBOARD_CONFIG, {
  // Cloudflare Worker (cloudflare-openhab-rest-proxy) statt openHAB direkt
  openhabUrl: "https://openhab-demo-proxy.github-editor.workers.dev",
  token: null,                   // die Zugangsdaten kennt nur der Proxy
  title: "Live-Demo · Virtuelles Haus",
  // Sperrbildschirm zum Ausprobieren: nur per Schloss, nicht beim Laden
  lock: { pin: "1234", afterMinutes: null, startLocked: false,
    hint: "Demo-PIN: 1234" }
});
