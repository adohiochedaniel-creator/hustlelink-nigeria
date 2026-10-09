-- Safe compatibility migration. Run in Supabase SQL Editor.
alter table if exists public.jobs add column if not exists featured boolean not null default false;
alter table if exists public.jobs add column if not exists status text not null default 'open';
alter table if exists public.jobs add column if not exists company text;
alter table if exists public.jobs add column if not exists category text;
alter table if exists public.jobs add column if not exists location text;
alter table if exists public.jobs add column if not exists budget text;
alter table if exists public.applications add column if not exists status text not null default 'pending';
create index if not exists jobs_featured_idx on public.jobs(featured);
create index if not exists jobs_status_created_idx on public.jobs(status,created_at desc);
-- Keep existing RLS policies. Review your existing policies before adding duplicates.
