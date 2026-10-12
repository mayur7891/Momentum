# Momentum PRO — Final Build v3

A mobile-first personal dashboard for walking, weight, sleep, hydration, study, meals, habits and job switching. Both people use the same hosted app but should create separate Supabase accounts. Row-level security keeps cloud rows private to the account that owns them.

## Final build notes
- UI pass focused on reducing horizontal overflow, cramped forms, low-contrast light-mode controls, and inconsistent surfaces.
- PWA shell and versioned service-worker cache included. After updating an existing deployment, refresh once or close/reopen the installed app to load the new version.
- This is a lightweight browser app, not a native Android app. Health Connect / Google Fit auto-import is not included.

## What's included
- Responsive redesigned dashboard with high-contrast light mode, refined spacing, mobile-safe cards/forms, dark/light themes and 7/30/90-day dynamic charts
- Step, walking, weight, waist, sleep, water, optional calorie/protein and meal logs
- Streaks, personal bests, habit checklist, mood check-in and weekly review
- Focus timer with study-time logging
- Job application pipeline: company, title, status, dates, follow-ups, interviews, location/work mode, expected CTC, source, URL, recruiter/contact, resume version, skills, next action, priority and notes
- Job pipeline counters for active applications, interviews and follow-ups due; search, stage filter, sorting, editing and deleting
- Weekly career actions, target role, skill plan and pitch/STAR-story notes
- JSON backup/import and CSV export of daily logs
- Optional Supabase cloud sync with row-level security
- PWA files for home-screen installation on Android

## Two users: recommended setup
1. Deploy this app once to a GitHub Pages HTTPS URL.
2. Create one Supabase project and run `schema.sql` once.
3. Each person creates their own Supabase Auth account from the app. Do not share a login.
4. Each person's cloud rows are protected by policies using `auth.uid()`.
5. Ideally, each person uses their own phone/browser profile. This version's local offline cache is browser-local and is not a separate encrypted local profile per account. On a shared device, sign out and avoid leaving the browser open; for stronger separation use separate Android user profiles or different browser profiles.
6. Both accounts use the same project URL and publishable/anon key, but each signs in with their own email/password.

## Free deployment
### Supabase
1. Create a project at https://supabase.com.
2. Go to SQL Editor > New query.
3. Copy all of `schema.sql`, paste it and run.
4. In project API settings, copy the Project URL and publishable key (or legacy anon/public key). Never use `service_role` or a secret key in the browser.
5. In Authentication > URL Configuration, set Site URL and Redirect URL to the full GitHub Pages app URL.

### GitHub Pages
1. Create a repository at https://github.com/new. For GitHub Free Pages, use a public repository.
2. Upload `index.html`, `manifest.json`, `sw.js`, `icon.svg`, and optionally `README.md` to the repository root. `schema.sql` can be kept there but is not needed by the website.
3. Repository Settings > Pages > Deploy from a branch > `main` > `/(root)` > Save.
4. Wait for publishing and open the exact URL GitHub displays.
5. In the app's Settings > Cloud sync, enter Supabase URL and publishable/anon key and save.
6. Each user creates their own account and taps Sync now.

## Daily workflow
- Enter steps manually from the phone's step counter; Health Connect / Google Fit auto-import is not included.
- Add job opportunities as soon as you find them, even as Wishlist.
- Set a follow-up date and a next action for every active application.
- After recruiter calls/interviews, update the status and notes.
- Use weekly career actions to make progress on resume tailoring, networking, interview practice and skills.
- Export JSON backups regularly.

## Limitations and privacy
- Cloud sync is per-account, but the local browser cache in this version is device/browser-local and not encrypted or separately partitioned by account. Separate phones/browser profiles are recommended for two people.
- App source is visible if hosted in a public GitHub repository. Do not put passwords, secret keys, or private notes in the repository.
- Never paste a Supabase service-role/secret key into the app.
- Provider free-tier policies, inactivity pauses and backup terms can change. Keep your own exports.
- Avoid storing identity documents, passwords, or other highly sensitive personal data in job notes.
