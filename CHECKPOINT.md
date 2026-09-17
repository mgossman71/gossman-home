# Project Checkpoint

## Current Goal

Homepage for gossman.cloud — a single-file static product index. Code review done and all findings addressed.

## Current State

Static site (one self-contained `index.html`) served by nginx via Docker. Builds and serves at `http://localhost:3000` with `docker compose up -d --build`.

## Completed

- 2026-09-17 code review; all findings fixed:
  - Reveal-on-scroll hidden state gated behind `html.js` (head script adds the class) so content stays visible with JS disabled/blocked.
  - `nginx.conf`: security headers restated inside `location = /index.html` (add_header does not inherit into locations that define their own).
  - Dead CSS removed (`.nav__link`, `.hero__meta`).
  - `-webkit-backdrop-filter` prefixes added (nav, ghost button, card).
  - Starfield: `Math.round` replaces `|0` precedence trick; static (reduced-motion) mode repaints after resize.
  - `Dockerfile` pinned to `nginx:1.26-alpine`; compose image/container renamed `webrouter` → `gossman-home`.
  - README corrected (nginx.conf is a static file server, not a reverse proxy).

## Architecture

- `index.html` — all markup/CSS/JS; product list is the `SITES` array near the bottom of the `<script>` (add an object to add a product).
- `nginx.conf` → `/etc/nginx/conf.d/default.conf`: gzip, `no-cache` on the document, security headers.
- `Dockerfile` / `docker-compose.yml` — nginx:1.26-alpine, host port 3000 → 80.

## Important Files

- `index.html` — the entire page (single source of truth for content).
- `nginx.conf`, `Dockerfile`, `docker-compose.yml` — serving.

## Decisions

- Keep single-file page (no build step); adding a product = adding one object to `SITES`.
- Respect `prefers-reduced-motion` everywhere (orb, tilt, starfield, reveal, smooth scroll).
- Pin nginx minor version for reproducible builds; bump intentionally.

## Known Issues

- None known. (Optional, not done: Content-Security-Policy, HSTS — both better handled by an upstream HTTPS proxy.)

## Work In Progress

- None.

## Next Steps

1. Bump nginx pin / add more products as needed.
2. Consider `og:` meta tags for social sharing if links get shared a lot.

## Validation

- 2026-09-17: inline JS passed `node --check`; `docker compose config` validated; `git diff` reviewed.
- No test suite exists (static site).

## Environment

- Docker required for local run; port 3000.
- Production: assumed to sit behind an HTTPS proxy for gossman.cloud subdomains.

## Last Updated

2026-09-17 — code review findings implemented and validated.
