# gossman-home

The homepage for **gossman.cloud** — a small index of the projects running on the domain. A single-file static site (vanilla HTML/CSS/JS) served by nginx.

## Run locally

```bash
docker compose up -d --build
# → http://localhost:3000
```

## Files

- `index.html` — the whole page (markup, styles, script)
- `nginx.conf` — minimal nginx config: gzip, `no-cache` on the document, security headers
- `Dockerfile`, `docker-compose.yml` — containerized serving

Built with AI.
