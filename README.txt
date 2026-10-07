HMA ASTRA 2 — SUPABASE REBUILD

1. Run setup.sql in Supabase Dashboard -> SQL Editor -> New query -> Run.
2. Upload index.html to your GitHub repository root.
3. Make sure the filename is exactly index.html.
4. GitHub Pages: Settings -> Pages -> Deploy from branch -> main -> / (root).
5. Open the Pages URL.
6. Register with a real email and password (minimum 6 characters).
7. If Confirm email is enabled, open the Supabase confirmation email before signing in.
8. The database trigger automatically creates the new profile as Member.
9. To make the first account Admin, use the commented SQL at the bottom of setup.sql after replacing YOUR_EMAIL_HERE.

IMPORTANT:
- The browser uses only the Supabase publishable key.
- Never put a Supabase service_role/secret key in index.html.
- The reminder table records reminders, but actual outgoing reminder emails require a server-side Edge Function/cron setup.
