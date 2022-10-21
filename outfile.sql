--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

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
-- Name: main; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA main;


ALTER SCHEMA main OWNER TO postgres;

--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: clans; Type: TABLE; Schema: main; Owner: postgres
--

CREATE TABLE main.clans (
    id integer NOT NULL,
    name character varying NOT NULL,
    gold bigint NOT NULL
);


ALTER TABLE main.clans OWNER TO postgres;

--
-- Name: supports; Type: TABLE; Schema: main; Owner: postgres
--

CREATE TABLE main.supports (
    id integer NOT NULL,
    clanname character varying(20),
    gold bigint,
    reason character varying(50),
    nickname character varying(20),
    userid integer,
    goldbefore bigint,
    goldafter bigint
);


ALTER TABLE main.supports OWNER TO postgres;

--
-- Name: supports_id_seq; Type: SEQUENCE; Schema: main; Owner: postgres
--

CREATE SEQUENCE main.supports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE main.supports_id_seq OWNER TO postgres;

--
-- Name: supports_id_seq; Type: SEQUENCE OWNED BY; Schema: main; Owner: postgres
--

ALTER SEQUENCE main.supports_id_seq OWNED BY main.supports.id;


--
-- Name: users; Type: TABLE; Schema: main; Owner: postgres
--

CREATE TABLE main.users (
    id integer NOT NULL,
    gold bigint NOT NULL,
    nickname character varying NOT NULL,
    clan integer NOT NULL,
    power integer
);


ALTER TABLE main.users OWNER TO postgres;

--
-- Name: v_users; Type: VIEW; Schema: main; Owner: postgres
--

CREATE VIEW main.v_users AS
 SELECT users.id,
    users.gold,
    users.nickname,
    users.clan,
    users.power,
    c.name AS clanname
   FROM (main.users
     LEFT JOIN main.clans c ON ((users.clan = c.id)));


ALTER TABLE main.v_users OWNER TO postgres;

--
-- Name: code_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.code_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.code_seq OWNER TO postgres;

--
-- Name: currencies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currencies (
    date timestamp without time zone,
    eur double precision,
    usd double precision,
    id integer NOT NULL
);


ALTER TABLE public.currencies OWNER TO postgres;

--
-- Name: currencies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.currencies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.currencies_id_seq OWNER TO postgres;

--
-- Name: currencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.currencies_id_seq OWNED BY public.currencies.id;


--
-- Name: stocks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stocks (
    name character varying(300),
    id integer NOT NULL,
    priceeur numeric(10,2),
    pricerub numeric(10,2),
    priceusd numeric(10,2),
    dateupd timestamp without time zone,
    site character varying(200),
    date_upd timestamp without time zone,
    price_eur double precision,
    price_rub double precision,
    price_usd double precision
);


ALTER TABLE public.stocks OWNER TO postgres;

--
-- Name: stocks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stocks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stocks_id_seq OWNER TO postgres;

--
-- Name: stocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stocks_id_seq OWNED BY public.stocks.id;


--
-- Name: supports id; Type: DEFAULT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.supports ALTER COLUMN id SET DEFAULT nextval('main.supports_id_seq'::regclass);


--
-- Name: currencies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currencies ALTER COLUMN id SET DEFAULT nextval('public.currencies_id_seq'::regclass);


--
-- Name: stocks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks ALTER COLUMN id SET DEFAULT nextval('public.stocks_id_seq'::regclass);


--
-- Data for Name: clans; Type: TABLE DATA; Schema: main; Owner: postgres
--

COPY main.clans (id, name, gold) FROM stdin;
3	Mans	95500
2	Creeps	134000
1	Goblins	159000
\.


--
-- Data for Name: supports; Type: TABLE DATA; Schema: main; Owner: postgres
--

