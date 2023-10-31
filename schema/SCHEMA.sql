--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2023-10-31 21:45:17

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 899 (class 1247 OID 16396)
-- Name: event_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.event_type AS ENUM (
    'festa',
    'diva',
    'vs',
    'mezfes'
);


ALTER TYPE public.event_type OWNER TO postgres;

--
-- TOC entry 902 (class 1247 OID 16406)
-- Name: festival_colour; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.festival_colour AS ENUM (
    'none',
    'red',
    'blue'
);


ALTER TYPE public.festival_colour OWNER TO postgres;

--
-- TOC entry 905 (class 1247 OID 16414)
-- Name: guild_application_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.guild_application_type AS ENUM (
    'applied',
    'invited'
);


ALTER TYPE public.guild_application_type OWNER TO postgres;

--
-- TOC entry 908 (class 1247 OID 16420)
-- Name: prize_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.prize_type AS ENUM (
    'personal',
    'guild'
);


ALTER TYPE public.prize_type OWNER TO postgres;

--
-- TOC entry 911 (class 1247 OID 16426)
-- Name: uint16; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.uint16 AS integer
	CONSTRAINT uint16_check CHECK (((VALUE >= 0) AND (VALUE <= 65536)));


ALTER DOMAIN public.uint16 OWNER TO postgres;

--
-- TOC entry 915 (class 1247 OID 16429)
-- Name: uint8; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.uint8 AS smallint
	CONSTRAINT uint8_check CHECK (((VALUE >= 0) AND (VALUE <= 255)));


ALTER DOMAIN public.uint8 OWNER TO postgres;

--
-- TOC entry 288 (class 1255 OID 16431)
-- Name: raviinit(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.raviinit()
    LANGUAGE plpgsql
    AS $$
BEGIN
 
INSERT INTO public.raviregister(
	refid, nextravi, ravistarted, raviposttime, ravitype, maxplayers, ravikilled, carvequest, register1, register2, register3, register4, register5)
	VALUES (12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
	
INSERT INTO public.ravistate(
	refid, phase1hp, phase2hp, phase3hp, phase4hp, phase5hp, phase6hp, phase7hp, phase8hp, phase9hp, unknown1, unknown2, unknown3, unknown4, unknown5, unknown6, unknown7, unknown8, unknown9, unknown10, unknown11, unknown12, unknown13, unknown14, unknown15, unknown16, unknown17, unknown18, unknown19, unknown20, damagemultiplier)
	VALUES (29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
	
INSERT INTO public.ravisupport(
	refid, support1, support2, support3, support4, support5, support6, support7, support8, support9, support10, support11, support12, support13, support14, support15, support16, support17, support18, support19, support20, support21, support22, support23, support24, support25)
	VALUES (25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

    COMMIT;
END;
$$;


ALTER PROCEDURE public.raviinit() OWNER TO postgres;

--
-- TOC entry 297 (class 1255 OID 16432)
-- Name: ravireset(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.ravireset(IN zeroed integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
 
UPDATE public.ravistate
	SET refid=29, phase1hp=zeroed, phase2hp=zeroed, phase3hp=zeroed, phase4hp=zeroed, phase5hp=zeroed, phase6hp=zeroed, phase7hp=zeroed, phase8hp=zeroed, phase9hp=zeroed, unknown1=zeroed, unknown2=zeroed, unknown3=zeroed, unknown4=zeroed, unknown5=zeroed, unknown6=zeroed, unknown7=zeroed, unknown8=zeroed, unknown9=zeroed, unknown10=zeroed, unknown11=zeroed, unknown12=zeroed, unknown13=zeroed, unknown14=zeroed, unknown15=zeroed, unknown16=zeroed, unknown17=zeroed, unknown18=zeroed, unknown19=zeroed, unknown20=zeroed, damagemultiplier=1
	WHERE refid = 29;

UPDATE public.raviregister
	SET refid=12, nextravi=zeroed, ravistarted=zeroed, raviposttime=zeroed, ravitype=zeroed, maxplayers=zeroed, ravikilled=zeroed, carvequest=zeroed, register1=zeroed, register2=zeroed, register3=zeroed, register4=zeroed, register5=zeroed
	WHERE refid = 12;

UPDATE public.ravisupport
	SET refid=25, support1=zeroed, support2=zeroed, support3=zeroed, support4=zeroed, support5=zeroed, support6=zeroed, support7=zeroed, support8=zeroed, support9=zeroed, support10=zeroed, support11=zeroed, support12=zeroed, support13=zeroed, support14=zeroed, support15=zeroed, support16=zeroed, support17=zeroed, support18=zeroed, support19=zeroed, support20=zeroed, support21=zeroed, support22=zeroed, support23=zeroed, support24=zeroed, support25=zeroed
	WHERE refid = 25;

    COMMIT;
END;
$$;


ALTER PROCEDURE public.ravireset(IN zeroed integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 16433)
-- Name: account_sub; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_sub (
    id integer NOT NULL,
    discord_id text,
    erupe_account text,
    erupe_password text,
    date_inscription date,
    country text,
    presentation text
);


ALTER TABLE public.account_sub OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16438)
-- Name: account_auth_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.account_sub ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.account_auth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 211 (class 1259 OID 16439)
-- Name: account_ban; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_ban (
    user_id integer NOT NULL,
    title text,
    reason text,
    date text,
    pass_origin text,
    pass_block text
);


ALTER TABLE public.account_ban OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16444)
-- Name: account_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_history (
    report_id integer NOT NULL,
    user_id integer,
    title text,
    reason text,
    date date
);


ALTER TABLE public.account_history OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16449)
-- Name: account_history_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.account_history ALTER COLUMN report_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.account_history_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 214 (class 1259 OID 16450)
-- Name: account_moderation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_moderation (
    id integer NOT NULL,
    username text,
    password text,
    type text
);


ALTER TABLE public.account_moderation OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16455)
-- Name: account_moderation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.account_moderation ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.account_moderation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 16456)
-- Name: achievements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.achievements (
    id integer NOT NULL,
    ach0 integer DEFAULT 0,
    ach1 integer DEFAULT 0,
    ach2 integer DEFAULT 0,
    ach3 integer DEFAULT 0,
    ach4 integer DEFAULT 0,
    ach5 integer DEFAULT 0,
    ach6 integer DEFAULT 0,
    ach7 integer DEFAULT 0,
    ach8 integer DEFAULT 0,
    ach9 integer DEFAULT 0,
    ach10 integer DEFAULT 0,
    ach11 integer DEFAULT 0,
    ach12 integer DEFAULT 0,
    ach13 integer DEFAULT 0,
    ach14 integer DEFAULT 0,
    ach15 integer DEFAULT 0,
    ach16 integer DEFAULT 0,
    ach17 integer DEFAULT 0,
    ach18 integer DEFAULT 0,
    ach19 integer DEFAULT 0,
    ach20 integer DEFAULT 0,
    ach21 integer DEFAULT 0,
    ach22 integer DEFAULT 0,
    ach23 integer DEFAULT 0,
    ach24 integer DEFAULT 0,
    ach25 integer DEFAULT 0,
    ach26 integer DEFAULT 0,
    ach27 integer DEFAULT 0,
    ach28 integer DEFAULT 0,
    ach29 integer DEFAULT 0,
    ach30 integer DEFAULT 0,
    ach31 integer DEFAULT 0,
    ach32 integer DEFAULT 0
);


ALTER TABLE public.achievements OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16492)
-- Name: airou_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.airou_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.airou_id_seq OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16493)
-- Name: cafe_accepted; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cafe_accepted (
    cafe_id integer NOT NULL,
    character_id integer NOT NULL
);


