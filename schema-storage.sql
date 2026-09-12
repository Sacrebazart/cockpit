-- Cockpit : stockage des images (bucket privé « images »), chacun ne voit que ses fichiers.
-- À coller dans Supabase → SQL Editor → Run.
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('images', 'images', false, 8388608, array['image/jpeg','image/png','image/gif','image/webp'])
on conflict (id) do nothing;

drop policy if exists "own images" on storage.objects;
create policy "own images" on storage.objects
  for all to authenticated
  using (bucket_id = 'images' and (storage.foldername(name))[1] = auth.uid()::text)
  with check (bucket_id = 'images' and (storage.foldername(name))[1] = auth.uid()::text);
