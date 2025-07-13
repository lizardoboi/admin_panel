--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

-- Started on 2025-07-13 22:42:30

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
-- TOC entry 838 (class 1247 OID 20657)
-- Name: enum_users_gender; Type: TYPE; Schema: public; Owner: admin_user
--

CREATE TYPE public.enum_users_gender AS ENUM (
    'male',
    'female'
);


ALTER TYPE public.enum_users_gender OWNER TO admin_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 20645)
-- Name: users; Type: TABLE; Schema: public; Owner: admin_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    gender public.enum_users_gender,
    birthdate date,
    CONSTRAINT users_gender_check CHECK (((gender)::text = ANY (ARRAY[('male'::character varying)::text, ('female'::character varying)::text])))
);


ALTER TABLE public.users OWNER TO admin_user;

--
-- TOC entry 214 (class 1259 OID 20644)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO admin_user;

--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 214
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3176 (class 2604 OID 20648)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3457 (class 0 OID 20645)
-- Dependencies: 215
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin_user
--

COPY public.users (id, username, password, first_name, last_name, gender, birthdate) FROM stdin;
1	admin	$2b$10$D6SBXQSE/PPO4H8ETGAcN.Uq2Bk4N2p55GOla1hX4qsmGkCBmj4TW	Admin	User	male	1990-01-01
11	User_one	$2b$10$zvEfNeNbXXBRU1qGnMg/Hewx8zbzNpxoLvmzfGJ7VXVNL757pbT1S	Jane	Doe	male	1998-02-13
12	User_two	$2b$10$1dW7sHbSMJou3QCOy9u6tOQQetr.ZeZ5uMQ4X9nYmMn026xIAfyRC	Jane	DoeTwo	female	1999-05-13
13	User_three	$2b$10$TrIiKlJF9yLTBIsEhu.ss.jbMDkVwHWa8srbLSYUsxZkcZRH9mu5W	Joe	DoeThree	male	1974-12-24
14	User_four	$2b$10$MVAkdYaTgXCFBrZS38LNHeoKH6V5.8MhCtjY.wChp0TPevmkNGlS6	Joe	DoeFour	male	2003-09-23
15	User_five	$2b$10$1QkqF6IrV5XBHr91PJs0o.5paEfa7Z/eye/qWtkt2kr5ShoPpDhRu	Janice	DoeFive	male	1998-06-07
16	User_six	$2b$10$Vji62JBxJFWmqtrX53Ty2O9m6AVInstKYJsH/7JzzdE9SK.q54o2m	Jamal	Bob	female	2005-12-24
17	User_seven	$2b$10$cplC9aKU/Y/M1xIG6UsU0OH4WLdeB.FSTPBdYIfiw6TsPHivvYveO	Rick	Roll	male	2000-12-12
\.


--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 214
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_user
--

SELECT pg_catalog.setval('public.users_id_seq', 17, true);


--
-- TOC entry 3179 (class 2606 OID 20653)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3181 (class 2606 OID 32768)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 3183 (class 2606 OID 32770)
-- Name: users users_username_key1; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key1 UNIQUE (username);


--
-- TOC entry 3185 (class 2606 OID 32792)
-- Name: users users_username_key10; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key10 UNIQUE (username);


--
-- TOC entry 3187 (class 2606 OID 32736)
-- Name: users users_username_key11; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key11 UNIQUE (username);


--
-- TOC entry 3189 (class 2606 OID 32738)
-- Name: users users_username_key12; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key12 UNIQUE (username);


--
-- TOC entry 3191 (class 2606 OID 32740)
-- Name: users users_username_key13; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key13 UNIQUE (username);


--
-- TOC entry 3193 (class 2606 OID 32742)
-- Name: users users_username_key14; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key14 UNIQUE (username);


--
-- TOC entry 3195 (class 2606 OID 32744)
-- Name: users users_username_key15; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key15 UNIQUE (username);


--
-- TOC entry 3197 (class 2606 OID 32746)
-- Name: users users_username_key16; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key16 UNIQUE (username);