ALTER TABLE public.cafe_accepted OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16496)
-- Name: cafebonus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cafebonus (
    id integer NOT NULL,
    time_req integer NOT NULL,
    item_type integer NOT NULL,
    item_id integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.cafebonus OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16499)
-- Name: cafebonus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cafebonus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cafebonus_id_seq OWNER TO postgres;

--
-- TOC entry 3774 (class 0 OID 0)
-- Dependencies: 220
-- Name: cafebonus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cafebonus_id_seq OWNED BY public.cafebonus.id;


--
-- TOC entry 221 (class 1259 OID 16500)
-- Name: characters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.characters (
    id integer NOT NULL,
    user_id bigint,
    is_female boolean,
    is_new_character boolean,
    name character varying(15),
    unk_desc_string character varying(31),
    gr public.uint16,
    hrp public.uint16,
    weapon_type public.uint16,
    last_login integer,
    savedata bytea,
    decomyset bytea,
    hunternavi bytea,
    otomoairou bytea,
    partner bytea,
    platebox bytea,
    platedata bytea,
    platemyset bytea,
    rengokudata bytea,
    savemercenary bytea,
    restrict_guild_scout boolean DEFAULT false NOT NULL,
    minidata bytea,
    gacha_trial integer,
    gacha_prem integer,
    gacha_items bytea,
    daily_time timestamp without time zone,
    frontier_points integer,
    house_info bytea,
    login_boost bytea,
    skin_hist bytea,
    kouryou_point integer,
    gcp integer,
    guild_post_checked timestamp without time zone DEFAULT now() NOT NULL,
    time_played integer DEFAULT 0 NOT NULL,
    weapon_id integer DEFAULT 0 NOT NULL,
    house bytea,
    scenariodata bytea,
    savefavoritequest bytea,
    friends text DEFAULT ''::text NOT NULL,
    blocked text DEFAULT ''::text NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    cafe_time integer DEFAULT 0,
    netcafe_points integer DEFAULT 0,
    boost_time timestamp without time zone,
    song_limit timestamp without time zone
);


ALTER TABLE public.characters OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16514)
-- Name: characters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.characters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.characters_id_seq OWNER TO postgres;

--
-- TOC entry 3775 (class 0 OID 0)
-- Dependencies: 222
-- Name: characters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.characters_id_seq OWNED BY public.characters.id;


--
-- TOC entry 223 (class 1259 OID 16515)
-- Name: demo_color; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.demo_color (
    char_id integer NOT NULL,
    color_1 integer,
    color_2 integer,
    color_3 integer,
    color_4 integer
);


ALTER TABLE public.demo_color OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16518)
-- Name: demo_reward_song; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.demo_reward_song (
    char_id integer NOT NULL,
    song_limit timestamp without time zone
);


ALTER TABLE public.demo_reward_song OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16521)
-- Name: demo_select_kiju; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.demo_select_kiju (
    char_id integer NOT NULL,
    effect1 integer,
    effect2 integer,
    effect3 integer,
    effect4 integer
);


ALTER TABLE public.demo_select_kiju OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16524)
-- Name: distribution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.distribution (
    id integer NOT NULL,
    character_id integer,
    type integer NOT NULL,
    deadline timestamp without time zone,
    event_name text DEFAULT 'GM Gift!'::text NOT NULL,
    description text DEFAULT '~C05You received a gift!'::text NOT NULL,
    times_acceptable integer DEFAULT 1 NOT NULL,
    min_hr integer DEFAULT 65535 NOT NULL,
    max_hr integer DEFAULT 65535 NOT NULL,
    min_sr integer DEFAULT 65535 NOT NULL,
    max_sr integer DEFAULT 65535 NOT NULL,
    min_gr integer DEFAULT 65535 NOT NULL,
    max_gr integer DEFAULT 65535 NOT NULL,
    data bytea NOT NULL
);


ALTER TABLE public.distribution OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16538)
-- Name: distribution_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.distribution_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.distribution_id_seq OWNER TO postgres;

