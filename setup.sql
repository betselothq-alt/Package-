-- HMA Astra 2 — Supabase setup / repair script
-- Run this in Supabase Dashboard -> SQL Editor.

alter table public.courses add column if not exists instructor text;
alter table public.sessions add column if not exists end_at timestamptz;

create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into public.profiles (id, full_name, email, role)
  values (
    new.id,
    coalesce(new.raw_user_meta_data->>'full_name', split_part(coalesce(new.email,''), '@', 1), 'Member'),
    new.email,
    'Member'
  )
  on conflict (id) do update set
    email = excluded.email,
    full_name = coalesce(nullif(public.profiles.full_name,''), excluded.full_name);
  return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
after insert on auth.users
for each row execute function public.handle_new_user();

-- If you have already registered your first account, replace the email below
-- and run this once to make that account the initial Admin.
-- update public.profiles set role = 'Admin' where email = 'YOUR_EMAIL_HERE';
