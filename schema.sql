-- Cockpit : une seule table, une ligne par objet (projet, tâche, routine, méta).
-- À coller dans Supabase → SQL Editor → Run.
create table if not exists public.entries (
  id text primary key,
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  col text not null check (col in ('projects','items','routines','meta')),
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);
create index if not exists entries_user_idx on public.entries(user_id);

-- Sécurité : chacun ne voit et ne modifie que SES lignes.
alter table public.entries enable row level security;
drop policy if exists "own rows" on public.entries;
create policy "own rows" on public.entries
  for all to authenticated
  using (user_id = auth.uid())
  with check (user_id = auth.uid());

-- Temps réel (le Mac voit ce que le téléphone vient d'écrire, et inversement).
alter publication supabase_realtime add table public.entries;