--
-- TOC entry 3776 (class 0 OID 0)
-- Dependencies: 227
-- Name: distribution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.distribution_id_seq OWNED BY public.distribution.id;


--
-- TOC entry 228 (class 1259 OID 16539)
-- Name: distributions_accepted; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.distributions_accepted (
    distribution_id integer,
    character_id integer
);


ALTER TABLE public.distributions_accepted OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16542)
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id integer NOT NULL,
    event_type public.event_type NOT NULL,
    start_time timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.events OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16546)
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO postgres;

--
-- TOC entry 3777 (class 0 OID 0)
-- Dependencies: 230
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- TOC entry 231 (class 1259 OID 16547)
-- Name: festa_prizes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.festa_prizes (
    id integer NOT NULL,
    type public.prize_type NOT NULL,
    tier integer NOT NULL,
    souls_req integer NOT NULL,
    item_id integer NOT NULL,
    num_item integer NOT NULL
);


ALTER TABLE public.festa_prizes OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16550)
-- Name: festa_prizes_accepted; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.festa_prizes_accepted (
    prize_id integer NOT NULL,
    character_id integer NOT NULL
);


ALTER TABLE public.festa_prizes_accepted OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16553)
-- Name: festa_prizes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.festa_prizes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.festa_prizes_id_seq OWNER TO postgres;

--
-- TOC entry 3778 (class 0 OID 0)
-- Dependencies: 233
-- Name: festa_prizes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.festa_prizes_id_seq OWNED BY public.festa_prizes.id;


--
-- TOC entry 234 (class 1259 OID 16554)
-- Name: festa_registrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.festa_registrations (
    guild_id integer NOT NULL,
    team public.festival_colour NOT NULL
);


ALTER TABLE public.festa_registrations OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16557)
-- Name: festa_trials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.festa_trials (
    id integer NOT NULL,
    objective integer NOT NULL,
    goal_id integer NOT NULL,
    times_req integer NOT NULL,
    locale_req integer DEFAULT 0 NOT NULL,
    reward integer NOT NULL
);


ALTER TABLE public.festa_trials OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16561)
-- Name: festa_trials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.festa_trials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.festa_trials_id_seq OWNER TO postgres;

--
-- TOC entry 3779 (class 0 OID 0)
-- Dependencies: 236
-- Name: festa_trials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.festa_trials_id_seq OWNED BY public.festa_trials.id;


--
-- TOC entry 237 (class 1259 OID 16562)
-- Name: fpoint_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fpoint_items (
    hash integer,
    itemtype public.uint8,
    itemid public.uint16,
    quant public.uint16,
    itemvalue public.uint16,
    tradetype public.uint8
);


ALTER TABLE public.fpoint_items OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16565)
-- Name: gacha_shop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gacha_shop (
    hash bigint NOT NULL,
    reqgr integer NOT NULL,
    reqhr integer NOT NULL,
    gachaname character varying(255) NOT NULL,
    gachalink0 character varying(255) NOT NULL,
    gachalink1 character varying(255) NOT NULL,
    gachalink2 character varying(255) NOT NULL,
    extraicon integer NOT NULL,
    gachatype integer NOT NULL,
    hideflag boolean NOT NULL
);


ALTER TABLE public.gacha_shop OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16570)
-- Name: gacha_shop_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gacha_shop_items (
    shophash integer,
    entrytype public.uint8,
    itemhash integer NOT NULL,
    currtype public.uint8,
    currnumber public.uint16,
    currquant public.uint16,
    percentage public.uint16,
    rarityicon public.uint8,
    rollscount public.uint8,
    itemcount public.uint8,
    dailylimit public.uint8,
    itemtype integer[],
    itemid integer[],
    quantity integer[]
);


ALTER TABLE public.gacha_shop_items OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16575)
-- Name: gook; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gook (
    id integer NOT NULL,
    gook0 bytea,
    gook1 bytea,
    gook2 bytea,
    gook3 bytea,
    gook4 bytea
);


ALTER TABLE public.gook OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16580)
-- Name: gook_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gook_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gook_id_seq OWNER TO postgres;

--
-- TOC entry 3780 (class 0 OID 0)
-- Dependencies: 241
-- Name: gook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gook_id_seq OWNED BY public.gook.id;


--
-- TOC entry 242 (class 1259 OID 16581)
-- Name: guild_adventures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guild_adventures (
    id integer NOT NULL,
    guild_id integer NOT NULL,
    destination integer NOT NULL,
    charge integer DEFAULT 0 NOT NULL,
    depart integer NOT NULL,
    return integer NOT NULL,
    collected_by text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.guild_adventures OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16588)
-- Name: guild_adventures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guild_adventures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guild_adventures_id_seq OWNER TO postgres;

--
-- TOC entry 3781 (class 0 OID 0)
-- Dependencies: 243
-- Name: guild_adventures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guild_adventures_id_seq OWNED BY public.guild_adventures.id;


--
-- TOC entry 244 (class 1259 OID 16589)
-- Name: guild_alliances; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guild_alliances (
    id integer NOT NULL,
    name character varying(24) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    parent_id integer NOT NULL,
    sub1_id integer,
    sub2_id integer
);


ALTER TABLE public.guild_alliances OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 16593)
-- Name: guild_alliances_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guild_alliances_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guild_alliances_id_seq OWNER TO postgres;

--
-- TOC entry 3782 (class 0 OID 0)
-- Dependencies: 245
-- Name: guild_alliances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guild_alliances_id_seq OWNED BY public.guild_alliances.id;


--
-- TOC entry 246 (class 1259 OID 16594)
-- Name: guild_applications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guild_applications (
    id integer NOT NULL,
    guild_id integer NOT NULL,
    character_id integer NOT NULL,
    actor_id integer NOT NULL,
    application_type public.guild_application_type NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.guild_applications OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 16598)
