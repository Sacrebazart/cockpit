# Cockpit

App perso d'organisation : boîte de réception, 3 projets max en cours, vie quotidienne, routines, revue du dimanche.
Un seul fichier (`index.html`). Données dans ton Supabase, protégées par ton login.

## Mise en place (une fois)
1. Supabase → nouveau projet → SQL Editor → coller `schema.sql` → Run, puis `schema-storage.sql` → Run (images des listes).
2. Supabase → Authentication → Providers → Email : laisser activé.
   (Optionnel : décocher « Confirm email » pour éviter l'étape de confirmation.)
3. Supabase → Settings → API : noter l'URL du projet et la clé `anon`.
4. Ouvrir l'app, coller URL + clé, créer ton compte, c'est parti.

## Mac
Double-clic sur `Ouvrir Cockpit.command` (ou ouvrir `index.html` directement).

## Téléphone
Ouvrir l'adresse GitHub Pages, puis « Ajouter à l'écran d'accueil ».
