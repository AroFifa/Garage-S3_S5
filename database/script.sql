--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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
-- Name: affectationservice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.affectationservice (
    id integer NOT NULL,
    idemploye integer NOT NULL,
    idspecialite integer NOT NULL,
    idservice integer NOT NULL,
    duree smallint NOT NULL,
    CONSTRAINT affectationservice_duree_check CHECK ((duree > 0))
);


ALTER TABLE public.affectationservice OWNER TO postgres;

--
-- Name: affectationservice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.affectationservice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.affectationservice_id_seq OWNER TO postgres;

--
-- Name: affectationservice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.affectationservice_id_seq OWNED BY public.affectationservice.id;


--
-- Name: categorieclient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorieclient (
    id integer NOT NULL,
    nom character varying(80) NOT NULL
);


ALTER TABLE public.categorieclient OWNER TO postgres;

--
-- Name: categorieclient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorieclient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorieclient_id_seq OWNER TO postgres;

--
-- Name: categorieclient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorieclient_id_seq OWNED BY public.categorieclient.id;


--
-- Name: categorieservice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorieservice (
    id integer NOT NULL,
    nom character varying(80) NOT NULL
);


ALTER TABLE public.categorieservice OWNER TO postgres;

--
-- Name: categorieservice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorieservice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorieservice_id_seq OWNER TO postgres;

--
-- Name: categorieservice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorieservice_id_seq OWNED BY public.categorieservice.id;


--
-- Name: seq_clientkey; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_clientkey
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_clientkey OWNER TO postgres;

--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id integer NOT NULL,
    clientkey character varying(20) DEFAULT ('#cl'::text || nextval('public.seq_clientkey'::regclass)) NOT NULL,
    nom character varying(80) NOT NULL,
    idcategorieclient integer NOT NULL
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_id_seq OWNER TO postgres;

--
-- Name: client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_id_seq OWNED BY public.client.id;


--
-- Name: seq_matricule; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_matricule
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_matricule OWNER TO postgres;

--
-- Name: employe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employe (
    id integer NOT NULL,
    matricule character varying(20) DEFAULT ('#emp'::text || nextval('public.seq_matricule'::regclass)) NOT NULL,
    nom character varying(50),
    prenom character varying(50),
    datenaissance date NOT NULL,
    idniveauetude integer,
    idgenre integer NOT NULL,
    CONSTRAINT employe_datenaissance_check CHECK ((datenaissance < (CURRENT_DATE - '18 years'::interval)))
);


ALTER TABLE public.employe OWNER TO postgres;

--
-- Name: employe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employe_id_seq OWNER TO postgres;

--
-- Name: employe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employe_id_seq OWNED BY public.employe.id;