-- Name: guild_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guild_applications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guild_applications_id_seq OWNER TO postgres;

--
-- TOC entry 3783 (class 0 OID 0)
-- Dependencies: 247
-- Name: guild_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guild_applications_id_seq OWNED BY public.guild_applications.id;


--
-- TOC entry 248 (class 1259 OID 16599)
-- Name: guild_characters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guild_characters (
    id integer NOT NULL,
    guild_id bigint,
    character_id bigint,
    joined_at timestamp without time zone DEFAULT now(),
    avoid_leadership boolean DEFAULT false NOT NULL,
    order_index integer DEFAULT 1 NOT NULL,
    souls integer DEFAULT 0,
    recruiter boolean DEFAULT false NOT NULL
);


ALTER TABLE public.guild_characters OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 16607)
-- Name: guild_characters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guild_characters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guild_characters_id_seq OWNER TO postgres;

--
-- TOC entry 3784 (class 0 OID 0)
-- Dependencies: 249
-- Name: guild_characters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guild_characters_id_seq OWNED BY public.guild_characters.id;


--
-- TOC entry 250 (class 1259 OID 16608)
-- Name: guild_hunts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guild_hunts (
    id integer NOT NULL,
    guild_id integer NOT NULL,
    host_id integer NOT NULL,
    destination integer NOT NULL,
    level integer NOT NULL,
    return integer NOT NULL,
    acquired boolean DEFAULT false NOT NULL,
    claimed boolean DEFAULT false NOT NULL,
    hunters text DEFAULT ''::text NOT NULL,
    treasure text DEFAULT ''::text NOT NULL,
    hunt_data bytea NOT NULL,
    cats_used text NOT NULL
);


ALTER TABLE public.guild_hunts OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 16617)
-- Name: guild_hunts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guild_hunts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guild_hunts_id_seq OWNER TO postgres;

--
-- TOC entry 3785 (class 0 OID 0)
-- Dependencies: 251
-- Name: guild_hunts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guild_hunts_id_seq OWNED BY public.guild_hunts.id;


--
-- TOC entry 252 (class 1259 OID 16618)
-- Name: guild_meals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guild_meals (
    id integer NOT NULL,
    guild_id integer NOT NULL,
    meal_id integer NOT NULL,
    level integer NOT NULL,
    expires integer NOT NULL
);


ALTER TABLE public.guild_meals OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 16621)
-- Name: guild_meals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guild_meals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guild_meals_id_seq OWNER TO postgres;

--
-- TOC entry 3786 (class 0 OID 0)
-- Dependencies: 253
-- Name: guild_meals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guild_meals_id_seq OWNED BY public.guild_meals.id;


--
-- TOC entry 254 (class 1259 OID 16622)
-- Name: guild_posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guild_posts (
    id integer NOT NULL,
    guild_id integer NOT NULL,
    author_id integer NOT NULL,
    post_type integer NOT NULL,
    stamp_id integer NOT NULL,
    title text NOT NULL,
    body text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    liked_by text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.guild_posts OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 16629)
-- Name: guild_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guild_posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guild_posts_id_seq OWNER TO postgres;

--
-- TOC entry 3787 (class 0 OID 0)
-- Dependencies: 255
-- Name: guild_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guild_posts_id_seq OWNED BY public.guild_posts.id;


--
-- TOC entry 256 (class 1259 OID 16630)
-- Name: guilds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guilds (
    id integer NOT NULL,
    name character varying(24),
    created_at timestamp without time zone DEFAULT now(),
    leader_id integer NOT NULL,
    main_motto integer DEFAULT 0,
    rank_rp integer DEFAULT 0 NOT NULL,
    comment character varying(255) DEFAULT ''::character varying NOT NULL,
    icon bytea,
    sub_motto integer DEFAULT 0,
    item_box bytea,
    event_rp integer DEFAULT 0 NOT NULL,
    pugi_name_1 character varying(12) DEFAULT ''::character varying,
    pugi_name_2 character varying(12) DEFAULT ''::character varying,
    pugi_name_3 character varying(12) DEFAULT ''::character varying,
    recruiting boolean DEFAULT true NOT NULL
);


ALTER TABLE public.guilds OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 16645)
-- Name: guilds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guilds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guilds_id_seq OWNER TO postgres;

--
-- TOC entry 3788 (class 0 OID 0)
-- Dependencies: 257
-- Name: guilds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guilds_id_seq OWNED BY public.guilds.id;


--
-- TOC entry 258 (class 1259 OID 16646)
-- Name: history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.history (
    user_id integer,
    admin_id integer,
    report_id integer NOT NULL,
    title text,
    reason text
);


ALTER TABLE public.history OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 16651)
-- Name: kiju_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kiju_list (
    name text,
    description text,
    effect integer
);


ALTER TABLE public.kiju_list OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 16656)
-- Name: login_boost_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login_boost_state (
    char_id bigint NOT NULL,
    week_req public.uint8 NOT NULL,
    week_count public.uint8 NOT NULL,
    available boolean NOT NULL,
    end_time integer NOT NULL
);


ALTER TABLE public.login_boost_state OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 16659)
-- Name: lucky_box_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lucky_box_state (
    char_id bigint,
    shophash integer NOT NULL,
    used_itemhash integer[]
);


ALTER TABLE public.lucky_box_state OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 16664)
-- Name: mail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mail (
    id integer NOT NULL,
    sender_id integer NOT NULL,
    recipient_id integer NOT NULL,
    subject character varying DEFAULT ''::character varying NOT NULL,
    body character varying DEFAULT ''::character varying NOT NULL,
    read boolean DEFAULT false NOT NULL,
    attached_item_received boolean DEFAULT false NOT NULL,
    attached_item integer,
    attached_item_amount integer DEFAULT 1 NOT NULL,
    is_guild_invite boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    is_sys_message boolean DEFAULT false,
    locked boolean DEFAULT false NOT NULL
);


