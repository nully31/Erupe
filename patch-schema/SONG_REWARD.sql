BEGIN;

CREATE TABLE IF NOT EXISTS public.kiju_list
(
    name text,
    description text,
    effect int
);

CREATE TABLE IF NOT EXISTS public.demo_select_kiju
(
    char_id int NOT NULL PRIMARY KEY ,
    effect1 int,
    effect2 int,
    effect3 int,
    effect4 int
);

CREATE TABLE IF NOT EXISTS public.demo_color
(
    char_id int NOT NULL PRIMARY KEY ,
    color_1 int,
    color_2 int,
    color_3 int,
    color_4 int
);

CREATE TABLE IF NOT EXISTS public.demo_reward_song
(
    char_id int NOT NULL PRIMARY KEY ,
    song_limit timestamp without time zone
);

END;