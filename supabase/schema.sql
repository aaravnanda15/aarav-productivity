-- One row per user holding the whole app state as JSON.
create table if not exists public.evening_state (
  user_id uuid primary key default auth.uid() references auth.users (id) on delete cascade,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.evening_state enable row level security;

-- Each signed-in user can only see and change their own row.
create policy "read own state" on public.evening_state
  for select using (auth.uid() = user_id);
create policy "insert own state" on public.evening_state
  for insert with check (auth.uid() = user_id);
create policy "update own state" on public.evening_state
  for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