ALTER TABLE public.mail OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 16679)
-- Name: mail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mail_id_seq OWNER TO postgres;

--
-- TOC entry 3789 (class 0 OID 0)
-- Dependencies: 263
-- Name: mail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mail_id_seq OWNED BY public.mail.id;


--
-- TOC entry 264 (class 1259 OID 16680)
-- Name: normal_shop_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.normal_shop_items (
    shoptype integer,
    shopid integer,
    itemhash integer NOT NULL,
    itemid public.uint16,
    points public.uint16,
    tradequantity public.uint16,
    rankreqlow public.uint16,
    rankreqhigh public.uint16,
    rankreqg public.uint16,
    storelevelreq public.uint16,
    maximumquantity public.uint16,
    boughtquantity public.uint16,
    roadfloorsrequired public.uint16,
    weeklyfataliskills public.uint16
);


ALTER TABLE public.normal_shop_items OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 16683)
-- Name: questlists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questlists (
    ind integer NOT NULL,
    questlist bytea
);


ALTER TABLE public.questlists OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 16688)
-- Name: rasta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rasta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rasta_id_seq OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 16689)
-- Name: raviregister; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raviregister (
    id integer NOT NULL,
    refid integer NOT NULL,
    nextravi integer NOT NULL,
    ravistarted integer,
    raviposttime integer,
    ravitype integer,
    maxplayers integer,
    ravikilled integer,
    carvequest integer,
    register1 integer,
    register2 integer,
    register3 integer,
    register4 integer,
    register5 integer
);


ALTER TABLE public.raviregister OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 16692)
-- Name: raviregister_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.raviregister_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.raviregister_id_seq OWNER TO postgres;

--
-- TOC entry 3790 (class 0 OID 0)
-- Dependencies: 268
-- Name: raviregister_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.raviregister_id_seq OWNED BY public.raviregister.id;


--
-- TOC entry 269 (class 1259 OID 16693)
-- Name: ravistate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ravistate (
    id integer NOT NULL,
    refid integer NOT NULL,
    phase1hp integer NOT NULL,
    phase2hp integer,
    phase3hp integer,
    phase4hp integer,
    phase5hp integer,
    phase6hp integer,
    phase7hp integer,
    phase8hp integer,
    phase9hp integer,
    unknown1 integer,
    unknown2 integer,
    unknown3 integer,
    unknown4 integer,
    unknown5 integer,
    unknown6 integer,
    unknown7 integer,
    unknown8 integer,
    unknown9 integer,
    unknown10 integer,
    unknown11 integer,
    unknown12 integer,
    unknown13 integer,
    unknown14 integer,
    unknown15 integer,
    unknown16 integer,
    unknown17 integer,
    unknown18 integer,
    unknown19 integer,
    unknown20 integer,
    damagemultiplier integer
);


ALTER TABLE public.ravistate OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 16696)
-- Name: ravistate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ravistate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.ravistate_id_seq OWNER TO postgres;

--
-- TOC entry 3791 (class 0 OID 0)
-- Dependencies: 270
-- Name: ravistate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ravistate_id_seq OWNED BY public.ravistate.id;


--
-- TOC entry 271 (class 1259 OID 16697)
-- Name: ravisupport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ravisupport (
    id integer NOT NULL,
    refid integer NOT NULL,
    support1 integer NOT NULL,
    support2 integer,
    support3 integer,
    support4 integer,
    support5 integer,
    support6 integer,
    support7 integer,
    support8 integer,
    support9 integer,
    support10 integer,
    support11 integer,
    support12 integer,
    support13 integer,
    support14 integer,
    support15 integer,
    support16 integer,
    support17 integer,
    support18 integer,
    support19 integer,
    support20 integer,
    support21 integer,
    support22 integer,
    support23 integer,
    support24 integer,
    support25 integer
);


ALTER TABLE public.ravisupport OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 16700)
-- Name: ravisupport_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ravisupport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.ravisupport_id_seq OWNER TO postgres;

--
-- TOC entry 3792 (class 0 OID 0)
-- Dependencies: 272
-- Name: ravisupport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ravisupport_id_seq OWNED BY public.ravisupport.id;


--
-- TOC entry 273 (class 1259 OID 16701)
-- Name: rengoku_score; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rengoku_score (
    character_id integer NOT NULL,
    max_stages_mp integer,
    max_points_mp integer,
    max_stages_sp integer,
    max_points_sp integer
);


ALTER TABLE public.rengoku_score OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 16704)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    dirty boolean NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 16707)
-- Name: servers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servers (
    server_id integer NOT NULL,
    season integer NOT NULL,
    current_players integer NOT NULL,
    land integer,
    world_name text,
    world_description text
);


ALTER TABLE public.servers OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 16712)
-- Name: shop_item_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_item_state (
    char_id bigint,
    itemhash integer NOT NULL,
    usedquantity integer
);


ALTER TABLE public.shop_item_state OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 16715)
-- Name: sign_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sign_sessions (
    user_id integer NOT NULL,
    char_id integer,
    token character varying(16) NOT NULL,
    server_id integer
);


ALTER TABLE public.sign_sessions OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 16718)
-- Name: stamps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stamps (
    character_id integer NOT NULL,
    hl_total integer DEFAULT 0,
    hl_redeemed integer DEFAULT 0,
    hl_next timestamp without time zone,
    ex_total integer DEFAULT 0,
    ex_redeemed integer DEFAULT 0,
    ex_next timestamp without time zone
);


ALTER TABLE public.stamps OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 16725)
-- Name: stepup_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stepup_state (
    char_id bigint,
    shophash integer NOT NULL,
    step_progression integer,
    step_time timestamp without time zone
);


