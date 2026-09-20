create table if not exists public.camp_state (id integer primary key,data jsonb not null,updated_by uuid references auth.users(id),updated_at timestamptz not null default now());
create table if not exists public.activity_log (id bigint generated always as identity primary key,actor_user_id uuid not null references auth.users(id),actor_email text,action text not null,created_at timestamptz not null default now());
alter table public.camp_state enable row level security;
alter table public.activity_log enable row level security;
create policy "signed in users read plan" on public.camp_state for select to authenticated using (true);
create policy "signed in users create plan" on public.camp_state for insert to authenticated with check (updated_by = auth.uid());
create policy "signed in users change plan" on public.camp_state for update to authenticated using (true) with check (updated_by = auth.uid());
create policy "users add own audit records" on public.activity_log for insert to authenticated with check (actor_user_id = auth.uid());
create policy "signed in users read activity" on public.activity_log for select to authenticated using (true);
