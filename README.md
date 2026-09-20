# Campfire Circle — Supabase edition

A private group camping planner with mandatory Google sign-in. Trip details, people, discussion, votes, shared gear and expenses are saved in Supabase. Updates are linked to the authenticated Google account and written to an activity log.

## Supabase setup

1. Create a Supabase project.
2. Open **SQL Editor**, paste `supabase/schema.sql`, and run it once.
3. In **Authentication → Providers**, enable Google and add the Google OAuth client ID and secret.
4. In **Authentication → URL Configuration**, add your deployed site URL and `https://YOUR-DOMAIN/auth/callback` as redirect URLs.
5. Copy `.env.example` to `.env.local` and fill in the project URL and publishable anon key.

## Run locally

```bash
pnpm install
pnpm dev
```

Add `http://localhost:5173/auth/callback` to the Supabase redirect URLs for local testing.

## Deploy

Connect the repository to a compatible Next.js host, add both variables from `.env.example`, and deploy. Add the final `/auth/callback` URL to Supabase before testing Google sign-in.

## Identity and record keeping

- Visitors cannot open the planner without a valid Google session.
- The in-app person/account switcher has been removed.
- Every plan update is authenticated server-side.
- `activity_log` records the Google account ID, email, action and timestamp.
- Row-level security blocks anonymous database access.

Do not place a Supabase service-role key in this project or expose one to the browser.