ALTER TABLE public.stepup_state OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 16728)
-- Name: titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.titles (
    id integer NOT NULL,
    char_id integer NOT NULL,
    unlocked_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.titles OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 16731)
-- Name: user_binaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_binaries (
    id integer NOT NULL,
    type2 bytea,
    type3 bytea
);


ALTER TABLE public.user_binaries OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 16736)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    item_box bytea,
    rights integer DEFAULT 14 NOT NULL,
    last_character integer DEFAULT 0,
    last_login timestamp without time zone,
    return_expires timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 16743)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3793 (class 0 OID 0)
-- Dependencies: 283
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 284 (class 1259 OID 16744)
-- Name: warehouse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warehouse (
    character_id integer NOT NULL,
    item0 bytea,
    item1 bytea,
    item2 bytea,
    item3 bytea,
    item4 bytea,
    item5 bytea,
    item6 bytea,
    item7 bytea,
    item8 bytea,
    item9 bytea,
    item10 bytea,
    item0name text,
    item1name text,
    item2name text,
    item3name text,
    item4name text,
    item5name text,
    item6name text,
    item7name text,
    item8name text,
    item9name text,
    equip0 bytea,
    equip1 bytea,
    equip2 bytea,
    equip3 bytea,
    equip4 bytea,
    equip5 bytea,
    equip6 bytea,
    equip7 bytea,
    equip8 bytea,
    equip9 bytea,
    equip10 bytea,
    equip0name text,
    equip1name text,
    equip2name text,
    equip3name text,
    equip4name text,
    equip5name text,
    equip6name text,
    equip7name text,
    equip8name text,
    equip9name text
);


ALTER TABLE public.warehouse OWNER TO postgres;

--
-- TOC entry 3443 (class 2604 OID 16749)
-- Name: cafebonus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cafebonus ALTER COLUMN id SET DEFAULT nextval('public.cafebonus_id_seq'::regclass);


--
-- TOC entry 3453 (class 2604 OID 16750)
-- Name: characters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters ALTER COLUMN id SET DEFAULT nextval('public.characters_id_seq'::regclass);


--
-- TOC entry 3463 (class 2604 OID 16751)
-- Name: distribution id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.distribution ALTER COLUMN id SET DEFAULT nextval('public.distribution_id_seq'::regclass);


--
-- TOC entry 3465 (class 2604 OID 16752)
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- TOC entry 3466 (class 2604 OID 16753)
-- Name: festa_prizes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.festa_prizes ALTER COLUMN id SET DEFAULT nextval('public.festa_prizes_id_seq'::regclass);


--
-- TOC entry 3468 (class 2604 OID 16754)
-- Name: festa_trials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.festa_trials ALTER COLUMN id SET DEFAULT nextval('public.festa_trials_id_seq'::regclass);


--
-- TOC entry 3469 (class 2604 OID 16755)
-- Name: gook id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gook ALTER COLUMN id SET DEFAULT nextval('public.gook_id_seq'::regclass);


--
-- TOC entry 3472 (class 2604 OID 16756)
-- Name: guild_adventures id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_adventures ALTER COLUMN id SET DEFAULT nextval('public.guild_adventures_id_seq'::regclass);


--
-- TOC entry 3474 (class 2604 OID 16757)
-- Name: guild_alliances id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_alliances ALTER COLUMN id SET DEFAULT nextval('public.guild_alliances_id_seq'::regclass);


--
-- TOC entry 3476 (class 2604 OID 16758)
-- Name: guild_applications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_applications ALTER COLUMN id SET DEFAULT nextval('public.guild_applications_id_seq'::regclass);


--
-- TOC entry 3482 (class 2604 OID 16759)
-- Name: guild_characters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_characters ALTER COLUMN id SET DEFAULT nextval('public.guild_characters_id_seq'::regclass);


--
-- TOC entry 3487 (class 2604 OID 16760)
-- Name: guild_hunts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_hunts ALTER COLUMN id SET DEFAULT nextval('public.guild_hunts_id_seq'::regclass);


--
-- TOC entry 3488 (class 2604 OID 16761)
-- Name: guild_meals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_meals ALTER COLUMN id SET DEFAULT nextval('public.guild_meals_id_seq'::regclass);


--
-- TOC entry 3491 (class 2604 OID 16762)
-- Name: guild_posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_posts ALTER COLUMN id SET DEFAULT nextval('public.guild_posts_id_seq'::regclass);


--
-- TOC entry 3502 (class 2604 OID 16763)
-- Name: guilds id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guilds ALTER COLUMN id SET DEFAULT nextval('public.guilds_id_seq'::regclass);


--
-- TOC entry 3513 (class 2604 OID 16764)
-- Name: mail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail ALTER COLUMN id SET DEFAULT nextval('public.mail_id_seq'::regclass);


--
-- TOC entry 3514 (class 2604 OID 16765)
-- Name: raviregister id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raviregister ALTER COLUMN id SET DEFAULT nextval('public.raviregister_id_seq'::regclass);


--
-- TOC entry 3515 (class 2604 OID 16766)
-- Name: ravistate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ravistate ALTER COLUMN id SET DEFAULT nextval('public.ravistate_id_seq'::regclass);


--
-- TOC entry 3516 (class 2604 OID 16767)
-- Name: ravisupport id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ravisupport ALTER COLUMN id SET DEFAULT nextval('public.ravisupport_id_seq'::regclass);


--
-- TOC entry 3523 (class 2604 OID 16768)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3525 (class 2606 OID 16773)
-- Name: account_sub account_auth_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_sub
    ADD CONSTRAINT account_auth_pkey PRIMARY KEY (id);


--
-- TOC entry 3529 (class 2606 OID 16775)
-- Name: account_history account_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_history
    ADD CONSTRAINT account_history_pkey PRIMARY KEY (report_id);


