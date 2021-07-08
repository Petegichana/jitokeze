--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Ubuntu 13.2-1.pgdg18.04+1)
-- Dumped by pg_dump version 13.2 (Ubuntu 13.2-1.pgdg18.04+1)

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
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: registratione_apartment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registratione_apartment (
    id integer NOT NULL,
    name text,
    price text,
    owner_phone text,
    photo character varying(100),
    description text,
    region character varying(20),
    location public.geography(Point,4326) NOT NULL
);


ALTER TABLE public.registratione_apartment OWNER TO postgres;

--
-- Name: registratione_apartment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registratione_apartment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registratione_apartment_id_seq OWNER TO postgres;

--
-- Name: registratione_apartment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registratione_apartment_id_seq OWNED BY public.registratione_apartment.id;


--
-- Name: registratione_lnmonline; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registratione_lnmonline (
    id integer NOT NULL,
    "CheckoutRequestID" character varying(50),
    "MerchantRequestID" character varying(20),
    "ResultCode" integer,
    "ResultDesc" character varying(120),
    "Amount" double precision,
    "MpesaReceiptNumber" character varying(15),
    "Balance" character varying(12),
    "TransactionDate" date,
    "PhoneNumber" character varying(13)
);


ALTER TABLE public.registratione_lnmonline OWNER TO postgres;

--
-- Name: registratione_lnmonline_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registratione_lnmonline_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registratione_lnmonline_id_seq OWNER TO postgres;

--
-- Name: registratione_lnmonline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registratione_lnmonline_id_seq OWNED BY public.registratione_lnmonline.id;


--
-- Name: registratione_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registratione_profile (
    bio text NOT NULL,
    photo character varying(100),
    user_id integer NOT NULL
);


ALTER TABLE public.registratione_profile OWNER TO postgres;

--
-- Name: registratione_receipt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registratione_receipt (
    id integer NOT NULL,
    "user" character varying(50),
    payer character varying(50),
    phone character varying(50),
    payment_amount character varying(50),
    payment_id character varying(50),
    payment_status character varying(50),
    date_paid character varying(50)
);


ALTER TABLE public.registratione_receipt OWNER TO postgres;

--
-- Name: registratione_receipt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registratione_receipt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registratione_receipt_id_seq OWNER TO postgres;

--
-- Name: registratione_receipt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registratione_receipt_id_seq OWNED BY public.registratione_receipt.id;


--
-- Name: star_ratings_rating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star_ratings_rating (
    id integer NOT NULL,
    count integer NOT NULL,
    total integer NOT NULL,
    average numeric(6,3) NOT NULL,
    object_id integer,
    content_type_id integer,
    CONSTRAINT star_ratings_rating_count_check CHECK ((count >= 0)),
    CONSTRAINT star_ratings_rating_object_id_check CHECK ((object_id >= 0)),
    CONSTRAINT star_ratings_rating_total_check CHECK ((total >= 0))
);


ALTER TABLE public.star_ratings_rating OWNER TO postgres;

--
-- Name: star_ratings_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_ratings_rating_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_ratings_rating_id_seq OWNER TO postgres;

--
-- Name: star_ratings_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_ratings_rating_id_seq OWNED BY public.star_ratings_rating.id;


--
-- Name: star_ratings_userrating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star_ratings_userrating (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    ip inet,
    score smallint NOT NULL,
    rating_id integer NOT NULL,
    user_id integer,
    CONSTRAINT star_ratings_userrating_score_check CHECK ((score >= 0))
);


ALTER TABLE public.star_ratings_userrating OWNER TO postgres;

--
-- Name: star_ratings_userrating_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_ratings_userrating_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_ratings_userrating_id_seq OWNER TO postgres;

--
-- Name: star_ratings_userrating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_ratings_userrating_id_seq OWNED BY public.star_ratings_userrating.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: registratione_apartment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registratione_apartment ALTER COLUMN id SET DEFAULT nextval('public.registratione_apartment_id_seq'::regclass);


--
-- Name: registratione_lnmonline id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registratione_lnmonline ALTER COLUMN id SET DEFAULT nextval('public.registratione_lnmonline_id_seq'::regclass);


--
-- Name: registratione_receipt id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registratione_receipt ALTER COLUMN id SET DEFAULT nextval('public.registratione_receipt_id_seq'::regclass);


--
-- Name: star_ratings_rating id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star_ratings_rating ALTER COLUMN id SET DEFAULT nextval('public.star_ratings_rating_id_seq'::regclass);