--
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre (
    id integer NOT NULL,
    nom character varying(20) NOT NULL
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- Name: genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genre_id_seq OWNER TO postgres;

--
-- Name: genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genre_id_seq OWNED BY public.genre.id;


--
-- Name: margebeneficiaire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.margebeneficiaire (
    id integer NOT NULL,
    marge smallint NOT NULL,
    datemodification date DEFAULT CURRENT_DATE NOT NULL,
    idservice integer NOT NULL,
    CONSTRAINT margebeneficiaire_marge_check CHECK (((marge >= 0) AND (marge <= 100)))
);


ALTER TABLE public.margebeneficiaire OWNER TO postgres;

--
-- Name: margebeneficiaire_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.margebeneficiaire_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.margebeneficiaire_id_seq OWNER TO postgres;

--
-- Name: margebeneficiaire_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.margebeneficiaire_id_seq OWNED BY public.margebeneficiaire.id;


--
-- Name: materiel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materiel (
    id integer NOT NULL,
    nom character varying(80) NOT NULL,
    prixunitaire double precision NOT NULL,
    idunite integer NOT NULL,
    CONSTRAINT materiel_prixunitaire_check CHECK ((prixunitaire > (0)::double precision))
);


ALTER TABLE public.materiel OWNER TO postgres;

--
-- Name: materiel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materiel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materiel_id_seq OWNER TO postgres;

--
-- Name: materiel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materiel_id_seq OWNED BY public.materiel.id;


--
-- Name: materielutilise; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materielutilise (
    id integer NOT NULL,
    idservice integer NOT NULL,
    idmateriel integer NOT NULL,
    quantite smallint DEFAULT 1,
    CONSTRAINT materielutilise_quantite_check CHECK ((quantite > 0))
);


ALTER TABLE public.materielutilise OWNER TO postgres;

--
-- Name: materielutilise_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materielutilise_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materielutilise_id_seq OWNER TO postgres;

--
-- Name: materielutilise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materielutilise_id_seq OWNED BY public.materielutilise.id;


--
-- Name: niveauetude; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.niveauetude (
    id integer NOT NULL,
    nom character varying(20) NOT NULL
);


ALTER TABLE public.niveauetude OWNER TO postgres;

--
-- Name: niveauetude_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.niveauetude_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.niveauetude_id_seq OWNER TO postgres;

--
-- Name: niveauetude_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.niveauetude_id_seq OWNED BY public.niveauetude.id;


--
-- Name: responsable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.responsable (
    id integer NOT NULL,
    idemploye integer NOT NULL,
    email character varying(200) NOT NULL,
    motdepasse character varying(200) NOT NULL
);


ALTER TABLE public.responsable OWNER TO postgres;

--
-- Name: responsable_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.responsable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.responsable_id_seq OWNER TO postgres;

--
-- Name: responsable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.responsable_id_seq OWNED BY public.responsable.id;


--
-- Name: salaire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salaire (
    id integer NOT NULL,
    idspecialite integer NOT NULL,
    montant double precision DEFAULT 0 NOT NULL,
    CONSTRAINT salaire_montant_check CHECK ((montant >= (0)::double precision))
);


ALTER TABLE public.salaire OWNER TO postgres;

--
-- Name: salaire_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.salaire_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.salaire_id_seq OWNER TO postgres;

--
-- Name: salaire_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.salaire_id_seq OWNED BY public.salaire.id;


--
-- Name: service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service (
    id integer NOT NULL,
    idcategorieservice integer NOT NULL,
    nom character varying(150) NOT NULL
);


ALTER TABLE public.service OWNER TO postgres;

--
-- Name: service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_id_seq OWNER TO postgres;

--
-- Name: service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_id_seq OWNED BY public.service.id;


--
-- Name: specialite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.specialite (
    id integer NOT NULL,
    nom character varying(20) NOT NULL,
    description character varying(200)
);


ALTER TABLE public.specialite OWNER TO postgres;

--
-- Name: specialite_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.specialite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.specialite_id_seq OWNER TO postgres;

--
-- Name: specialite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.specialite_id_seq OWNED BY public.specialite.id;


--
-- Name: specialiteemploye; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.specialiteemploye (
    idemploye integer NOT NULL,
    idspecialite integer NOT NULL
);


ALTER TABLE public.specialiteemploye OWNER TO postgres;

--
-- Name: unite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unite (
    id integer NOT NULL,
    nom character varying(80) NOT NULL
);


ALTER TABLE public.unite OWNER TO postgres;

--
-- Name: unite_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unite_id_seq OWNER TO postgres;

--
-- Name: unite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unite_id_seq OWNED BY public.unite.id;


--
-- Name: v_charge_materielle; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_charge_materielle AS
 SELECT s.id AS idservice,
    cs.nom AS categorie,
    s.nom AS description,
    sum((m.prixunitaire * (mu.quantite)::double precision)) AS montant
   FROM (((public.categorieservice cs
     JOIN public.service s ON ((cs.id = s.idcategorieservice)))
     JOIN public.materielutilise mu ON ((s.id = mu.idservice)))
     JOIN public.materiel m ON ((mu.idmateriel = m.id)))
  GROUP BY s.id, cs.nom, s.nom;


ALTER TABLE public.v_charge_materielle OWNER TO postgres;

--
-- Name: v_charge_salariale; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_charge_salariale AS
 SELECT s.id AS idservice,
    cs.nom AS categorie,
    s.nom AS description,
    sum((sal.montant * (a.duree)::double precision)) AS montant
   FROM ((((public.categorieservice cs
     JOIN public.service s ON ((cs.id = s.idcategorieservice)))
     JOIN public.affectationservice a ON ((s.id = a.idservice)))
     JOIN public.specialite spec ON ((a.idspecialite = spec.id)))
     JOIN public.salaire sal ON ((spec.id = sal.idspecialite)))
  GROUP BY s.id, cs.nom, s.nom;


ALTER TABLE public.v_charge_salariale OWNER TO postgres;

--
-- Name: v_charge_totale; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_charge_totale AS
 SELECT s.idservice,
    s.categorie,
    s.description,
    (s.montant + m.montant) AS montant
   FROM (public.v_charge_salariale s
     JOIN public.v_charge_materielle m ON ((s.idservice = m.idservice)));


ALTER TABLE public.v_charge_totale OWNER TO postgres;

--
-- Name: v_prix_vente; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_prix_vente AS
 WITH marge AS (
         SELECT margebeneficiaire.marge,
            margebeneficiaire.idservice
           FROM public.margebeneficiaire
          ORDER BY margebeneficiaire.datemodification DESC
        )
 SELECT v.idservice,
    v.categorie,
    v.description,
    (v.montant + ((v.montant * (m.marge)::double precision) / (100)::double precision)) AS montant
   FROM (public.v_charge_totale v
     JOIN marge m ON ((v.idservice = m.idservice)));


ALTER TABLE public.v_prix_vente OWNER TO postgres;

--
-- Name: v_benefice; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_benefice AS
 SELECT vente.idservice,
    vente.categorie,
    vente.description,
    (vente.montant - charge.montant) AS montant
   FROM (public.v_charge_totale charge
     JOIN public.v_prix_vente vente ON ((charge.idservice = vente.idservice)));


ALTER TABLE public.v_benefice OWNER TO postgres;

--
-- Name: affectationservice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.affectationservice ALTER COLUMN id SET DEFAULT nextval('public.affectationservice_id_seq'::regclass);


--
-- Name: categorieclient id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorieclient ALTER COLUMN id SET DEFAULT nextval('public.categorieclient_id_seq'::regclass);


--
-- Name: categorieservice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorieservice ALTER COLUMN id SET DEFAULT nextval('public.categorieservice_id_seq'::regclass);


--
-- Name: client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client ALTER COLUMN id SET DEFAULT nextval('public.client_id_seq'::regclass);


--
-- Name: employe id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employe ALTER COLUMN id SET DEFAULT nextval('public.employe_id_seq'::regclass);


--
-- Name: genre id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre ALTER COLUMN id SET DEFAULT nextval('public.genre_id_seq'::regclass);


--
-- Name: margebeneficiaire id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.margebeneficiaire ALTER COLUMN id SET DEFAULT nextval('public.margebeneficiaire_id_seq'::regclass);


--
-- Name: materiel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materiel ALTER COLUMN id SET DEFAULT nextval('public.materiel_id_seq'::regclass);


--
-- Name: materielutilise id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materielutilise ALTER COLUMN id SET DEFAULT nextval('public.materielutilise_id_seq'::regclass);


--
-- Name: niveauetude id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.niveauetude ALTER COLUMN id SET DEFAULT nextval('public.niveauetude_id_seq'::regclass);


--
-- Name: responsable id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responsable ALTER COLUMN id SET DEFAULT nextval('public.responsable_id_seq'::regclass);


--
-- Name: salaire id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaire ALTER COLUMN id SET DEFAULT nextval('public.salaire_id_seq'::regclass);


--
-- Name: service id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service ALTER COLUMN id SET DEFAULT nextval('public.service_id_seq'::regclass);


--
-- Name: specialite id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specialite ALTER COLUMN id SET DEFAULT nextval('public.specialite_id_seq'::regclass);


--
-- Name: unite id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unite ALTER COLUMN id SET DEFAULT nextval('public.unite_id_seq'::regclass);


--
-- Data for Name: affectationservice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.affectationservice (id, idemploye, idspecialite, idservice, duree) FROM stdin;
1	1	1	1	2
2	1	1	2	1
3	2	2	3	3
4	3	3	4	4
5	4	2	5	2
\.


--
-- Data for Name: categorieclient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorieclient (id, nom) FROM stdin;
1	Particulier
2	Entreprise
\.


--
-- Data for Name: categorieservice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorieservice (id, nom) FROM stdin;
1	Entretien
2	Réparation
3	Vente
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id, clientkey, nom, idcategorieclient) FROM stdin;
1	#cl1	Dupont	1
2	#cl2	Durand	1
3	#cl3	Societe A	2
\.


