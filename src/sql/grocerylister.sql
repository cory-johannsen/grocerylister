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
-- Name: id; Type: DEFAULT; Schema: public; Owner: grocerylister
--

ALTER TABLE ONLY grocery_list ALTER COLUMN id SET DEFAULT nextval('grocery_list_id_seq'::regclass);

--
-- Name: grocery_list_pkey; Type: CONSTRAINT; Schema: public; Owner: grocerylister; Tablespace:
--

ALTER TABLE ONLY grocery_list
    ADD CONSTRAINT grocery_list_pkey PRIMARY KEY (id);


--
-- Name: product; Type: TABLE; Schema: public; Owner: grocerylister; Tablespace:
--

CREATE TABLE product (
    id bigint NOT NULL,
    department_id bigint NOT NULL,
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

ALTER TABLE ONLY product ALTER COLUMN id SET DEFAULT nextval('product_id_seq'::regclass);



--
-- Name: product_pkey; Type: CONSTRAINT; Schema: public; Owner: grocerylister; Tablespace:
--

ALTER TABLE ONLY product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


ALTER TABLE ONLY product
    ADD CONSTRAINT product_department_id FOREIGN KEY (department_id) REFERENCES department(id);


--
-- Name: grocery_list_product; Type: TABLE; Schema: public; Owner: grocerylister; Tablespace:
--

CREATE TABLE grocery_list_product (
    grocery_list_id bigint NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE grocery_list_product OWNER TO grocerylister;


--
-- Name: grocery_list_product_product_id; Type: FK CONSTRAINT; Schema: public; Owner: grocerylister
--

ALTER TABLE ONLY grocery_list_product
    ADD CONSTRAINT grocery_list_product_product_id FOREIGN KEY (product_id) REFERENCES product(id);


--
-- Name: grocery_list_product_grocery_list_id; Type: FK CONSTRAINT; Schema: public; Owner: grocerylister
--

ALTER TABLE ONLY grocery_list_product
    ADD CONSTRAINT grocery_list_product_grocery_list_id FOREIGN KEY (grocery_list_id) REFERENCES grocery_list(id);



--
-- Name: store; Type: TABLE; Schema: public; Owner: grocerylister; Tablespace:
--

CREATE TABLE store (
    id bigint NOT NULL,
    name character varying(255),
    grocery_list_id bigint NOT NULL
);


ALTER TABLE store OWNER TO grocerylister;

--
-- Name: store_id_seq; Type: SEQUENCE; Schema: public; Owner: grocerylister
--

CREATE SEQUENCE store_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE store_id_seq OWNER TO grocerylister;

--
-- Name: grocery_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grocerylister
--

ALTER SEQUENCE store_id_seq OWNED BY store.id;

--
-- Name: store_pkey; Type: CONSTRAINT; Schema: public; Owner: grocerylister; Tablespace:
--

ALTER TABLE ONLY store
    ADD CONSTRAINT store_pkey PRIMARY KEY (id);

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: grocerylister
--

ALTER TABLE ONLY store ALTER COLUMN id SET DEFAULT nextval('store_id_seq'::regclass);



--
-- Name: department; Type: TABLE; Schema: public; Owner: grocerylister; Tablespace:
--

CREATE TABLE department (
    id bigint NOT NULL,
    name character varying(255)
);

ALTER TABLE department OWNER TO grocerylister;

--
-- Name: department_id_seq; Type: SEQUENCE; Schema: public; Owner: grocerylister
--

CREATE SEQUENCE department_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE department_id_seq OWNER TO grocerylister;

--
-- Name: grocery_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grocerylister
--

ALTER SEQUENCE department_id_seq OWNED BY department.id;

--
-- Name: department_pkey; Type: CONSTRAINT; Schema: public; Owner: grocerylister; Tablespace:
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: grocerylister
--

ALTER TABLE ONLY department ALTER COLUMN id SET DEFAULT nextval('department_id_seq'::regclass);



--
-- Name: store_department; Type: TABLE; Schema: public; Owner: grocerylister; Tablespace:
--

CREATE TABLE store_department (
    store_id bigint NOT NULL,
    department_id bigint NOT NULL,
    index int NOT NULL
);

ALTER TABLE store_department OWNER TO grocerylister;


--
-- Name: grocery_list_product_product_id; Type: FK CONSTRAINT; Schema: public; Owner: grocerylister
--

ALTER TABLE ONLY store_department
    ADD CONSTRAINT store_department_store_id FOREIGN KEY (store_id) REFERENCES store(id);


--
-- Name: grocery_list_product_grocery_list_id; Type: FK CONSTRAINT; Schema: public; Owner: grocerylister
--

ALTER TABLE ONLY store_department
    ADD CONSTRAINT store_department_department_id FOREIGN KEY (department_id) REFERENCES department(id);




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