--
-- TOC entry 3199 (class 2606 OID 32748)
-- Name: users users_username_key17; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key17 UNIQUE (username);


--
-- TOC entry 3201 (class 2606 OID 32750)
-- Name: users users_username_key18; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key18 UNIQUE (username);


--
-- TOC entry 3203 (class 2606 OID 32766)
-- Name: users users_username_key19; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key19 UNIQUE (username);


--
-- TOC entry 3205 (class 2606 OID 32772)
-- Name: users users_username_key2; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key2 UNIQUE (username);


--
-- TOC entry 3207 (class 2606 OID 32752)
-- Name: users users_username_key20; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key20 UNIQUE (username);


--
-- TOC entry 3209 (class 2606 OID 32756)
-- Name: users users_username_key21; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key21 UNIQUE (username);


--
-- TOC entry 3211 (class 2606 OID 32764)
-- Name: users users_username_key22; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key22 UNIQUE (username);


--
-- TOC entry 3213 (class 2606 OID 32758)
-- Name: users users_username_key23; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key23 UNIQUE (username);


--
-- TOC entry 3215 (class 2606 OID 32760)
-- Name: users users_username_key24; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key24 UNIQUE (username);


--
-- TOC entry 3217 (class 2606 OID 32762)
-- Name: users users_username_key25; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key25 UNIQUE (username);


--
-- TOC entry 3219 (class 2606 OID 32754)
-- Name: users users_username_key26; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key26 UNIQUE (username);


--
-- TOC entry 3221 (class 2606 OID 32804)
-- Name: users users_username_key27; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key27 UNIQUE (username);


--
-- TOC entry 3223 (class 2606 OID 32806)
-- Name: users users_username_key28; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key28 UNIQUE (username);


--
-- TOC entry 3225 (class 2606 OID 32808)
-- Name: users users_username_key29; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key29 UNIQUE (username);


--
-- TOC entry 3227 (class 2606 OID 32774)
-- Name: users users_username_key3; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key3 UNIQUE (username);


--
-- TOC entry 3229 (class 2606 OID 32734)
-- Name: users users_username_key30; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key30 UNIQUE (username);


--
-- TOC entry 3231 (class 2606 OID 32810)
-- Name: users users_username_key31; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key31 UNIQUE (username);


--
-- TOC entry 3233 (class 2606 OID 32698)
-- Name: users users_username_key32; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key32 UNIQUE (username);


--
-- TOC entry 3235 (class 2606 OID 32700)
-- Name: users users_username_key33; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key33 UNIQUE (username);


--
-- TOC entry 3237 (class 2606 OID 32732)
-- Name: users users_username_key34; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key34 UNIQUE (username);


--
-- TOC entry 3239 (class 2606 OID 32702)
-- Name: users users_username_key35; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key35 UNIQUE (username);


--
-- TOC entry 3241 (class 2606 OID 32730)
-- Name: users users_username_key36; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key36 UNIQUE (username);


--
-- TOC entry 3243 (class 2606 OID 32802)
-- Name: users users_username_key37; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key37 UNIQUE (username);


--
-- TOC entry 3245 (class 2606 OID 32794)
-- Name: users users_username_key38; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key38 UNIQUE (username);


--
-- TOC entry 3247 (class 2606 OID 32796)
-- Name: users users_username_key39; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key39 UNIQUE (username);


--
-- TOC entry 3249 (class 2606 OID 32776)
-- Name: users users_username_key4; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key4 UNIQUE (username);


--
-- TOC entry 3251 (class 2606 OID 32798)
-- Name: users users_username_key40; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key40 UNIQUE (username);


--
-- TOC entry 3253 (class 2606 OID 32800)
-- Name: users users_username_key41; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key41 UNIQUE (username);


--
-- TOC entry 3255 (class 2606 OID 32788)
-- Name: users users_username_key42; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key42 UNIQUE (username);