--
-- TOC entry 3531 (class 2606 OID 16777)
-- Name: account_moderation account_moderation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_moderation
    ADD CONSTRAINT account_moderation_pkey PRIMARY KEY (id);


--
-- TOC entry 3533 (class 2606 OID 16779)
-- Name: achievements achievements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achievements
    ADD CONSTRAINT achievements_pkey PRIMARY KEY (id);


--
-- TOC entry 3527 (class 2606 OID 16781)
-- Name: account_ban ban_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_ban
    ADD CONSTRAINT ban_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3535 (class 2606 OID 16783)
-- Name: cafebonus cafebonus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cafebonus
    ADD CONSTRAINT cafebonus_pkey PRIMARY KEY (id);


--
-- TOC entry 3537 (class 2606 OID 16785)
-- Name: characters characters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_pkey PRIMARY KEY (id);


--
-- TOC entry 3539 (class 2606 OID 16787)
-- Name: demo_color demo_color_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.demo_color
    ADD CONSTRAINT demo_color_pkey PRIMARY KEY (char_id);


--
-- TOC entry 3541 (class 2606 OID 16789)
-- Name: demo_reward_song demo_reward_song_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.demo_reward_song
    ADD CONSTRAINT demo_reward_song_pkey PRIMARY KEY (char_id);


--
-- TOC entry 3543 (class 2606 OID 16791)
-- Name: demo_select_kiju demo_select_kiju_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.demo_select_kiju
    ADD CONSTRAINT demo_select_kiju_pkey PRIMARY KEY (char_id);


--
-- TOC entry 3545 (class 2606 OID 16793)
-- Name: distribution distribution_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.distribution
    ADD CONSTRAINT distribution_pkey PRIMARY KEY (id);


--
-- TOC entry 3547 (class 2606 OID 16795)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- TOC entry 3549 (class 2606 OID 16797)
-- Name: festa_prizes festa_prizes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.festa_prizes
    ADD CONSTRAINT festa_prizes_pkey PRIMARY KEY (id);


--
-- TOC entry 3551 (class 2606 OID 16799)
-- Name: festa_trials festa_trials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.festa_trials
    ADD CONSTRAINT festa_trials_pkey PRIMARY KEY (id);


--
-- TOC entry 3555 (class 2606 OID 16801)
-- Name: gacha_shop_items gacha_shop_items_itemhash_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gacha_shop_items
    ADD CONSTRAINT gacha_shop_items_itemhash_key UNIQUE (itemhash);


--
-- TOC entry 3553 (class 2606 OID 16803)
-- Name: gacha_shop gacha_shop_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gacha_shop
    ADD CONSTRAINT gacha_shop_pkey PRIMARY KEY (hash, reqgr, reqhr, gachaname, gachalink0, gachalink1, gachalink2, extraicon, gachatype, hideflag);


--
-- TOC entry 3557 (class 2606 OID 16805)
-- Name: gook gook_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gook
    ADD CONSTRAINT gook_pkey PRIMARY KEY (id);


--
-- TOC entry 3559 (class 2606 OID 16807)
-- Name: guild_adventures guild_adventures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_adventures
    ADD CONSTRAINT guild_adventures_pkey PRIMARY KEY (id);


--
-- TOC entry 3561 (class 2606 OID 16809)
-- Name: guild_alliances guild_alliances_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_alliances
    ADD CONSTRAINT guild_alliances_pkey PRIMARY KEY (id);


--
-- TOC entry 3563 (class 2606 OID 16811)
-- Name: guild_applications guild_application_character_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_applications
    ADD CONSTRAINT guild_application_character_id UNIQUE (guild_id, character_id);


--
-- TOC entry 3566 (class 2606 OID 16813)
-- Name: guild_applications guild_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_applications
    ADD CONSTRAINT guild_applications_pkey PRIMARY KEY (id);


--
-- TOC entry 3569 (class 2606 OID 16815)
-- Name: guild_characters guild_characters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_characters
    ADD CONSTRAINT guild_characters_pkey PRIMARY KEY (id);


--
-- TOC entry 3571 (class 2606 OID 16817)
-- Name: guild_hunts guild_hunts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_hunts
    ADD CONSTRAINT guild_hunts_pkey PRIMARY KEY (id);


--
-- TOC entry 3573 (class 2606 OID 16819)
-- Name: guild_meals guild_meals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_meals
    ADD CONSTRAINT guild_meals_pkey PRIMARY KEY (id);


--
-- TOC entry 3575 (class 2606 OID 16821)
-- Name: guild_posts guild_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_posts
    ADD CONSTRAINT guild_posts_pkey PRIMARY KEY (id);


--
-- TOC entry 3577 (class 2606 OID 16823)
-- Name: guilds guilds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guilds
    ADD CONSTRAINT guilds_pkey PRIMARY KEY (id);


--
-- TOC entry 3579 (class 2606 OID 16825)
-- Name: history history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_pkey PRIMARY KEY (report_id);


--
-- TOC entry 3581 (class 2606 OID 16827)
-- Name: login_boost_state id_week; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_boost_state
    ADD CONSTRAINT id_week UNIQUE (char_id, week_req);


--
-- TOC entry 3583 (class 2606 OID 16829)
-- Name: login_boost_state login_boost_state_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_boost_state
    ADD CONSTRAINT login_boost_state_pkey PRIMARY KEY (char_id, week_req, available, end_time, week_count);


--
-- TOC entry 3585 (class 2606 OID 16831)
-- Name: lucky_box_state lucky_box_state_id_shophash; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lucky_box_state
    ADD CONSTRAINT lucky_box_state_id_shophash UNIQUE (char_id, shophash);


--
-- TOC entry 3587 (class 2606 OID 16833)
-- Name: mail mail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail
    ADD CONSTRAINT mail_pkey PRIMARY KEY (id);


