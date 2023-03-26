--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(40),
    mass_in_solar_mass integer NOT NULL,
    diameter_in_light_years integer NOT NULL,
    star_formation_per_year numeric(10,5) NOT NULL,
    intelliget_life boolean,
    habitable_planets boolean,
    galaxy_id integer NOT NULL,
    type text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: humans; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.humans (
    humans_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(40)
);


ALTER TABLE public.humans OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(40),
    mass_in_solar_mass integer NOT NULL,
    diameter_in_km integer NOT NULL,
    surface_temperature numeric(20,5) NOT NULL,
    have_planet boolean,
    have_water boolean,
    moon_id integer NOT NULL,
    type text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_diameter_in_km_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_diameter_in_km_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_diameter_in_km_seq OWNER TO freecodecamp;

--
-- Name: moon_diameter_in_km_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_diameter_in_km_seq OWNED BY public.moon.diameter_in_km;


--
-- Name: moon_mass_in_solar_mass_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_mass_in_solar_mass_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_mass_in_solar_mass_seq OWNER TO freecodecamp;

--
-- Name: moon_mass_in_solar_mass_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_mass_in_solar_mass_seq OWNED BY public.moon.mass_in_solar_mass;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(40),
    mass_in_solar_mass integer NOT NULL,
    diameter_in_km integer NOT NULL,
    surface_temperature numeric(20,5) NOT NULL,
    intelligent_life boolean,
    have_water boolean,
    have_star boolean,
    planet_id integer NOT NULL,
    planet_type text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_diameter_in_km_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_diameter_in_km_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_diameter_in_km_seq OWNER TO freecodecamp;

--
-- Name: planet_diameter_in_km_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_diameter_in_km_seq OWNED BY public.planet.diameter_in_km;


--
-- Name: planet_mass_in_solar_mass_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_mass_in_solar_mass_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_mass_in_solar_mass_seq OWNER TO freecodecamp;

--
-- Name: planet_mass_in_solar_mass_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_mass_in_solar_mass_seq OWNED BY public.planet.mass_in_solar_mass;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(40),
    mass_in_solar_mass integer NOT NULL,
    diameter_in_km integer NOT NULL,
    luminosity numeric(20,5),
    seen_by_intelligent_life boolean,
    star_id integer NOT NULL,
    galaxy_id integer,
    type text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: moon mass_in_solar_mass; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN mass_in_solar_mass SET DEFAULT nextval('public.moon_mass_in_solar_mass_seq'::regclass);


--
-- Name: moon diameter_in_km; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN diameter_in_km SET DEFAULT nextval('public.moon_diameter_in_km_seq'::regclass);


--
-- Name: planet mass_in_solar_mass; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN mass_in_solar_mass SET DEFAULT nextval('public.planet_mass_in_solar_mass_seq'::regclass);


--
-- Name: planet diameter_in_km; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN diameter_in_km SET DEFAULT nextval('public.planet_diameter_in_km_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky way', 53424, 34434, 6.00000, true, true, 1, 'spiral');
INSERT INTO public.galaxy VALUES ('Andromeda', 53424, 34434, 6.00000, true, true, 2, 'spiral');
INSERT INTO public.galaxy VALUES ('Black dwarf', 53424, 34434, 6.00000, true, true, 3, 'spiral');
INSERT INTO public.galaxy VALUES ('White dwarf', 53424, 34434, 6.00000, true, true, 4, 'spiral');
INSERT INTO public.galaxy VALUES ('Red dwarf', 53424, 34434, 6.00000, true, true, 5, 'spiral');
INSERT INTO public.galaxy VALUES ('Red angler', 53424, 34434, 6.00000, true, true, 6, 'spiral');