--
-- TOC entry 3257 (class 2606 OID 32728)
-- Name: users users_username_key43; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key43 UNIQUE (username);


--
-- TOC entry 3259 (class 2606 OID 32786)
-- Name: users users_username_key44; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key44 UNIQUE (username);


--
-- TOC entry 3261 (class 2606 OID 32712)
-- Name: users users_username_key45; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key45 UNIQUE (username);


--
-- TOC entry 3263 (class 2606 OID 32726)
-- Name: users users_username_key46; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key46 UNIQUE (username);


--
-- TOC entry 3265 (class 2606 OID 32714)
-- Name: users users_username_key47; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key47 UNIQUE (username);


--
-- TOC entry 3267 (class 2606 OID 32724)
-- Name: users users_username_key48; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key48 UNIQUE (username);


--
-- TOC entry 3269 (class 2606 OID 32716)
-- Name: users users_username_key49; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key49 UNIQUE (username);


--
-- TOC entry 3271 (class 2606 OID 32778)
-- Name: users users_username_key5; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key5 UNIQUE (username);


--
-- TOC entry 3273 (class 2606 OID 32718)
-- Name: users users_username_key50; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key50 UNIQUE (username);


--
-- TOC entry 3275 (class 2606 OID 32720)
-- Name: users users_username_key51; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key51 UNIQUE (username);


--
-- TOC entry 3277 (class 2606 OID 32722)
-- Name: users users_username_key52; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key52 UNIQUE (username);


--
-- TOC entry 3279 (class 2606 OID 32710)
-- Name: users users_username_key53; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key53 UNIQUE (username);


--
-- TOC entry 3281 (class 2606 OID 32704)
-- Name: users users_username_key54; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key54 UNIQUE (username);


--
-- TOC entry 3283 (class 2606 OID 32706)
-- Name: users users_username_key55; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key55 UNIQUE (username);


--
-- TOC entry 3285 (class 2606 OID 32708)
-- Name: users users_username_key56; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key56 UNIQUE (username);


--
-- TOC entry 3287 (class 2606 OID 32696)
-- Name: users users_username_key57; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key57 UNIQUE (username);


--
-- TOC entry 3289 (class 2606 OID 32812)
-- Name: users users_username_key58; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key58 UNIQUE (username);


--
-- TOC entry 3291 (class 2606 OID 32814)
-- Name: users users_username_key59; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key59 UNIQUE (username);


--
-- TOC entry 3293 (class 2606 OID 32780)
-- Name: users users_username_key6; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key6 UNIQUE (username);


--
-- TOC entry 3295 (class 2606 OID 32816)
-- Name: users users_username_key60; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key60 UNIQUE (username);


--
-- TOC entry 3297 (class 2606 OID 32694)
-- Name: users users_username_key61; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key61 UNIQUE (username);


--
-- TOC entry 3299 (class 2606 OID 32688)
-- Name: users users_username_key62; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key62 UNIQUE (username);


--
-- TOC entry 3301 (class 2606 OID 32690)
-- Name: users users_username_key63; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key63 UNIQUE (username);


--
-- TOC entry 3303 (class 2606 OID 32692)
-- Name: users users_username_key64; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key64 UNIQUE (username);


--
-- TOC entry 3305 (class 2606 OID 32686)
-- Name: users users_username_key65; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key65 UNIQUE (username);


--
-- TOC entry 3307 (class 2606 OID 32818)
-- Name: users users_username_key66; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key66 UNIQUE (username);


--
-- TOC entry 3309 (class 2606 OID 32782)
-- Name: users users_username_key7; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key7 UNIQUE (username);


--
-- TOC entry 3311 (class 2606 OID 32784)
-- Name: users users_username_key8; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key8 UNIQUE (username);


--
-- TOC entry 3313 (class 2606 OID 32790)
-- Name: users users_username_key9; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key9 UNIQUE (username);


--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT ALL ON SCHEMA public TO admin_user;


-- Completed on 2025-07-13 22:42:30

--
-- PostgreSQL database dump complete
--