--
-- Data for Name: employe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employe (id, matricule, nom, prenom, datenaissance, idniveauetude, idgenre) FROM stdin;
1	#emp1	Doe	John	1990-01-01	1	1
2	#emp2	Smith	Jane	1985-05-20	2	2
3	#emp3	Johnson	Mark	1978-03-14	3	1
4	#emp4	Williams	Emily	1983-07-22	2	2
5	#emp5	Jones	Michael	1976-12-01	3	1
8	3	Rakoto	Modeste	2000-01-01	1	1
\.


--
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genre (id, nom) FROM stdin;
1	Homme
2	Femme
\.


--
-- Data for Name: margebeneficiaire; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.margebeneficiaire (id, marge, datemodification, idservice) FROM stdin;
1	15	2022-12-04	1
2	10	2023-01-19	1
3	15	2023-01-19	2
4	20	2023-01-19	3
5	20	2023-01-19	4
6	15	2023-01-19	5
7	30	2023-01-19	6
\.


--
-- Data for Name: materiel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materiel (id, nom, prixunitaire, idunite) FROM stdin;
1	huile	65000	1
2	filtre	30000	2
3	courroie	150000	2
4	vis	20000	2
5	écrou	15000	2
6	rondelle	10000	2
7	boulon	25000	2
8	huile de transmission	75000	1
9	huile de frein	60000	1
10	huile de direction	65000	1
11	plaquettes de frein	100000	2
12	disque de frein	150000	2
13	ampoule	50000	2
14	Pneus	200000	2
15	batterie	150000	2
16	jantes	100000	2
\.


