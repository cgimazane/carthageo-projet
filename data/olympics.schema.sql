--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: athlete; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.athlete (
    id integer NOT NULL,
    name text,
    gender character varying(5),
    country_id integer
);


ALTER TABLE public.athlete OWNER TO postgres;

--
-- Name: athlete_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.athlete_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.athlete_id_seq OWNER TO postgres;

--
-- Name: athlete_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.athlete_id_seq OWNED BY public.athlete.id;


--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    id integer NOT NULL,
    name text,
    code character varying(3),
    pop bigint,
    geometry public.geometry(MultiPolygon,4326),
    first_participation integer,
    last_participation integer
);


ALTER TABLE public.country OWNER TO postgres;

--
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_id_seq OWNER TO postgres;

--
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_id_seq OWNED BY public.country.id;


--
-- Name: event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event (
    id integer NOT NULL,
    sport character varying(20),
    discipline character varying(30),
    name character varying(50)
);


ALTER TABLE public.event OWNER TO postgres;

--
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_id_seq OWNER TO postgres;

--
-- Name: event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_id_seq OWNED BY public.event.id;


--
-- Name: medal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medal (
    medal character varying(6),
    olympiad_id integer,
    event_id integer,
    athlete_id integer
);


ALTER TABLE public.medal OWNER TO postgres;

--
-- Name: olympiad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.olympiad (
    id integer NOT NULL,
    city character varying(30),
    year integer,
    season character varying(6),
    country_id integer
);


ALTER TABLE public.olympiad OWNER TO postgres;

--
-- Name: olympiad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.olympiad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.olympiad_id_seq OWNER TO postgres;

--
-- Name: olympiad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.olympiad_id_seq OWNED BY public.olympiad.id;


--
-- Name: athlete id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.athlete ALTER COLUMN id SET DEFAULT nextval('public.athlete_id_seq'::regclass);


--
-- Name: country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


--
-- Name: event id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event ALTER COLUMN id SET DEFAULT nextval('public.event_id_seq'::regclass);


--
-- Name: olympiad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.olympiad ALTER COLUMN id SET DEFAULT nextval('public.olympiad_id_seq'::regclass);


--
-- Name: athlete athlete_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.athlete
    ADD CONSTRAINT athlete_pkey PRIMARY KEY (id);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- Name: olympiad olympiad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.olympiad
    ADD CONSTRAINT olympiad_pkey PRIMARY KEY (id);


--
-- Name: fki_medal_athlete_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_medal_athlete_fkey ON public.medal USING btree (athlete_id);


--
-- Name: fki_medal_event_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_medal_event_fkey ON public.medal USING btree (event_id);


--
-- Name: fki_medal_olympiad_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_medal_olympiad_fkey ON public.medal USING btree (olympiad_id);


--
-- Name: athlete athlete_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.athlete
    ADD CONSTRAINT athlete_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.country(id);


--
-- Name: medal medal_athlete_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medal
    ADD CONSTRAINT medal_athlete_fkey FOREIGN KEY (athlete_id) REFERENCES public.athlete(id);


--
-- Name: medal medal_event_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medal
    ADD CONSTRAINT medal_event_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- Name: medal medal_olympiad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medal
    ADD CONSTRAINT medal_olympiad_fkey FOREIGN KEY (olympiad_id) REFERENCES public.olympiad(id);


--
-- Name: olympiad olympiad_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.olympiad
    ADD CONSTRAINT olympiad_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.country(id);


--
-- PostgreSQL database dump complete
--