COPY main.supports (id, clanname, gold, reason, nickname, userid, goldbefore, goldafter) FROM stdin;
1	Creeps	500	Пользователь добавил в золото в казну	\N	5	117000	117500
2	Goblins	500	Пользователь добавил в золото в казну	\N	3	149000	149500
3	Goblins	500	Пользователь добавил в золото в казну	\N	1	149000	149500
4	Creeps	500	Пользователь добавил в золото в казну	\N	4	117000	117500
5	Mans	500	Пользователь добавил в золото в казну	\N	8	86000	86500
6	Mans	500	Пользователь добавил в золото в казну	\N	7	86000	86500
7	Goblins	500	Пользователь добавил в золото в казну	\N	2	149500	150000
8	Mans	500	Пользователь добавил в золото в казну	\N	9	86000	86500
9	Creeps	500	Пользователь добавил в золото в казну	\N	6	117500	118000
10	Goblins	500	Пользователь победил в битве	\N	1	150000	150500
11	Mans	500	Пользователь победил в битве	\N	8	87000	87500
12	Mans	500	Пользователь победил в битве	\N	7	87000	87500
13	Creeps	500	Пользователь победил в битве	\N	4	119000	119500
14	Creeps	500	Пользователь победил в битве	\N	5	119000	119500
15	Goblins	500	Пользователь победил в битве	\N	3	151000	151500
16	Goblins	500	Пользователь победил в битве	\N	2	151000	151500
17	Creeps	500	Пользователь победил в битве	\N	6	119500	120000
18	Creeps	500	Пользователь победил в битве	\N	5	119500	120000
19	Creeps	500	Пользователь победил в битве	\N	5	121000	121500
20	Creeps	500	Пользователь победил в битве	\N	5	121000	121500
21	Creeps	500	Пользователь победил в битве	\N	5	122500	123000
22	Creeps	500	Пользователь победил в битве	\N	5	123000	123500
23	Creeps	500	Пользователь победил в битве	\N	5	123000	123500
24	Creeps	500	Пользователь победил в битве	\N	5	123500	124000
25	Creeps	500	Пользователь победил в битве	\N	5	123000	123500
26	Creeps	500	Пользователь победил в битве	\N	5	124000	124500
27	Creeps	500	Пользователь победил в битве	\N	4	124000	124500
28	Goblins	500	Пользователь победил в битве	\N	1	151500	152000
29	Mans	500	Пользователь победил в битве	\N	7	88000	88500
30	Creeps	500	Пользователь победил в битве	\N	6	124500	125000
31	Mans	500	Пользователь победил в битве	\N	8	88000	88500
32	Creeps	500	Пользователь победил в битве	\N	4	125000	125500
33	Goblins	500	Пользователь победил в битве	\N	1	153000	153500
34	Goblins	500	Пользователь победил в битве	\N	2	152500	153000
35	Creeps	500	Пользователь победил в битве	\N	5	125500	126000
36	Goblins	500	Пользователь победил в битве	\N	1	153000	153500
37	Mans	500	Пользователь победил в битве	\N	7	88500	89000
38	Creeps	500	Пользователь победил в битве	\N	6	126000	126500
39	Goblins	500	Пользователь победил в битве	\N	2	154000	154500
40	Goblins	500	Пользователь победил в битве	\N	1	154000	154500
41	Mans	500	Пользователь победил в битве	\N	7	89000	89500
42	Creeps	500	Пользователь победил в битве	\N	5	126500	127000
43	Mans	500	Пользователь победил в битве	\N	7	90000	90500
44	Mans	500	Пользователь победил в битве	\N	7	90500	91000
45	Mans	500	Пользователь победил в битве	\N	7	90500	91000
46	Mans	500	Пользователь победил в битве	\N	7	92000	92500
47	Creeps	500	Пользователь победил в битве	\N	5	127000	127500
48	Mans	500	Пользователь победил в битве	\N	8	92000	92500
49	Mans	500	Пользователь победил в битве	\N	7	92000	92500
50	Mans	500	Пользователь победил в битве	\N	8	92500	93000
51	Mans	500	Пользователь победил в битве	\N	7	93500	94000
52	Mans	500	Пользователь победил в битве	\N	8	93500	94000
53	Goblins	500	Пользователь победил в битве	\N	2	154500	155000
54	Creeps	500	Пользователь победил в битве	\N	6	128500	129000
55	Creeps	500	Пользователь победил в битве	\N	6	128000	128500
56	Creeps	500	Пользователь победил в битве	\N	5	129000	129500
57	Creeps	500	Пользователь победил в битве	\N	6	129000	129500
58	Creeps	500	Пользователь победил в битве	\N	6	130000	130500
59	Creeps	500	Пользователь победил в битве	\N	6	131000	131500
60	Creeps	500	Пользователь победил в битве	\N	6	131000	131500
61	Creeps	500	Пользователь победил в битве	\N	6	131000	131500
62	Creeps	500	Пользователь победил в битве	\N	5	132000	132500
63	Goblins	500	Пользователь победил в битве	\N	3	155000	155500
64	Creeps	500	Пользователь победил в битве	\N	4	132000	132500
65	Goblins	500	Пользователь победил в битве	\N	1	155500	156000
66	Mans	500	Пользователь победил в битве	\N	7	94500	95000
67	Mans	500	Пользователь победил в битве	\N	8	94500	95000
68	Creeps	500	Пользователь победил в битве	\N	6	132500	133000
69	Goblins	500	Пользователь победил в битве	\N	2	156500	157000
70	Creeps	500	Пользователь победил в битве	\N	5	133000	133500
71	Goblins	500	Пользователь победил в битве	\N	2	157000	157500
72	Goblins	500	Пользователь победил в битве	\N	2	157500	158000
73	Goblins	500	Пользователь победил в битве	\N	2	157500	158000
74	Mans	500	Пользователь победил в битве	\N	7	95000	95500
75	Goblins	500	Пользователь победил в битве	\N	2	158500	159000
76	Creeps	500	Пользователь победил в битве	\N	6	133500	134000
77	Goblins	500	Пользователь победил в битве	\N	2	158500	159000
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: main; Owner: postgres
--