--
-- Data for Name: materielutilise; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materielutilise (id, idservice, idmateriel, quantite) FROM stdin;
59	1	1	1
60	1	2	1
61	2	2	1
62	3	3	1
63	3	4	1
64	3	5	1
65	4	6	1
66	4	7	1
67	4	8	1
68	5	11	1
69	5	12	1
70	5	13	1
71	6	14	1
72	6	15	1
73	6	16	1
\.


--
-- Data for Name: niveauetude; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.niveauetude (id, nom) FROM stdin;
1	Bac
2	Bac+2
3	Bac+3
4	Bac+5
\.


--
-- Data for Name: responsable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.responsable (id, idemploye, email, motdepasse) FROM stdin;
1	1	john.doe@garage.com	passw0rd
2	2	jane.smith@garage.com	mysecret
\.


--
-- Data for Name: salaire; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.salaire (id, idspecialite, montant) FROM stdin;
1	1	15000.5
2	2	20000
3	3	25000
\.


--
-- Data for Name: service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service (id, idcategorieservice, nom) FROM stdin;
1	1	Vidange
2	1	Changement de filtre
3	2	Remplacement de la courroie de distribution
4	2	Remplacement de la suspension
5	3	Vente de véhicules neufs
6	3	Vente de véhicules d'occasion
\.


