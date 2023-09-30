ALTER TABLE IF EXISTS public.characters
ADD COLUMN IF NOT EXISTS song_limit timestamp without time zone;