--
-- TOC entry 3590 (class 2606 OID 16835)
-- Name: normal_shop_items normal_shop_items_itemhash_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.normal_shop_items
    ADD CONSTRAINT normal_shop_items_itemhash_key UNIQUE (itemhash);


--
-- TOC entry 3592 (class 2606 OID 16837)
-- Name: normal_shop_items normal_shop_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.normal_shop_items
    ADD CONSTRAINT normal_shop_items_pkey PRIMARY KEY (itemhash);


--
-- TOC entry 3594 (class 2606 OID 16839)
-- Name: questlists questlists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questlists
    ADD CONSTRAINT questlists_pkey PRIMARY KEY (ind);


--
-- TOC entry 3596 (class 2606 OID 16841)
-- Name: raviregister raviregister_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raviregister
    ADD CONSTRAINT raviregister_pkey PRIMARY KEY (id);


--
-- TOC entry 3598 (class 2606 OID 16843)
-- Name: ravistate ravistate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ravistate
    ADD CONSTRAINT ravistate_pkey PRIMARY KEY (id);


--
-- TOC entry 3600 (class 2606 OID 16845)
-- Name: ravisupport ravisupport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ravisupport
    ADD CONSTRAINT ravisupport_pkey PRIMARY KEY (id);


--
-- TOC entry 3602 (class 2606 OID 16847)
-- Name: rengoku_score rengoku_score_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rengoku_score
    ADD CONSTRAINT rengoku_score_pkey PRIMARY KEY (character_id);


--
-- TOC entry 3604 (class 2606 OID 16849)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3606 (class 2606 OID 16851)
-- Name: shop_item_state shop_item_state_id_itemhash; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_item_state
    ADD CONSTRAINT shop_item_state_id_itemhash UNIQUE (char_id, itemhash);


--
-- TOC entry 3608 (class 2606 OID 16853)
-- Name: stamps stamps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stamps
    ADD CONSTRAINT stamps_pkey PRIMARY KEY (character_id);


--
-- TOC entry 3610 (class 2606 OID 16855)
-- Name: stepup_state stepup_state_id_shophash; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stepup_state
    ADD CONSTRAINT stepup_state_id_shophash UNIQUE (char_id, shophash);


--
-- TOC entry 3612 (class 2606 OID 16857)
-- Name: user_binaries user_binaries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_binaries
    ADD CONSTRAINT user_binaries_pkey PRIMARY KEY (id);


--
-- TOC entry 3614 (class 2606 OID 16859)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3616 (class 2606 OID 16861)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 3618 (class 2606 OID 16863)
-- Name: warehouse warehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_pkey PRIMARY KEY (character_id);


--
-- TOC entry 3564 (class 1259 OID 16864)
-- Name: guild_application_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guild_application_type_index ON public.guild_applications USING btree (application_type);


--
-- TOC entry 3567 (class 1259 OID 16865)
-- Name: guild_character_unique_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX guild_character_unique_index ON public.guild_characters USING btree (character_id);


--
-- TOC entry 3588 (class 1259 OID 16866)
-- Name: mail_recipient_deleted_created_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_recipient_deleted_created_id_index ON public.mail USING btree (recipient_id, deleted, created_at DESC, id DESC);


--
-- TOC entry 3619 (class 2606 OID 16867)
-- Name: characters characters_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3620 (class 2606 OID 16872)
-- Name: guild_applications guild_applications_actor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_applications
    ADD CONSTRAINT guild_applications_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.characters(id);


--
-- TOC entry 3621 (class 2606 OID 16877)
-- Name: guild_applications guild_applications_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_applications
    ADD CONSTRAINT guild_applications_character_id_fkey FOREIGN KEY (character_id) REFERENCES public.characters(id);


--
-- TOC entry 3622 (class 2606 OID 16882)
-- Name: guild_applications guild_applications_guild_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_applications
    ADD CONSTRAINT guild_applications_guild_id_fkey FOREIGN KEY (guild_id) REFERENCES public.guilds(id);


--
-- TOC entry 3623 (class 2606 OID 16887)
-- Name: guild_characters guild_characters_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_characters
    ADD CONSTRAINT guild_characters_character_id_fkey FOREIGN KEY (character_id) REFERENCES public.characters(id);


--
-- TOC entry 3624 (class 2606 OID 16892)
-- Name: guild_characters guild_characters_guild_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_characters
    ADD CONSTRAINT guild_characters_guild_id_fkey FOREIGN KEY (guild_id) REFERENCES public.guilds(id);


--
-- TOC entry 3625 (class 2606 OID 16897)
-- Name: login_boost_state login_boost_state_char_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_boost_state
    ADD CONSTRAINT login_boost_state_char_id_fkey FOREIGN KEY (char_id) REFERENCES public.characters(id);


--
-- TOC entry 3626 (class 2606 OID 16902)
-- Name: lucky_box_state lucky_box_state_char_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lucky_box_state
    ADD CONSTRAINT lucky_box_state_char_id_fkey FOREIGN KEY (char_id) REFERENCES public.characters(id);


--
-- TOC entry 3627 (class 2606 OID 16907)
-- Name: mail mail_recipient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail
    ADD CONSTRAINT mail_recipient_id_fkey FOREIGN KEY (recipient_id) REFERENCES public.characters(id);


--
-- TOC entry 3628 (class 2606 OID 16912)
-- Name: shop_item_state shop_item_state_char_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_item_state
    ADD CONSTRAINT shop_item_state_char_id_fkey FOREIGN KEY (char_id) REFERENCES public.characters(id);


--
-- TOC entry 3629 (class 2606 OID 16917)
-- Name: stepup_state stepup_state_char_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stepup_state
    ADD CONSTRAINT stepup_state_char_id_fkey FOREIGN KEY (char_id) REFERENCES public.characters(id);


-- Completed on 2023-10-31 21:45:18

--
-- PostgreSQL database dump complete
--

