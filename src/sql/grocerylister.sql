--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: grocery_list; Type: TABLE; Schema: public; Owner: grocerylister; Tablespace:
--

CREATE TABLE grocery_list (
    id bigint NOT NULL,
    name character varying(255),
    last_modified timestamp without time zone DEFAULT now()
);


ALTER TABLE grocery_list OWNER TO grocerylister;

--
-- Name: grocery_list_id_seq; Type: SEQUENCE; Schema: public; Owner: grocerylister
--

CREATE SEQUENCE grocery_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grocery_list_id_seq OWNER TO grocerylister;

--
-- Name: grocery_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grocerylister
--

ALTER SEQUENCE grocery_list_id_seq OWNED BY grocery_list.id;


--
-- Name: grocery_list_product; Type: TABLE; Schema: public; Owner: grocerylister; Tablespace:
--

CREATE TABLE grocery_list_product (
    grocery_list_id bigint NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE grocery_list_product OWNER TO grocerylister;

--
-- Name: product; Type: TABLE; Schema: public; Owner: grocerylister; Tablespace:
--

CREATE TABLE product (
    id bigint NOT NULL,
    department character varying(255),
    name character varying(255)
);


ALTER TABLE product OWNER TO grocerylister;

--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: grocerylister
--

CREATE SEQUENCE product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product_id_seq OWNER TO grocerylister;

--
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grocerylister
--

ALTER SEQUENCE product_id_seq OWNED BY product.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: grocerylister
--

ALTER TABLE ONLY grocery_list ALTER COLUMN id SET DEFAULT nextval('grocery_list_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: grocerylister
--

ALTER TABLE ONLY product ALTER COLUMN id SET DEFAULT nextval('product_id_seq'::regclass);


--
-- Data for Name: grocery_list; Type: TABLE DATA; Schema: public; Owner: grocerylister
--

COPY grocery_list (id, name, last_modified) FROM stdin;
1	Fred Meyer	2016-05-25 08:10:41.094561
2	Trader Joes	2016-05-25 08:10:41.094561
\.


--
-- Name: grocery_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grocerylister
--

SELECT pg_catalog.setval('grocery_list_id_seq', 2, true);


--
-- Data for Name: grocery_list_product; Type: TABLE DATA; Schema: public; Owner: grocerylister
--

COPY grocery_list_product (grocery_list_id, product_id) FROM stdin;
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: grocerylister
--

COPY product (id, department, name) FROM stdin WITH DELIMITER ',';
1,Produce,Carrots
2,Produce,Pineapple
3,Produce,Mango
4,Produce,Salad
5,Produce,Tomatoes
6,Produce,Avocado
7,Produce,Potatoes
8,Produce,Strawberries
9,Produce,Raspberries
10,Produce,Blueberries
11,Produce,Nectarines
12,Produce,Peaches
13,Bread,Whole Wheat Bread
14,Bread,English Muffins
15,Bread,Bagels - Plain
16,Bread,Bagels - Cinnamon Raisin
17,Baking,Sugar
18,Baking,Flour
19,Baking,Brown Sugar
20,Baking,Powdered Sugar
21,Baking,PAM
22,Baking,Cake Mix - Yellow
23,Baking,Cake Mix - White
24,Baking,Cake Mix - Chocolate
25,Organic_Foods,Amy's Refried Black Beans
26,Organic_Foods,Amy's Refried Beans with Green Chiles
27,Cereal,Honey Nut Cheerios
28,Cereal,Oatmeal
29,Cereal,Instant Oatmeal - Blueberry
30,Cereal,Instant Oatmeal - Apple Cinnamon
31,Cereal,Instant Oatmeal - Cranberry Almond
32,Cereal,Instant Oatmeal - Cranberry and Blueberry
33,Cereal,Cream of Wheat
34,Cereal,Grits
35,Pet_Supplies,Poop Bags
36,Cleaning_Supplies,Dawn dish detergent
37,Cleaning_Supplies,Dishwasher packs
38,Cleaning_Supplies,Chlorox kitchen cleaner
39,Cleaning_Supplies,Toilet bowl cleaner
40,Cleaning_Supplies,Green scrubbies
41,Cleaning_Supplies,Garbage bags
42,Paper_Products,Paper Towels - Bounty
43,Paper_Products,Toilet Paper
44,Paper_Products,Kleenex
45,Condiments,Ketchup
46,Condiments,Mustard
47,Condiments,BBQ Sauce
48,Condiments,Dill pickles - small whole
49,Condiments,Dill pickles - spears
50,Condiments,Dill relish
51,Condiments,Sweet pickles
52,Condiments,Sweet relish
53,Condiments,Mustard relish
54,Condiments,Soy sauce
55,Soup,Tomato Bisque
56,Soup,Chicken Broth
57,Soup,Vegetable Broth
58,Soup,Beef Broth
59,Canned_Meat,Tuna
60,Canned_Vegetables,Corn
61,Canned_Vegetables,Sweet Peas
62,Canned_Vegetables,Green beans
63,Drinks,Kool-Aid Drink Drops
64,Drinks,Diet Root beer
65,Cookies,Milano
66,Crackers,Club
67,Crackers,Ritz
68,Crackers,Saltines
69,Crackers,Oyster crackers
70,Crackers,Chex Mix
71,Frozen,Ice cream
72,Frozen,Fruit
73,Frozen,Hash browns
74,Frozen,Fries
75,Meat,Steak
76,Meat,Ribs
77,Meat,Chicken
78,Meat,Turkey
79,Meat,Bacon
80,Meat,Sausage
81,Dairy,Butter - Stick
82,Dairy,Butter - Tub
83,Dairy,Cheese
84,Dairy,Milk
85,Dairy,Cream Cheese
86,Health,Zyrtec
87,Health,Toothpaste
88,Health,Floss
89,Health,Fiber gummies
90,Health,Miralax
91,Health,Aveeno Lavender Baby Lotion
\.


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grocerylister
--

SELECT pg_catalog.setval('product_id_seq', 92, true);


--
-- Name: grocery_list_pkey; Type: CONSTRAINT; Schema: public; Owner: grocerylister; Tablespace:
--

ALTER TABLE ONLY grocery_list
    ADD CONSTRAINT grocery_list_pkey PRIMARY KEY (id);


--
-- Name: product_pkey; Type: CONSTRAINT; Schema: public; Owner: grocerylister; Tablespace:
--

ALTER TABLE ONLY product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: fkm1vqvmq6b4iwi5ebi63eet2i7; Type: FK CONSTRAINT; Schema: public; Owner: grocerylister
--

ALTER TABLE ONLY grocery_list_product
    ADD CONSTRAINT fkm1vqvmq6b4iwi5ebi63eet2i7 FOREIGN KEY (product_id) REFERENCES product(id);


--
-- Name: fkm6ieludk2nt6gc86vu0gh9qkj; Type: FK CONSTRAINT; Schema: public; Owner: grocerylister
--

ALTER TABLE ONLY grocery_list_product
    ADD CONSTRAINT fkm6ieludk2nt6gc86vu0gh9qkj FOREIGN KEY (grocery_list_id) REFERENCES grocery_list(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: cjohannsen
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM cjohannsen;
GRANT ALL ON SCHEMA public TO cjohannsen;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