--
-- Data for Name: humans; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.humans VALUES (1, 1, 'Homo Sapiens');
INSERT INTO public.humans VALUES (2, 2, 'Homo Erectus');
INSERT INTO public.humans VALUES (3, 3, 'Humans');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 3233, 3233, 13.00000, true, true, 1, 'Just Moon', 1);
INSERT INTO public.moon VALUES ('Moone', 3233, 3233, 13.00000, true, true, 2, 'Just Moon', 1);
INSERT INTO public.moon VALUES ('P-21', 3233, 3233, 13.00000, true, true, 3, 'Just Moon', 1);
INSERT INTO public.moon VALUES ('P-221', 3233, 3233, 13.00000, true, true, 4, 'Just Moon', 1);
INSERT INTO public.moon VALUES ('P-2221', 3233, 3233, 13.00000, true, true, 5, 'Juon', 1);
INSERT INTO public.moon VALUES ('t-21', 3233, 3233, 13.00000, true, true, 6, 'Juon', 2);
INSERT INTO public.moon VALUES ('t-211', 3233, 3233, 13.00000, true, true, 7, 'Juon', 2);
INSERT INTO public.moon VALUES ('z21', 3233, 3233, 13.00000, true, true, 8, 'Juon', 2);
INSERT INTO public.moon VALUES ('z2-1', 3233, 3233, 13.00000, true, true, 9, 'Juon', 2);
INSERT INTO public.moon VALUES ('z29-1', 3233, 3233, 13.00000, true, true, 10, 'Juon', 3);
INSERT INTO public.moon VALUES ('z29-01', 3233, 3233, 13.00000, true, true, 11, 'Juon', 3);
INSERT INTO public.moon VALUES ('U-01', 3233, 3233, 13.00000, true, true, 12, 'Juon', 4);
INSERT INTO public.moon VALUES ('U-011', 3233, 3233, 13.00000, true, true, 13, 'Jun', 4);
INSERT INTO public.moon VALUES ('1U-011', 3233, 3233, 13.00000, true, true, 14, 'Jun', 5);
INSERT INTO public.moon VALUES ('O-1', 3233, 3233, 13.00000, true, true, 15, 'Jun', 5);
INSERT INTO public.moon VALUES ('O-T1', 3233, 3233, 13.00000, true, true, 16, 'Jun', 6);
INSERT INTO public.moon VALUES ('O-21T1', 3233, 3233, 13.00000, true, true, 17, 'Jun', 6);
INSERT INTO public.moon VALUES ('O-1221T1', 3233, 3233, 13.00000, true, true, 18, 'Jun', 7);
INSERT INTO public.moon VALUES ('I-1', 3233, 3233, 13.00000, true, true, 19, 'Jun', 8);
INSERT INTO public.moon VALUES ('I-091', 3233, 3233, 13.00000, true, true, 20, 'Jun', 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 342, 34234, 14.00000, true, true, true, 1, 'terrestrial', 1);
INSERT INTO public.planet VALUES ('Venus', 342, 34234, 14.00000, true, true, true, 2, 'terrestrial', 2);
INSERT INTO public.planet VALUES ('Mars', 342, 34234, 14.00000, true, true, true, 3, 'terrestrial', 3);
INSERT INTO public.planet VALUES ('K-21', 342, 34234, 14.00000, true, true, true, 4, 'terrestrial', 4);
INSERT INTO public.planet VALUES ('K-31', 342, 34234, 14.00000, true, true, true, 5, 'terrestrial', 5);
INSERT INTO public.planet VALUES ('K-451', 342, 34234, 14.00000, true, true, true, 6, 'terrestrial', 6);
INSERT INTO public.planet VALUES ('Jowisz', 342, 34234, 14.00000, true, true, true, 7, 'gas', 1);
INSERT INTO public.planet VALUES ('Pluto', 342, 34234, 14.00000, true, true, true, 8, 'gas', 2);
INSERT INTO public.planet VALUES ('R-1', 342, 34234, 14.00000, true, true, true, 9, 'gas', 3);
INSERT INTO public.planet VALUES ('R-133', 342, 34234, 14.00000, true, true, true, 10, 'gas', 4);
INSERT INTO public.planet VALUES ('x-21', 342, 34234, 14.00000, true, true, true, 11, 'gas', 5);
INSERT INTO public.planet VALUES ('x-1-x', 342, 34234, 14.00000, true, true, true, 12, 'gas', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('star', 34244, 323, 44.00000, true, 1, 1, 'sunny');
INSERT INTO public.star VALUES ('Sun', 34244, 323, 44.00000, true, 2, 2, 'sunny');
INSERT INTO public.star VALUES ('Red Sun', 34244, 323, 44.00000, true, 3, 3, 'sunny');
INSERT INTO public.star VALUES ('Black Sun', 34244, 323, 44.00000, true, 4, 4, 'sunny');
INSERT INTO public.star VALUES ('Yellow Sun', 34244, 323, 44.00000, true, 5, 5, 'sunny');
INSERT INTO public.star VALUES ('White dwarf', 34244, 323, 44.00000, true, 6, 6, 'sunn');


--
-- Name: moon_diameter_in_km_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_diameter_in_km_seq', 1, false);


--
-- Name: moon_mass_in_solar_mass_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_mass_in_solar_mass_seq', 1, false);


--
-- Name: planet_diameter_in_km_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_diameter_in_km_seq', 1, false);


--
-- Name: planet_mass_in_solar_mass_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_mass_in_solar_mass_seq', 1, false);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: humans humans_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.humans
    ADD CONSTRAINT humans_pkey PRIMARY KEY (humans_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: humans unique_human_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.humans
    ADD CONSTRAINT unique_human_id UNIQUE (humans_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: humans planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.humans
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