--
-- Data for Name: specialite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.specialite (id, nom, description) FROM stdin;
1	Mécanique	Spécialiste en réparation de moteurs et systèmes mécaniques
2	Carrosserie	Spécialiste en réparation de carrosseries et peinture
3	Electronique	Spécialiste en réparation de systèmes électroniques et électriques
4	Vente	Spécialiste en vente de véhicules neufs et d'occasion
\.


--
-- Data for Name: specialiteemploye; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.specialiteemploye (idemploye, idspecialite) FROM stdin;
1	1
1	2
2	1
3	3
4	2
5	1
5	3
\.


--
-- Data for Name: unite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.unite (id, nom) FROM stdin;
1	litre
2	unité
3	mètre
\.


--
-- Name: affectationservice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.affectationservice_id_seq', 5, true);


--
-- Name: categorieclient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorieclient_id_seq', 2, true);


--
-- Name: categorieservice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorieservice_id_seq', 3, true);


--
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_id_seq', 3, true);


--
-- Name: employe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employe_id_seq', 9, true);


--
-- Name: genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genre_id_seq', 3, true);


--
-- Name: margebeneficiaire_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.margebeneficiaire_id_seq', 7, true);


--
-- Name: materiel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materiel_id_seq', 16, true);


--
-- Name: materielutilise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materielutilise_id_seq', 73, true);


--
-- Name: niveauetude_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.niveauetude_id_seq', 4, true);


--
-- Name: responsable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.responsable_id_seq', 2, true);


--
-- Name: salaire_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.salaire_id_seq', 3, true);


--
-- Name: seq_clientkey; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_clientkey', 1, false);


--
-- Name: seq_matricule; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_matricule', 4, true);


--
-- Name: service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_id_seq', 9, true);


--
-- Name: specialite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.specialite_id_seq', 4, true);


--
-- Name: unite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.unite_id_seq', 3, true);


--
-- Name: affectationservice affectationservice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.affectationservice
    ADD CONSTRAINT affectationservice_pkey PRIMARY KEY (id);


--
-- Name: categorieclient categorieclient_nom_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorieclient
    ADD CONSTRAINT categorieclient_nom_key UNIQUE (nom);


--
-- Name: categorieclient categorieclient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorieclient
    ADD CONSTRAINT categorieclient_pkey PRIMARY KEY (id);


--
-- Name: categorieservice categorieservice_nom_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorieservice
    ADD CONSTRAINT categorieservice_nom_key UNIQUE (nom);


--
-- Name: categorieservice categorieservice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorieservice
    ADD CONSTRAINT categorieservice_pkey PRIMARY KEY (id);


--
-- Name: client client_clientkey_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_clientkey_key UNIQUE (clientkey);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- Name: employe employe_matricule_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employe
    ADD CONSTRAINT employe_matricule_key UNIQUE (matricule);


--
-- Name: employe employe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employe
    ADD CONSTRAINT employe_pkey PRIMARY KEY (id);


--
-- Name: genre genre_nom_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_nom_key UNIQUE (nom);


--
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);


--
-- Name: margebeneficiaire margebeneficiaire_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.margebeneficiaire
    ADD CONSTRAINT margebeneficiaire_pkey PRIMARY KEY (id);


--
-- Name: materiel materiel_nom_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materiel
    ADD CONSTRAINT materiel_nom_key UNIQUE (nom);


--
-- Name: materiel materiel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materiel
    ADD CONSTRAINT materiel_pkey PRIMARY KEY (id);


--
-- Name: materielutilise materielutilise_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materielutilise
    ADD CONSTRAINT materielutilise_pkey PRIMARY KEY (id);


--
-- Name: niveauetude niveauetude_nom_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.niveauetude
    ADD CONSTRAINT niveauetude_nom_key UNIQUE (nom);


--
-- Name: niveauetude niveauetude_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.niveauetude
    ADD CONSTRAINT niveauetude_pkey PRIMARY KEY (id);


--
-- Name: responsable responsable_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responsable
    ADD CONSTRAINT responsable_email_key UNIQUE (email);