COPY main.users (id, gold, nickname, clan, power) FROM stdin;
3	-36500	Fike	1	20
5	55500	Lol	2	70
4	-26500	Froz	2	25
1	-7000	Mike	1	30
7	32500	John	3	60
8	-6500	Kleo	3	30
9	-48500	Leo	3	10
2	13000	Nike	1	50
6	33000	Optimus	2	60
\.


--
-- Data for Name: currencies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currencies (date, eur, usd, id) FROM stdin;
2021-10-22 05:00:00	82.6399	70.9904	78
2021-10-25 19:03:28.743	82.6399	70.9904	79
\.


--
-- Data for Name: stocks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stocks (name, id, priceeur, pricerub, priceusd, dateupd, site, date_upd, price_eur, price_rub, price_usd) FROM stdin;
Котировки Consumer Discretionary Select Sector SPDR Fund	61	166.17	13732.38	193.44	2021-10-22 05:00:00	\N	\N	\N	\N	\N
Котировки iShares® iBonds® Mar 2023 Term Corporate ex-Financials ETF	65	21.18	1750.62	24.66	2021-10-22 05:00:00	\N	\N	\N	\N	\N
Котировки BlackRock High Yield Muni Income Bond ETF	46	22.44	1854.27	26.12	2021-10-22 05:00:00	\N	\N	\N	\N	\N
Котировки Consumer Staples Select Sector SPDR Fund 	48	60.77	5021.86	70.74	2021-10-22 05:00:00	\N	\N	\N	\N	\N
Котировки BlackRock Intermediate Muni Income Bond ETF	47	21.91	1810.97	25.51	2021-10-22 05:00:00	\N	\N	\N	\N	\N
Котировки Energy Select Sector SPDR Fund	66	49.78	4113.89	57.95	2021-10-25 05:00:00	\N	\N	\N	\N	\N
\.


--
-- Name: supports_id_seq; Type: SEQUENCE SET; Schema: main; Owner: postgres
--

SELECT pg_catalog.setval('main.supports_id_seq', 77, true);


--
-- Name: code_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.code_seq', 1, false);


--
-- Name: currencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.currencies_id_seq', 79, true);


--
-- Name: stocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stocks_id_seq', 66, true);


--
-- Name: clans clans_name_key; Type: CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.clans
    ADD CONSTRAINT clans_name_key UNIQUE (name);


--
-- Name: clans clans_pkey; Type: CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.clans
    ADD CONSTRAINT clans_pkey PRIMARY KEY (id);


--
-- Name: supports supports_pkey; Type: CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.supports
    ADD CONSTRAINT supports_pkey PRIMARY KEY (id);


--
-- Name: users users_id_key; Type: CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.users
    ADD CONSTRAINT users_id_key UNIQUE (id);


--
-- Name: users users_nickname_key; Type: CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.users
    ADD CONSTRAINT users_nickname_key UNIQUE (nickname);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: currencies currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currencies
    ADD CONSTRAINT currencies_pkey PRIMARY KEY (id);


--
-- Name: supports supports_clanname_fkey; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.supports
    ADD CONSTRAINT supports_clanname_fkey FOREIGN KEY (clanname) REFERENCES main.clans(name);


--
-- Name: supports supports_nickname_fkey; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.supports
    ADD CONSTRAINT supports_nickname_fkey FOREIGN KEY (nickname) REFERENCES main.users(nickname);


--
-- Name: supports supports_userid_fkey; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.supports
    ADD CONSTRAINT supports_userid_fkey FOREIGN KEY (userid) REFERENCES main.users(id);


--
-- Name: users users_clan_fkey; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.users
    ADD CONSTRAINT users_clan_fkey FOREIGN KEY (clan) REFERENCES main.clans(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

