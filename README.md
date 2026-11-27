# Aarav's Evening System

An installable web app with a daily plan, focus timer, protein tracking, sleep and screen-time logging, and stats.
Live at https://aarav-productivity.vercel.app

## Stack
- Static files only: `index.html`, `config.js`, `manifest.webmanifest`, `sw.js`, `icons/`
- Hosting: Vercel, auto-deploying from the `main` branch
- Sync: Supabase. Email magic-link sign-in, one JSON row per user in `evening_state`, protected by row-level security
- Works offline and saves to the device first; it syncs when you're signed in

## Setup
1. Supabase → SQL Editor → run `supabase/schema.sql`.
2. Supabase → Authentication → URL Configuration: set the Site URL to `https://aarav-productivity.vercel.app` and add the same URL under Redirect URLs.
3. Put the Project URL and anon public key into `config.js`. Never the service_role key.
4. Vercel → Add New Project → import this repo → set the project name to `aarav-productivity` → Deploy. No build settings needed.

## Install
- Android (Chrome): open the URL → ⋮ menu → Add to Home screen → Install.
- Windows (Chrome/Edge): open the URL → click the install icon in the address bar.