--
-- Name: star_ratings_userrating id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star_ratings_userrating ALTER COLUMN id SET DEFAULT nextval('public.star_ratings_userrating_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add profile	1	add_profile
2	Can change profile	1	change_profile
3	Can delete profile	1	delete_profile
4	Can view profile	1	view_profile
5	Can add apartment	2	add_apartment
6	Can change apartment	2	change_apartment
7	Can delete apartment	2	delete_apartment
8	Can view apartment	2	view_apartment
9	Can add lnm online	3	add_lnmonline
10	Can change lnm online	3	change_lnmonline
11	Can delete lnm online	3	delete_lnmonline
12	Can view lnm online	3	view_lnmonline
13	Can add receipt	4	add_receipt
14	Can change receipt	4	change_receipt
15	Can delete receipt	4	delete_receipt
16	Can view receipt	4	view_receipt
17	Can add rating	5	add_rating
18	Can change rating	5	change_rating
19	Can delete rating	5	delete_rating
20	Can view rating	5	view_rating
21	Can add user rating	6	add_userrating
22	Can change user rating	6	change_userrating
23	Can delete user rating	6	delete_userrating
24	Can view user rating	6	view_userrating
25	Can add log entry	7	add_logentry
26	Can change log entry	7	change_logentry
27	Can delete log entry	7	delete_logentry
28	Can view log entry	7	view_logentry
29	Can add permission	8	add_permission
30	Can change permission	8	change_permission
31	Can delete permission	8	delete_permission
32	Can view permission	8	view_permission
33	Can add group	9	add_group
34	Can change group	9	change_group
35	Can delete group	9	delete_group
36	Can view group	9	view_group
37	Can add user	10	add_user
38	Can change user	10	change_user
39	Can delete user	10	delete_user
40	Can view user	10	view_user
41	Can add content type	11	add_contenttype
42	Can change content type	11	change_contenttype
43	Can delete content type	11	delete_contenttype
44	Can view content type	11	view_contenttype
45	Can add session	12	add_session
46	Can change session	12	change_session
47	Can delete session	12	delete_session
48	Can view session	12	view_session
49	Can add city	13	add_city
50	Can change city	13	change_city
51	Can delete city	13	delete_city
52	Can view city	13	view_city
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$120000$XcXOdlu8jytB$tH6VrJRYhnasL8AW5ZHSZrqPhhzA5mhg3gUNJnLjh8c=	\N	t	sigi			sigi@mail.com	t	t	2021-04-06 22:30:46.034804+03
1	pbkdf2_sha256$120000$Mne64AeCZwYB$fUQmJOqgXemfouVXFLk/gEYsJyx0FptqITxo9jFbUIk=	2021-04-07 18:51:10.874047+03	t	sigilai			briansigilai@gmail.com	t	t	2021-04-06 22:28:38.99309+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-04-07 00:03:27.56366+03	1	TheM4	1	[{"added": {}}]	2	1
2	2021-04-07 00:04:30.952263+03	2	TheM4	1	[{"added": {}}]	2	1
3	2021-04-07 13:48:46.923066+03	2	TheM4	3		2	1
4	2021-04-07 13:48:47.127074+03	1	TheM4	3		2	1
5	2021-04-07 13:50:45.221036+03	3	Call me by your name	1	[{"added": {}}]	2	1
6	2021-04-07 13:51:54.615636+03	4	asfdsafdsaf	1	[{"added": {}}]	2	1
7	2021-04-07 14:00:20.359464+03	4	asfdsafdsaf	3		2	1
8	2021-04-07 14:00:20.385889+03	3	Call me by your name	3		2	1
9	2021-04-07 14:04:00.332358+03	5	Smile	1	[{"added": {}}]	2	1
10	2021-04-07 17:25:00.971558+03	6	Jerboam	1	[{"added": {}}]	2	1
11	2021-04-07 17:55:37.874559+03	7	Roblox254	1	[{"added": {}}]	2	1
12	2021-04-07 17:55:56.854822+03	6	Jerboam	3		2	1
13	2021-04-07 18:01:15.775495+03	8	Blodclaat	1	[{"added": {}}]	2	1
14	2021-04-07 18:56:32.455592+03	7	Roblox254	2	[{"changed": {"fields": ["location"]}}]	2	1
15	2021-04-07 18:56:54.328106+03	5	Smile	2	[{"changed": {"fields": ["location"]}}]	2	1
16	2021-04-07 19:11:44.503181+03	8	Blodclaat	2	[{"changed": {"fields": ["region"]}}]	2	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	registratione	profile
2	registratione	apartment
3	registratione	lnmonline
4	registratione	receipt
5	star_ratings	rating
6	star_ratings	userrating
7	admin	logentry
8	auth	permission
9	auth	group
10	auth	user
11	contenttypes	contenttype
12	sessions	session
13	registratione	city
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-04-06 22:26:45.526266+03
2	auth	0001_initial	2021-04-06 22:26:46.628528+03
3	admin	0001_initial	2021-04-06 22:26:46.906396+03
4	admin	0002_logentry_remove_auto_add	2021-04-06 22:26:46.926573+03
5	admin	0003_logentry_add_action_flag_choices	2021-04-06 22:26:46.94987+03
6	contenttypes	0002_remove_content_type_name	2021-04-06 22:26:47.006416+03
7	auth	0002_alter_permission_name_max_length	2021-04-06 22:26:47.02852+03
8	auth	0003_alter_user_email_max_length	2021-04-06 22:26:47.062053+03
9	auth	0004_alter_user_username_opts	2021-04-06 22:26:47.088183+03
10	auth	0005_alter_user_last_login_null	2021-04-06 22:26:47.117259+03
11	auth	0006_require_contenttypes_0002	2021-04-06 22:26:47.128667+03
12	auth	0007_alter_validators_add_error_messages	2021-04-06 22:26:47.150089+03
13	auth	0008_alter_user_username_max_length	2021-04-06 22:26:47.261884+03
14	auth	0009_alter_user_last_name_max_length	2021-04-06 22:26:47.295251+03
15	django_registration	0001_initial	2021-04-06 22:26:47.318266+03
16	sessions	0001_initial	2021-04-06 22:26:47.573521+03
17	star_ratings	0001_initial	2021-04-06 22:26:48.041353+03
18	star_ratings	0002_auto_20160608_1119	2021-04-06 22:26:48.152884+03
19	star_ratings	0003_auto_20160721_1127	2021-04-06 22:26:48.230107+03
20	registratione	0001_initial	2021-04-06 22:32:56.607571+03
21	registratione	0002_remove_apartment_phonenumber	2021-04-06 22:33:52.162883+03
22	registratione	0003_auto_20210406_1940	2021-04-06 22:42:56.65111+03
23	registratione	0004_auto_20210406_1946	2021-04-06 22:46:16.821401+03
24	registratione	0005_auto_20210406_2002	2021-04-06 23:03:13.955555+03
25	registratione	0006_auto_20210406_2109	2021-04-07 00:09:10.281966+03
26	registratione	0007_auto_20210407_1102	2021-04-07 14:02:19.647372+03
27	registratione	0008_auto_20210407_1130	2021-04-07 14:30:27.202243+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
rtmzjojwz262pxdmva31kqosz2g1o71z	YTE0M2RhYjE1NzNmYWQxOWU2OWRhOTAzOWU4NzE2MTlhZmUyMGI5Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNDRlMjBjNjcyNjBkN2MyM2JjOTRlNGM1YjZjNTkzMGU5MzgwODkyIn0=	2021-04-21 00:24:03.222571+03
iihnw4jcgwhsfqxn5yqyj7kvrt0qcvxx	YTE0M2RhYjE1NzNmYWQxOWU2OWRhOTAzOWU4NzE2MTlhZmUyMGI5Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNDRlMjBjNjcyNjBkN2MyM2JjOTRlNGM1YjZjNTkzMGU5MzgwODkyIn0=	2021-04-21 15:52:22.552424+03
5solskzc01hdzmsmebx0h9xqegwqyeqq	YTE0M2RhYjE1NzNmYWQxOWU2OWRhOTAzOWU4NzE2MTlhZmUyMGI5Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNDRlMjBjNjcyNjBkN2MyM2JjOTRlNGM1YjZjNTkzMGU5MzgwODkyIn0=	2021-04-21 18:51:10.997996+03
\.


--
-- Data for Name: registratione_apartment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.registratione_apartment (id, name, price, owner_phone, photo, description, region, location) FROM stdin;
7	Roblox254	10000	254792071275	apartment/b3_p8pxVif.jpg	<p>Hey now there</p>	kasarani	0101000020E6100000BCE6FF2FAF684240362CB4495F4CF4BF
5	Smile	10000	254792071275	apartment/kaniro2_Yl9ChAt.jpeg	<p>wrfwfsadf</p>	kasarani	0101000020E610000059FFF48FE76642408C8452C669C1F4BF
8	Blodclaat	9000	254792071275	apartment/b2_102xyeu.jpg	<p>Kanairo</p>	kasarani	0101000020E61000006C3D0AD7A33042401A6766666666E6BF
\.


--
-- Data for Name: registratione_lnmonline; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.registratione_lnmonline (id, "CheckoutRequestID", "MerchantRequestID", "ResultCode", "ResultDesc", "Amount", "MpesaReceiptNumber", "Balance", "TransactionDate", "PhoneNumber") FROM stdin;
\.


--
-- Data for Name: registratione_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.registratione_profile (bio, photo, user_id) FROM stdin;
\.


--
-- Data for Name: registratione_receipt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.registratione_receipt (id, "user", payer, phone, payment_amount, payment_id, payment_status, date_paid) FROM stdin;
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: star_ratings_rating; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.star_ratings_rating (id, count, total, average, object_id, content_type_id) FROM stdin;
\.


--
-- Data for Name: star_ratings_userrating; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.star_ratings_userrating (id, created, modified, ip, score, rating_id, user_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 16, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 27, true);


--
-- Name: registratione_apartment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.registratione_apartment_id_seq', 8, true);


--
-- Name: registratione_lnmonline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.registratione_lnmonline_id_seq', 1, false);


--
-- Name: registratione_receipt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.registratione_receipt_id_seq', 1, false);


--
-- Name: star_ratings_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_ratings_rating_id_seq', 1, false);


--
-- Name: star_ratings_userrating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_ratings_userrating_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: registratione_apartment registratione_apartment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registratione_apartment
    ADD CONSTRAINT registratione_apartment_pkey PRIMARY KEY (id);


--
-- Name: registratione_lnmonline registratione_lnmonline_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registratione_lnmonline
    ADD CONSTRAINT registratione_lnmonline_pkey PRIMARY KEY (id);


--
-- Name: registratione_profile registratione_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registratione_profile
    ADD CONSTRAINT registratione_profile_pkey PRIMARY KEY (user_id);


--
-- Name: registratione_receipt registratione_receipt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registratione_receipt
    ADD CONSTRAINT registratione_receipt_pkey PRIMARY KEY (id);


--
-- Name: star_ratings_rating star_ratings_rating_content_type_id_object_id_f170c88b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star_ratings_rating
    ADD CONSTRAINT star_ratings_rating_content_type_id_object_id_f170c88b_uniq UNIQUE (content_type_id, object_id);


--
-- Name: star_ratings_rating star_ratings_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star_ratings_rating
    ADD CONSTRAINT star_ratings_rating_pkey PRIMARY KEY (id);


--
-- Name: star_ratings_userrating star_ratings_userrating_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star_ratings_userrating
    ADD CONSTRAINT star_ratings_userrating_pkey PRIMARY KEY (id);


--
-- Name: star_ratings_userrating star_ratings_userrating_user_id_rating_id_25ba0a69_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star_ratings_userrating
    ADD CONSTRAINT star_ratings_userrating_user_id_rating_id_25ba0a69_uniq UNIQUE (user_id, rating_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: registratione_apartment_location_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registratione_apartment_location_id ON public.registratione_apartment USING gist (location);


--
-- Name: star_ratings_rating_content_type_id_176abacc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX star_ratings_rating_content_type_id_176abacc ON public.star_ratings_rating USING btree (content_type_id);


--
-- Name: star_ratings_userrating_rating_id_e7ac9370; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX star_ratings_userrating_rating_id_e7ac9370 ON public.star_ratings_userrating USING btree (rating_id);


--
-- Name: star_ratings_userrating_user_id_33d5d349; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX star_ratings_userrating_user_id_33d5d349 ON public.star_ratings_userrating USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registratione_profile registratione_profile_user_id_da0cbf59_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registratione_profile
    ADD CONSTRAINT registratione_profile_user_id_da0cbf59_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: star_ratings_rating star_ratings_rating_content_type_id_176abacc_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star_ratings_rating
    ADD CONSTRAINT star_ratings_rating_content_type_id_176abacc_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: star_ratings_userrating star_ratings_userrat_rating_id_e7ac9370_fk_star_rati; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star_ratings_userrating
    ADD CONSTRAINT star_ratings_userrat_rating_id_e7ac9370_fk_star_rati FOREIGN KEY (rating_id) REFERENCES public.star_ratings_rating(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: star_ratings_userrating star_ratings_userrating_user_id_33d5d349_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star_ratings_userrating
    ADD CONSTRAINT star_ratings_userrating_user_id_33d5d349_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

