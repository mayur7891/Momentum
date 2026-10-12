-- Momentum PRO: two-user-ready cloud schema.
-- Each person signs in with their OWN Supabase Auth account.
-- RLS ensures rows are scoped to auth.uid(); do not share one login.
-- Run in Supabase Dashboard > SQL Editor.

create table if not exists public.daily_logs (
  user_id uuid not null references auth.users(id) on delete cascade,
  log_date date not null,
  payload jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (user_id, log_date)
);
alter table public.daily_logs enable row level security;
drop policy if exists "Users can read their own Momentum logs" on public.daily_logs;
create policy "Users can read their own Momentum logs" on public.daily_logs for select to authenticated using (auth.uid() = user_id);
drop policy if exists "Users can insert their own Momentum logs" on public.daily_logs;
create policy "Users can insert their own Momentum logs" on public.daily_logs for insert to authenticated with check (auth.uid() = user_id);
drop policy if exists "Users can update their own Momentum logs" on public.daily_logs;
create policy "Users can update their own Momentum logs" on public.daily_logs for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
drop policy if exists "Users can delete their own Momentum logs" on public.daily_logs;
create policy "Users can delete their own Momentum logs" on public.daily_logs for delete to authenticated using (auth.uid() = user_id);
create index if not exists daily_logs_user_date_idx on public.daily_logs (user_id, log_date desc);

create table if not exists public.job_applications (
  id text primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  payload jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.job_applications enable row level security;
drop policy if exists "Users can read their own job applications" on public.job_applications;
create policy "Users can read their own job applications" on public.job_applications for select to authenticated using (auth.uid() = user_id);
drop policy if exists "Users can insert their own job applications" on public.job_applications;
create policy "Users can insert their own job applications" on public.job_applications for insert to authenticated with check (auth.uid() = user_id);
drop policy if exists "Users can update their own job applications" on public.job_applications;
create policy "Users can update their own job applications" on public.job_applications for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
drop policy if exists "Users can delete their own job applications" on public.job_applications;
create policy "Users can delete their own job applications" on public.job_applications for delete to authenticated using (auth.uid() = user_id);
create index if not exists job_applications_user_updated_idx on public.job_applications (user_id, updated_at desc);

create table if not exists public.career_plans (
  user_id uuid primary key references auth.users(id) on delete cascade,
  payload jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.career_plans enable row level security;
drop policy if exists "Users can read their own career plan" on public.career_plans;
create policy "Users can read their own career plan" on public.career_plans for select to authenticated using (auth.uid() = user_id);
drop policy if exists "Users can insert their own career plan" on public.career_plans;
create policy "Users can insert their own career plan" on public.career_plans for insert to authenticated with check (auth.uid() = user_id);
drop policy if exists "Users can update their own career plan" on public.career_plans;
create policy "Users can update their own career plan" on public.career_plans for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
drop policy if exists "Users can delete their own career plan" on public.career_plans;
create policy "Users can delete their own career plan" on public.career_plans for delete to authenticated using (auth.uid() = user_id);
