--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE random_number_game;
--
-- Name: random_number_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE random_number_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE random_number_game OWNER TO freecodecamp;

\connect random_number_game

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: stats; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.stats (
    username_id integer,
    games_played integer,
    best_game integer
);


ALTER TABLE public.stats OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22),
    username_id integer NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_username_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_username_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_username_id_seq OWNER TO freecodecamp;

--
-- Name: users_username_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_username_id_seq OWNED BY public.users.username_id;


--
-- Name: users username_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN username_id SET DEFAULT nextval('public.users_username_id_seq'::regclass);


--
-- Data for Name: stats; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.stats VALUES (1, 1, 8);
INSERT INTO public.stats VALUES (3, 2, 373);
INSERT INTO public.stats VALUES (2, 5, 140);
INSERT INTO public.stats VALUES (5, 2, 257);
INSERT INTO public.stats VALUES (4, 5, 76);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('Pedro', 1);
INSERT INTO public.users VALUES ('user_1790711570578', 2);
INSERT INTO public.users VALUES ('user_1790711570577', 3);
INSERT INTO public.users VALUES ('user_1790711578239', 4);
INSERT INTO public.users VALUES ('user_1790711578238', 5);


--
-- Name: users_username_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_username_id_seq', 5, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username_id);


--
-- Name: stats stats_username_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stats
    ADD CONSTRAINT stats_username_id_fkey FOREIGN KEY (username_id) REFERENCES public.users(username_id);


--
-- PostgreSQL database dump complete
--