--
-- Name: responsable responsable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responsable
    ADD CONSTRAINT responsable_pkey PRIMARY KEY (id);


--
-- Name: salaire salaire_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaire
    ADD CONSTRAINT salaire_pkey PRIMARY KEY (id);


--
-- Name: service service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_pkey PRIMARY KEY (id);


--
-- Name: specialite specialite_nom_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specialite
    ADD CONSTRAINT specialite_nom_key UNIQUE (nom);


--
-- Name: specialite specialite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specialite
    ADD CONSTRAINT specialite_pkey PRIMARY KEY (id);


--
-- Name: unite unite_nom_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unite
    ADD CONSTRAINT unite_nom_key UNIQUE (nom);


--
-- Name: unite unite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unite
    ADD CONSTRAINT unite_pkey PRIMARY KEY (id);


--
-- Name: affectationservice affectationservice_idemploye_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.affectationservice
    ADD CONSTRAINT affectationservice_idemploye_fkey FOREIGN KEY (idemploye) REFERENCES public.employe(id);


--
-- Name: affectationservice affectationservice_idservice_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.affectationservice
    ADD CONSTRAINT affectationservice_idservice_fkey FOREIGN KEY (idservice) REFERENCES public.service(id);


--
-- Name: affectationservice affectationservice_idspecialite_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.affectationservice
    ADD CONSTRAINT affectationservice_idspecialite_fkey FOREIGN KEY (idspecialite) REFERENCES public.specialite(id);


--
-- Name: client client_idcategorieclient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_idcategorieclient_fkey FOREIGN KEY (idcategorieclient) REFERENCES public.categorieclient(id);


--
-- Name: employe employe_idgenre_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employe
    ADD CONSTRAINT employe_idgenre_fkey FOREIGN KEY (idgenre) REFERENCES public.genre(id);


--
-- Name: employe employe_idniveauetude_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employe
    ADD CONSTRAINT employe_idniveauetude_fkey FOREIGN KEY (idniveauetude) REFERENCES public.niveauetude(id);


--
-- Name: margebeneficiaire margebeneficiaire_idservice_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.margebeneficiaire
    ADD CONSTRAINT margebeneficiaire_idservice_fkey FOREIGN KEY (idservice) REFERENCES public.service(id);


--
-- Name: materiel materiel_idunite_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materiel
    ADD CONSTRAINT materiel_idunite_fkey FOREIGN KEY (idunite) REFERENCES public.unite(id);


--
-- Name: materielutilise materielutilise_idmateriel_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materielutilise
    ADD CONSTRAINT materielutilise_idmateriel_fkey FOREIGN KEY (idmateriel) REFERENCES public.materiel(id);


--
-- Name: materielutilise materielutilise_idservice_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materielutilise
    ADD CONSTRAINT materielutilise_idservice_fkey FOREIGN KEY (idservice) REFERENCES public.service(id);


--
-- Name: responsable responsable_idemploye_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responsable
    ADD CONSTRAINT responsable_idemploye_fkey FOREIGN KEY (idemploye) REFERENCES public.employe(id);


--
-- Name: salaire salaire_idspecialite_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaire
    ADD CONSTRAINT salaire_idspecialite_fkey FOREIGN KEY (idspecialite) REFERENCES public.specialite(id);


--
-- Name: service service_idcategorieservice_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_idcategorieservice_fkey FOREIGN KEY (idcategorieservice) REFERENCES public.categorieservice(id);


--
-- Name: specialiteemploye specialiteemploye_idemploye_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specialiteemploye
    ADD CONSTRAINT specialiteemploye_idemploye_fkey FOREIGN KEY (idemploye) REFERENCES public.employe(id);


--
-- Name: specialiteemploye specialiteemploye_idspecialite_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specialiteemploye
    ADD CONSTRAINT specialiteemploye_idspecialite_fkey FOREIGN KEY (idspecialite) REFERENCES public.specialite(id);


--
-- PostgreSQL database dump complete
--

