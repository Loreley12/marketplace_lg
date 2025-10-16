--
-- PostgreSQL database dump
--

\restrict 03Oj3pEiBfTZI7yn1DHzbGZGdIJgwKD0y7xIAOdEDIO8kTntIU6iwDmjZlL4eMn

-- Dumped from database version 17.6 (Debian 17.6-1.pgdg13+1)
-- Dumped by pg_dump version 17.6 (Debian 17.6-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: order_details_audit_action; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.order_details_audit_action AS ENUM (
    'UPDATE',
    'DELETE',
    'INSERT'
);


--
-- Name: orders_audit_action; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.orders_audit_action AS ENUM (
    'UPDATE',
    'DELETE',
    'INSERT'
);


--
-- Name: payments_audit_action; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.payments_audit_action AS ENUM (
    'UPDATE',
    'DELETE',
    'INSERT'
);


--
-- Name: products_audit_action; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.products_audit_action AS ENUM (
    'UPDATE',
    'DELETE',
    'INSERT'
);


--
-- Name: reviews_audit_action; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.reviews_audit_action AS ENUM (
    'UPDATE',
    'DELETE',
    'INSERT'
);


--
-- Name: low_stock_products(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.low_stock_products(min_stock integer) RETURNS TABLE(product_id integer, product_name text, stock integer)
    LANGUAGE sql
    AS $$
    SELECT 
        p.id, p.name, p.stock
    FROM products p
    WHERE p.stock < min_stock;
$$;


--
-- Name: order_details_ai_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.order_details_ai_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('app.from_order_details_trigger','1', true);
  INSERT INTO order_details_audit(order_detail_key, "actionOrderDetail", before_data, after_data)
  VALUES (NEW.order_id || '-' || NEW.product_id, 'INSERT', NULL, to_jsonb(NEW));
  PERFORM set_config('app.from_order_details_trigger','', true);
  RETURN NEW;
END$$;


--
-- Name: order_details_au_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.order_details_au_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('app.from_order_details_trigger','1', true);
  INSERT INTO order_details_audit(order_detail_key, "actionOrderDetail", before_data, after_data)
  VALUES (NEW.order_id || '-' || NEW.product_id, 'UPDATE', to_jsonb(OLD), to_jsonb(NEW));
  PERFORM set_config('app.from_order_details_trigger','', true);
  RETURN NEW;
END$$;


--
-- Name: order_details_audit_block_bd(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.order_details_audit_block_bd() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'order_details_audit es inmutable: DELETE prohibido.';
END$$;


--
-- Name: order_details_audit_block_bu(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.order_details_audit_block_bu() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'order_details_audit es inmutable: UPDATE prohibido.';
END$$;


--
-- Name: order_details_audit_guard_bi(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.order_details_audit_guard_bi() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE flag text;
BEGIN
  flag := current_setting('app.from_order_details_trigger', true);
  IF COALESCE(flag,'0') <> '1' THEN
    RAISE EXCEPTION 'INSERT en order_details_audit solo permitido desde triggers de order_details.';
  END IF;
  RETURN NEW;
END$$;


--
-- Name: order_details_bd_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.order_details_bd_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('app.from_order_details_trigger','1', true);
  INSERT INTO order_details_audit(order_detail_key, "actionOrderDetail", before_data, after_data)
  VALUES (OLD.order_id || '-' || OLD.product_id, 'DELETE', to_jsonb(OLD), NULL);
  PERFORM set_config('app.from_order_details_trigger','', true);
  RETURN OLD;
END$$;


--
-- Name: orders_ai_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.orders_ai_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('app.from_orders_trigger','1', true);

  INSERT INTO orders_audit(order_id, "actionOrder", before_data, after_data)
  VALUES (NEW.id, 'INSERT', NULL, to_jsonb(NEW));

  PERFORM set_config('app.from_orders_trigger','', true);
  RETURN NEW;
END$$;


--
-- Name: orders_au_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.orders_au_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('app.from_orders_trigger','1', true);

  INSERT INTO orders_audit(order_id, "actionOrder", before_data, after_data)
  VALUES (NEW.id, 'UPDATE', to_jsonb(OLD), to_jsonb(NEW));

  PERFORM set_config('app.from_orders_trigger','', true);
  RETURN NEW;
END$$;


--
-- Name: orders_audit_block_bd(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.orders_audit_block_bd() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'orders_audit es inmutable: DELETE prohibido.';
END$$;


--
-- Name: orders_audit_block_bu(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.orders_audit_block_bu() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'orders_audit es inmutable: UPDATE prohibido.';
END$$;


--
-- Name: orders_audit_guard_bi(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.orders_audit_guard_bi() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE flag text;
BEGIN
  flag := current_setting('app.from_orders_trigger', true);
  IF COALESCE(flag,'0') <> '1' THEN
    RAISE EXCEPTION 'INSERT en orders_audit solo permitido desde triggers de orders.';
  END IF;
  RETURN NEW;
END$$;


--
-- Name: orders_bd_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.orders_bd_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('app.from_orders_trigger','1', true);

  INSERT INTO orders_audit(order_id, "actionOrder", before_data, after_data)
  VALUES (OLD.id, 'DELETE', to_jsonb(OLD), NULL);

  PERFORM set_config('app.from_orders_trigger','', true);
  RETURN OLD;
END$$;


--
-- Name: orders_between_dates(date, date); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.orders_between_dates(p_start_date date, p_end_date date) RETURNS TABLE(order_id integer, customer_id integer, order_date date, order_total numeric)
    LANGUAGE sql
    AS $$
    SELECT 
        o.id AS order_id,
        o.customer_id,
        o.order_date,
        o.total AS order_total
    FROM orders o
    WHERE o.order_date BETWEEN p_start_date AND p_end_date;
$$;


--
-- Name: orders_by_customer(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.orders_by_customer(p_customer_id integer) RETURNS TABLE(order_id integer, order_date date, order_total numeric)
    LANGUAGE sql
    AS $$
    SELECT 
        o.id AS order_id,
        o.order_date,
        o.total AS order_total
    FROM orders o
    WHERE o.customer_id = p_customer_id;
$$;


--
-- Name: payments_ai_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.payments_ai_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('app.from_payments_trigger','1', true);
  INSERT INTO payments_audit(payment_id, "actionPayment", before_data, after_data)
  VALUES (NEW.id, 'INSERT', NULL, to_jsonb(NEW));
  PERFORM set_config('app.from_payments_trigger','', true);
  RETURN NEW;
END$$;


--
-- Name: payments_au_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.payments_au_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('app.from_payments_trigger','1', true);
  INSERT INTO payments_audit(payment_id, "actionPayment", before_data, after_data)
  VALUES (NEW.id, 'UPDATE', to_jsonb(OLD), to_jsonb(NEW));
  PERFORM set_config('app.from_payments_trigger','', true);
  RETURN NEW;
END$$;


--
-- Name: payments_audit_block_bd(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.payments_audit_block_bd() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'payments_audit es inmutable: DELETE prohibido.';
END$$;


--
-- Name: payments_audit_block_bu(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.payments_audit_block_bu() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'payments_audit es inmutable: UPDATE prohibido.';
END$$;


--
-- Name: payments_audit_guard_bi(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.payments_audit_guard_bi() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE flag text;
BEGIN
  flag := current_setting('app.from_payments_trigger', true);
  IF COALESCE(flag,'0') <> '1' THEN
    RAISE EXCEPTION 'INSERT en payments_audit solo permitido desde triggers de payments.';
  END IF;
  RETURN NEW;
END$$;


--
-- Name: payments_bd_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.payments_bd_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('app.from_payments_trigger','1', true);
  INSERT INTO payments_audit(payment_id, "actionPayment", before_data, after_data)
  VALUES (OLD.id, 'DELETE', to_jsonb(OLD), NULL);
  PERFORM set_config('app.from_payments_trigger','', true);
  RETURN OLD;
END$$;


--
-- Name: products_ai_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.products_ai_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('app.from_products_trigger','1', true);
  INSERT INTO products_audit(product_id, "actionProduct", before_data, after_data)
  VALUES (NEW.id, 'INSERT', NULL, to_jsonb(NEW));
  PERFORM set_config('app.from_products_trigger','', true);
  RETURN NEW;
END$$;


--
-- Name: products_au_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.products_au_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('app.from_products_trigger','1', true);
  INSERT INTO products_audit(product_id, "actionProduct", before_data, after_data)
  VALUES (NEW.id, 'UPDATE', to_jsonb(OLD), to_jsonb(NEW));
  PERFORM set_config('app.from_products_trigger','', true);
  RETURN NEW;
END$$;


--
-- Name: products_audit_block_bd(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.products_audit_block_bd() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'products_audit es inmutable: DELETE prohibido.';
END$$;


--
-- Name: products_audit_block_bu(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.products_audit_block_bu() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'products_audit es inmutable: UPDATE prohibido.';
END$$;


--
-- Name: products_audit_guard_bi(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.products_audit_guard_bi() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE flag text;
BEGIN
  flag := current_setting('app.from_products_trigger', true);
  IF COALESCE(flag,'0') <> '1' THEN
    RAISE EXCEPTION 'INSERT en products_audit solo permitido desde triggers de products.';
  END IF;
  RETURN NEW;
END$$;


--
-- Name: products_bd_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.products_bd_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('app.from_products_trigger','1', true);
  INSERT INTO products_audit(product_id, "actionProduct", before_data, after_data)
  VALUES (OLD.id, 'DELETE', to_jsonb(OLD), NULL);
  PERFORM set_config('app.from_products_trigger','', true);
  RETURN OLD;
END$$;


--
-- Name: products_by_category(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.products_by_category(p_category_id integer) RETURNS TABLE(product_id integer, product_name text, stock integer, price numeric)
    LANGUAGE sql
    AS $$
    SELECT 
        p.id, p.name, p.stock, p.price
    FROM products p
    WHERE p.category_id = p_category_id;
$$;


--
-- Name: products_by_seller(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.products_by_seller(p_seller_id integer) RETURNS TABLE(product_id integer, product_name text, stock integer, price numeric)
    LANGUAGE sql
    AS $$
    SELECT 
        p.id, p.name, p.stock, p.price
    FROM products p
    WHERE p.seller_id = p_seller_id;
$$;


--
-- Name: reviews_ai_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.reviews_ai_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('app.from_reviews_trigger','1', true);
  INSERT INTO reviews_audit(review_id, "actionReview", before_data, after_data)
  VALUES (NEW.id, 'INSERT', NULL, to_jsonb(NEW));
  PERFORM set_config('app.from_reviews_trigger','', true);
  RETURN NEW;
END$$;


--
-- Name: reviews_au_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.reviews_au_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('app.from_reviews_trigger','1', true);
  INSERT INTO reviews_audit(review_id, "actionReview", before_data, after_data)
  VALUES (NEW.id, 'UPDATE', to_jsonb(OLD), to_jsonb(NEW));
  PERFORM set_config('app.from_reviews_trigger','', true);
  RETURN NEW;
END$$;


--
-- Name: reviews_audit_block_bd(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.reviews_audit_block_bd() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'reviews_audit es inmutable: DELETE prohibido.';
END$$;


--
-- Name: reviews_audit_block_bu(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.reviews_audit_block_bu() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'reviews_audit es inmutable: UPDATE prohibido.';
END$$;


--
-- Name: reviews_audit_guard_bi(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.reviews_audit_guard_bi() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE flag text;
BEGIN
  flag := current_setting('app.from_reviews_trigger', true);
  IF COALESCE(flag,'0') <> '1' THEN
    RAISE EXCEPTION 'INSERT en reviews_audit solo permitido desde triggers de reviews.';
  END IF;
  RETURN NEW;
END$$;


--
-- Name: reviews_bd_audit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.reviews_bd_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM set_config('app.from_reviews_trigger','1', true);
  INSERT INTO reviews_audit(review_id, "actionReview", before_data, after_data)
  VALUES (OLD.id, 'DELETE', to_jsonb(OLD), NULL);
  PERFORM set_config('app.from_reviews_trigger','', true);
  RETURN OLD;
END$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(64),
    created_at character varying(50)
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100),
    phone character varying(50),
    address character varying(150),
    last_name character varying(50),
    created_at character varying(50)
);


--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: order_details; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_details (
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer,
    price numeric(10,2)
);


--
-- Name: order_details_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_details_audit (
    audit_id bigint NOT NULL,
    order_detail_key text NOT NULL,
    "actionOrderDetail" public.order_details_audit_action NOT NULL,
    changed_at timestamp with time zone DEFAULT now(),
    changed_by text DEFAULT 'Admin'::text,
    before_data jsonb,
    after_data jsonb
);


--
-- Name: order_details_audit_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.order_details_audit ALTER COLUMN audit_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.order_details_audit_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    order_date date,
    total numeric(10,2),
    total_amount real
);


--
-- Name: orders_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders_audit (
    audit_id bigint NOT NULL,
    order_id bigint NOT NULL,
    "actionOrder" public.orders_audit_action NOT NULL,
    changed_at timestamp with time zone DEFAULT now() NOT NULL,
    changed_by text DEFAULT 'Admin'::text NOT NULL,
    before_data jsonb,
    after_data jsonb
);


--
-- Name: orders_audit_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.orders_audit ALTER COLUMN audit_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.orders_audit_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    order_id integer,
    payment_date date,
    amount numeric(10,2),
    method character varying(50),
    payment_method character varying(50)
);


--
-- Name: payments_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payments_audit (
    audit_id bigint NOT NULL,
    payment_id bigint NOT NULL,
    "actionPayment" public.payments_audit_action NOT NULL,
    changed_at timestamp with time zone DEFAULT now(),
    changed_by text DEFAULT 'Admin'::text,
    before_data jsonb,
    after_data jsonb
);


--
-- Name: payments_audit_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.payments_audit ALTER COLUMN audit_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.payments_audit_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- Name: product_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_tags (
    product_id integer NOT NULL,
    tag_id integer NOT NULL,
    product_name character varying(50),
    tag_name character varying(50)
);


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id integer NOT NULL,
    seller_id integer NOT NULL,
    category_id integer NOT NULL,
    name character varying(100) NOT NULL,
    price numeric(10,2),
    stock integer,
    status character varying(20),
    description character varying(64),
    created_at character varying(50)
);


--
-- Name: products_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_audit (
    audit_id bigint NOT NULL,
    product_id bigint NOT NULL,
    "actionProduct" public.products_audit_action NOT NULL,
    changed_at timestamp with time zone DEFAULT now(),
    changed_by text DEFAULT 'Admin'::text,
    before_data jsonb,
    after_data jsonb
);


--
-- Name: products_audit_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_audit ALTER COLUMN audit_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.products_audit_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    product_id integer NOT NULL,
    rating integer,
    comment text,
    review_comment character varying(128),
    CONSTRAINT reviews_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


--
-- Name: reviews_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reviews_audit (
    audit_id bigint NOT NULL,
    review_id bigint NOT NULL,
    "actionReview" public.reviews_audit_action NOT NULL,
    changed_at timestamp with time zone DEFAULT now(),
    changed_by text DEFAULT 'Admin'::text,
    before_data jsonb,
    after_data jsonb
);


--
-- Name: reviews_audit_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.reviews_audit ALTER COLUMN audit_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reviews_audit_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: sellers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sellers (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100),
    phone character varying(50),
    address character varying(150),
    created_at character varying(50)
);


--
-- Name: sellers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sellers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sellers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sellers_id_seq OWNED BY public.sellers.id;


--
-- Name: shippings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shippings (
    id integer NOT NULL,
    order_id integer,
    address character varying(150),
    shipping_date date,
    tracking_code character varying(50),
    shipping_address character varying(50),
    tracking_number character varying(50)
);


--
-- Name: shippings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.shippings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shippings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.shippings_id_seq OWNED BY public.shippings.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: sellers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sellers ALTER COLUMN id SET DEFAULT nextval('public.sellers_id_seq'::regclass);


--
-- Name: shippings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shippings ALTER COLUMN id SET DEFAULT nextval('public.shippings_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.categories (id, name, description, created_at) FROM stdin;
1	Automotriz	Equipos y accesorios informáticos.	2022-06-11
2	Muebles	Prendas de vestir y accesorios de moda para todas las edades.	2021-07-23
3	Juguetes	Artículos y alimentos para el cuidado de mascotas.	2020-05-25
4	Belleza y Cuidado Personal	Teléfonos móviles y accesorios más vendidos en Colombia.	2023-06-26
5	Libros	Muebles para el hogar y la oficina.	2020-09-24
6	Belleza y Cuidado Personal	Juguetes y juegos educativos para niños de todas las edades.	2023-11-10
7	Ropa y Accesorios	Accesorios, repuestos y herramientas para automóviles y motos.	2023-11-08
8	Juguetes	Productos de belleza, maquillaje y cuidado personal.	2022-01-07
9	Belleza y Cuidado Personal	Juguetes y juegos educativos para niños de todas las edades.	2021-01-05
10	Juguetes	Productos de belleza, maquillaje y cuidado personal.	2020-02-24
11	Automotriz	Productos tecnológicos y gadgets populares en Colombia.	2024-12-05
12	Deportes	Juguetes y juegos educativos para niños de todas las edades.	2025-05-28
13	Electrónica	Equipos y ropa deportiva para uso profesional y recreativo.	2021-05-24
14	Automotriz	Juguetes y juegos educativos para niños de todas las edades.	2022-02-03
15	Automotriz	Artículos para el hogar, cocina y decoración.	2024-09-07
16	Belleza y Cuidado Personal	Productos tecnológicos y gadgets populares en Colombia.	2022-03-31
17	Hogar y Cocina	Libros de autores nacionales e internacionales.	2024-03-16
18	Hogar y Cocina	Equipos y ropa deportiva para uso profesional y recreativo.	2022-08-03
19	Computadores	Muebles para el hogar y la oficina.	2020-11-26
20	Juguetes	Equipos y ropa deportiva para uso profesional y recreativo.	2021-06-04
21	Ropa y Accesorios	Productos tecnológicos y gadgets populares en Colombia.	2023-10-11
22	Electrónica	Juguetes y juegos educativos para niños de todas las edades.	2025-07-01
23	Ropa y Accesorios	Teléfonos móviles y accesorios más vendidos en Colombia.	2025-05-26
24	Mascotas	Equipos y accesorios informáticos.	2022-04-14
25	Belleza y Cuidado Personal	Prendas de vestir y accesorios de moda para todas las edades.	2023-05-02
26	Celulares	Libros de autores nacionales e internacionales.	2023-03-07
27	Ropa y Accesorios	Muebles para el hogar y la oficina.	2023-10-10
28	Belleza y Cuidado Personal	Productos de belleza, maquillaje y cuidado personal.	2020-09-20
29	Automotriz	Teléfonos móviles y accesorios más vendidos en Colombia.	2025-05-13
30	Mascotas	Teléfonos móviles y accesorios más vendidos en Colombia.	2020-01-18
31	Mascotas	Artículos y alimentos para el cuidado de mascotas.	2024-08-06
32	Automotriz	Artículos para el hogar, cocina y decoración.	2021-08-02
33	Computadores	Equipos y ropa deportiva para uso profesional y recreativo.	2020-09-26
34	Ropa y Accesorios	Teléfonos móviles y accesorios más vendidos en Colombia.	2021-10-24
35	Electrónica	Productos de belleza, maquillaje y cuidado personal.	2022-03-07
36	Deportes	Equipos y accesorios informáticos.	2025-01-16
37	Libros	Accesorios, repuestos y herramientas para automóviles y motos.	2021-05-02
38	Hogar y Cocina	Teléfonos móviles y accesorios más vendidos en Colombia.	2021-06-20
39	Hogar y Cocina	Accesorios, repuestos y herramientas para automóviles y motos.	2023-12-26
40	Juguetes	Equipos y ropa deportiva para uso profesional y recreativo.	2020-07-27
41	Belleza y Cuidado Personal	Artículos para el hogar, cocina y decoración.	2020-09-23
42	Belleza y Cuidado Personal	Equipos y accesorios informáticos.	2025-01-08
43	Deportes	Productos tecnológicos y gadgets populares en Colombia.	2021-03-18
44	Juguetes	Teléfonos móviles y accesorios más vendidos en Colombia.	2024-01-14
45	Celulares	Artículos para el hogar, cocina y decoración.	2024-04-21
46	Deportes	Productos tecnológicos y gadgets populares en Colombia.	2022-03-27
47	Electrónica	Libros de autores nacionales e internacionales.	2022-02-19
48	Belleza y Cuidado Personal	Productos tecnológicos y gadgets populares en Colombia.	2021-06-13
49	Ropa y Accesorios	Equipos y accesorios informáticos.	2022-01-03
50	Deportes	Accesorios, repuestos y herramientas para automóviles y motos.	2022-03-24
51	Hogar y Cocina	Accesorios, repuestos y herramientas para automóviles y motos.	2021-10-03
52	Deportes	Libros de autores nacionales e internacionales.	2023-06-05
53	Mascotas	Equipos y ropa deportiva para uso profesional y recreativo.	2020-11-02
54	Celulares	Juguetes y juegos educativos para niños de todas las edades.	2022-04-05
55	Computadores	Productos tecnológicos y gadgets populares en Colombia.	2023-04-22
56	Mascotas	Accesorios, repuestos y herramientas para automóviles y motos.	2024-08-16
57	Electrónica	Equipos y accesorios informáticos.	2024-11-12
58	Ropa y Accesorios	Juguetes y juegos educativos para niños de todas las edades.	2021-01-06
59	Automotriz	Productos de belleza, maquillaje y cuidado personal.	2022-10-25
60	Automotriz	Productos tecnológicos y gadgets populares en Colombia.	2023-03-05
61	Belleza y Cuidado Personal	Prendas de vestir y accesorios de moda para todas las edades.	2022-11-11
62	Libros	Libros de autores nacionales e internacionales.	2021-06-28
63	Juguetes	Prendas de vestir y accesorios de moda para todas las edades.	2025-02-13
64	Automotriz	Equipos y ropa deportiva para uso profesional y recreativo.	2024-05-26
65	Juguetes	Equipos y accesorios informáticos.	2025-07-19
66	Belleza y Cuidado Personal	Accesorios, repuestos y herramientas para automóviles y motos.	2024-08-22
67	Automotriz	Artículos y alimentos para el cuidado de mascotas.	2020-04-01
68	Mascotas	Prendas de vestir y accesorios de moda para todas las edades.	2025-06-04
69	Computadores	Equipos y accesorios informáticos.	2023-08-20
70	Belleza y Cuidado Personal	Libros de autores nacionales e internacionales.	2020-02-21
71	Computadores	Equipos y accesorios informáticos.	2020-01-08
72	Belleza y Cuidado Personal	Equipos y accesorios informáticos.	2025-03-27
73	Juguetes	Artículos y alimentos para el cuidado de mascotas.	2023-02-10
74	Deportes	Productos de belleza, maquillaje y cuidado personal.	2025-04-05
75	Computadores	Prendas de vestir y accesorios de moda para todas las edades.	2022-05-13
76	Juguetes	Equipos y accesorios informáticos.	2020-08-30
77	Deportes	Muebles para el hogar y la oficina.	2021-01-14
78	Muebles	Muebles para el hogar y la oficina.	2021-10-07
79	Ropa y Accesorios	Muebles para el hogar y la oficina.	2020-07-03
80	Ropa y Accesorios	Libros de autores nacionales e internacionales.	2020-09-03
81	Mascotas	Equipos y accesorios informáticos.	2024-12-30
82	Electrónica	Productos tecnológicos y gadgets populares en Colombia.	2022-10-06
83	Deportes	Productos tecnológicos y gadgets populares en Colombia.	2022-06-19
84	Computadores	Productos tecnológicos y gadgets populares en Colombia.	2024-02-25
85	Deportes	Juguetes y juegos educativos para niños de todas las edades.	2024-12-05
86	Automotriz	Productos de belleza, maquillaje y cuidado personal.	2021-11-15
87	Mascotas	Equipos y ropa deportiva para uso profesional y recreativo.	2022-06-16
88	Computadores	Juguetes y juegos educativos para niños de todas las edades.	2023-03-10
89	Deportes	Productos de belleza, maquillaje y cuidado personal.	2022-07-23
90	Hogar y Cocina	Productos tecnológicos y gadgets populares en Colombia.	2024-05-08
91	Ropa y Accesorios	Equipos y ropa deportiva para uso profesional y recreativo.	2020-01-29
92	Celulares	Teléfonos móviles y accesorios más vendidos en Colombia.	2022-06-24
93	Belleza y Cuidado Personal	Juguetes y juegos educativos para niños de todas las edades.	2024-12-23
94	Mascotas	Productos tecnológicos y gadgets populares en Colombia.	2024-06-01
95	Computadores	Equipos y ropa deportiva para uso profesional y recreativo.	2023-05-07
96	Electrónica	Juguetes y juegos educativos para niños de todas las edades.	2023-04-03
97	Deportes	Libros de autores nacionales e internacionales.	2023-11-09
98	Muebles	Teléfonos móviles y accesorios más vendidos en Colombia.	2025-09-20
99	Hogar y Cocina	Prendas de vestir y accesorios de moda para todas las edades.	2020-01-06
100	Deportes	Teléfonos móviles y accesorios más vendidos en Colombia.	2024-11-05
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers (id, name, email, phone, address, last_name, created_at) FROM stdin;
1	Plácido	plácido.bayón@gmail.com	+57 1695593532	Ronda Lola Arribas #60, Medellín	Bayón	2021-05-16
2	Pedro	pedro.vila@outlook.com	+57 2653637766	Cañada Ignacio Camacho #380, Pereira	Vila	2020-05-01
3	Sebastian	sebastian.villanueva@gmail.com	+57 8749346907	Via de Francisco Jose Luz #7, Barranquilla	Villanueva	2024-04-30
4	Chus	chus.sáenz@outlook.com	+57 5233075166	Plaza de Araceli Fernandez #72, Bogotá	Sáenz	2021-06-08
5	Maura	maura.castilla@yahoo.com	+57 4285719143	Vial de Cándida Hernandez #74, Bogotá	Castilla	2025-07-10
6	Serafina	serafina.santamaría@hotmail.com	+57 7898887110	Cuesta de Julia Sureda #4, Bogotá	Santamaría	2024-11-09
7	Toribio	toribio.merino@hotmail.com	+57 3515967037	C. Manola Conesa #3, Bucaramanga	Merino	2025-08-24
8	Brígida	brígida.naranjo@outlook.com	+57 6106924445	Ronda Anabel Santos #16, Cali	Naranjo	2025-05-23
9	Iris	iris.serra@gmail.com	+57 1797535324	Rambla de Victor Aliaga #72, Bucaramanga	Serra	2020-11-25
10	Nicolás	nicolás.peralta@gmail.com	+57 1787391698	Glorieta de Berto Aguirre #90, Manizales	Peralta	2025-07-01
11	Lucio	lucio.cortes@yahoo.com	+57 2184478271	Urbanización de Apolonia Carlos #14, Bogotá	Cortes	2020-04-29
12	Lorenzo	lorenzo.serrano@hotmail.com	+57 5828589306	C. Georgina Palmer #2, Manizales	Serrano	2024-04-15
13	Ariel	ariel.romeu@outlook.com	+57 8274355026	Plaza Gema Mínguez #364, Cali	Romeu	2022-11-18
14	Daniel	daniel.iglesia@yahoo.com	+57 2405406612	Acceso Ángeles Castells #54, Cartagena	Iglesia	2020-03-29
15	Ale	ale.roldan@outlook.com	+57 1062072746	Ronda de Alejo Rojas #45, Cali	Roldan	2022-03-29
16	Alejo	alejo.alemany@gmail.com	+57 4189416402	Via Bautista Millán #1, Medellín	Alemany	2021-01-07
17	José Ángel	joséángel.bermejo@outlook.com	+57 7294667748	Rambla Ramona Becerra #576, Bogotá	Bermejo	2022-07-04
18	Ascensión	ascensión.gual@outlook.com	+57 6546763319	Cañada Emilia Olivera #5, Cartagena	Gual	2024-09-13
19	Elvira	elvira.royo@hotmail.com	+57 8352641495	Avenida de Humberto Villena #40, Bogotá	Royo	2023-08-27
20	Rosalía	rosalía.lopez@yahoo.com	+57 9278765396	Calle Severino Garcés #53, Manizales	Lopez	2023-01-21
21	Ariel	ariel.izaguirre@gmail.com	+57 8256247351	Paseo de Selena Abril #27, Pereira	Izaguirre	2020-06-09
22	Sandalio	sandalio.márquez@outlook.com	+57 9058528635	Pasadizo de Bárbara Riba #46, Bucaramanga	Márquez	2024-05-09
23	Amarilis	amarilis.diéguez@outlook.com	+57 1779088378	Callejón de Manuela Haro #6, Cali	Diéguez	2024-05-03
24	Luna	luna.perales@gmail.com	+57 6477140925	Ronda Iris Carvajal #64, Medellín	Perales	2025-04-02
25	Brígida	brígida.bertrán@outlook.com	+57 9741262814	Avenida Rogelio Salazar #54, Manizales	Bertrán	2021-07-16
26	Elpidio	elpidio.río@outlook.com	+57 6887489792	Cañada de Edu Juan #9, Medellín	Río	2021-07-03
27	María Dolores	maríadolores.céspedes@outlook.com	+57 4293805027	Avenida de Alicia Peñalver #399, Barranquilla	Céspedes	2020-12-23
28	Remigio	remigio.luís@hotmail.com	+57 5571490655	Vial Marco Cornejo #62, Medellín	Luís	2020-06-04
29	Fidel	fidel.izaguirre@hotmail.com	+57 0408163506	Paseo Cesar Roca #13, Bucaramanga	Izaguirre	2024-04-03
30	Fermín	fermín.durán@yahoo.com	+57 4485811959	Avenida Rufino Quesada #25, Barranquilla	Durán	2023-02-15
31	Modesta	modesta.palomares@outlook.com	+57 6777055268	Paseo Maura Bauzà #1, Bogotá	Palomares	2020-06-24
32	María Teresa	maríateresa.salas@yahoo.com	+57 7118558994	Calle Trinidad Arenas #28, Cartagena	Salas	2024-04-04
33	José Mari	josémari.carbonell@gmail.com	+57 1238344733	C. Amparo Iniesta #591, Barranquilla	Carbonell	2025-10-01
34	David	david.sanchez@outlook.com	+57 8861244049	Rambla Luisina Espejo #331, Medellín	Sanchez	2021-07-02
35	Ruperto	ruperto.alemany@outlook.com	+57 9500791852	Acceso de Begoña Vives #768, Bucaramanga	Alemany	2024-10-20
36	Paula	paula.priego@gmail.com	+57 4306238251	Cuesta Tomasa Dávila #85, Cali	Priego	2022-07-31
37	Luciana	luciana.carrera@gmail.com	+57 0391115449	Cuesta de Fernanda Casares #458, Barranquilla	Carrera	2020-05-11
38	Marisa	marisa.mora@hotmail.com	+57 8588793012	Ronda Rosalva Cámara #17, Bogotá	Mora	2024-07-10
39	Tristán	tristán.boada@hotmail.com	+57 4267292334	Urbanización Bartolomé Tovar #90, Cali	Boada	2024-11-23
40	Calisto	calisto.serna@gmail.com	+57 5358072092	Vial de Elías Salazar #370, Bogotá	Serna	2022-08-18
41	Eva	eva.aramburu@hotmail.com	+57 9930318438	C. Buenaventura Cañete #60, Cartagena	Aramburu	2021-06-25
42	Reyna	reyna.cabello@yahoo.com	+57 6002681638	Paseo de Marco Cañellas #71, Barranquilla	Cabello	2024-04-09
43	Cristian	cristian.millán@hotmail.com	+57 1135881750	Calle Juan Antonio Cornejo #55, Barranquilla	Millán	2022-10-14
44	Marita	marita.carbó@outlook.com	+57 0220326107	Calle Josefina Girona #47, Cali	Carbó	2025-05-24
45	Wilfredo	wilfredo.jover@outlook.com	+57 6549145437	Acceso Angelino Carranza #1, Cali	Jover	2023-09-10
46	Sabina	sabina.azcona@gmail.com	+57 6616745001	Rambla de Raúl Ribas #54, Bogotá	Azcona	2020-01-23
47	Máximo	máximo.amigó@yahoo.com	+57 9491548512	Calle Eva María Trillo #60, Pereira	Amigó	2024-08-01
48	Milagros	milagros.banos@gmail.com	+57 6497461114	Rambla Amador Reina #358, Manizales	Baños	2025-07-04
49	Chuy	chuy.casares@gmail.com	+57 9149770544	Camino de Lucho Palma #9, Bucaramanga	Casares	2021-02-23
50	Jafet	jafet.bravo@yahoo.com	+57 4570255053	Vial Débora Vigil #36, Bucaramanga	Bravo	2023-02-14
51	Álvaro	álvaro.villegas@yahoo.com	+57 2041690497	Glorieta Jose Luis Yuste #95, Bogotá	Villegas	2022-08-08
52	Macaria	macaria.aguilera@outlook.com	+57 4409708393	Avenida de Cebrián Márquez #1, Cartagena	Aguilera	2022-11-28
53	Caridad	caridad.perez@gmail.com	+57 9342734959	Avenida de Rocío Pacheco #87, Manizales	Perez	2025-05-21
54	Micaela	micaela.gárate@outlook.com	+57 0364549000	Alameda de Miguel Ángel Diaz #66, Medellín	Gárate	2022-01-18
55	Felipe	felipe.gimenez@outlook.com	+57 3030424158	Camino de Jose Francisco Angulo #292, Barranquilla	Gimenez	2022-05-09
56	Rita	rita.palma@hotmail.com	+57 7054383054	Pasadizo Héctor Huerta #12, Medellín	Palma	2021-05-19
57	Zaira	zaira.bolanos@outlook.com	+57 7069931237	Acceso Florentina Perera #31, Cartagena	Bolaños	2025-08-26
58	Marta	marta.iniesta@yahoo.com	+57 1954796930	Alameda de Gabriela Abella #8, Medellín	Iniesta	2025-02-11
59	Modesto	modesto.santos@gmail.com	+57 5514287064	Plaza de Atilio Ponce #81, Bogotá	Santos	2025-07-30
60	Soledad	soledad.bustos@gmail.com	+57 8606764111	Glorieta Amaya Daza #8, Medellín	Bustos	2023-11-01
61	Roldán	roldán.barrio@yahoo.com	+57 8256488689	Ronda de Roberto Chaparro #3, Cali	Barrio	2020-05-18
62	Severiano	severiano.marcos@gmail.com	+57 2218660175	Glorieta de Che Huguet #87, Bogotá	Marcos	2021-02-28
63	Fabricio	fabricio.fajardo@gmail.com	+57 3358762747	C. de Luna Bravo #830, Bogotá	Fajardo	2025-08-18
64	Melchor	melchor.acero@gmail.com	+57 7669424516	Plaza Cleto Izaguirre #85, Bucaramanga	Acero	2025-01-04
65	Otilia	otilia.lladó@hotmail.com	+57 2728707213	Glorieta de Rocío Peinado #92, Medellín	Lladó	2023-10-16
66	Maxi	maxi.aguilera@yahoo.com	+57 5986801703	Pasaje Américo Amaya #93, Cali	Aguilera	2022-04-23
67	Esperanza	esperanza.bernad@gmail.com	+57 1025286166	Paseo de Benigna Conesa #7, Pereira	Bernad	2023-05-04
68	Eladio	eladio.cases@outlook.com	+57 6066900890	Camino Renata Palomar #31, Barranquilla	Cases	2022-08-30
69	Brígida	brígida.montenegro@outlook.com	+57 4741146052	Vial de Clementina Olivé #21, Medellín	Montenegro	2024-04-27
70	Ramona	ramona.sáez@hotmail.com	+57 7081375391	Rambla Armando Casals #92, Cartagena	Sáez	2024-02-16
71	Isidro	isidro.cortés@gmail.com	+57 3799408156	Camino Camila Torrecilla #42, Manizales	Cortés	2020-07-29
72	Concha	concha.bernal@outlook.com	+57 2883730354	Avenida Isaac Arias #81, Bogotá	Bernal	2025-03-20
73	Micaela	micaela.jiménez@hotmail.com	+57 8312406726	Paseo Horacio Araujo #1, Pereira	Jiménez	2024-01-28
74	Teófila	teófila.pelayo@outlook.com	+57 8167634836	Via de Severino Quintana #7, Cali	Pelayo	2025-06-03
75	Jessica	jessica.godoy@hotmail.com	+57 3618636989	Cuesta de Paloma Vilalta #72, Medellín	Godoy	2025-07-04
76	Bernardino	bernardino.porcel@hotmail.com	+57 3986942878	Cuesta de Mariana Almansa #9, Barranquilla	Porcel	2021-08-12
77	Isa	isa.larrea@gmail.com	+57 8199148311	Acceso Ascensión Medina #18, Medellín	Larrea	2024-06-07
78	Corona	corona.sans@hotmail.com	+57 2520261391	Vial Nicodemo Ariza #16, Cali	Sans	2023-02-06
79	Héctor	héctor.torrent@yahoo.com	+57 3276581536	Acceso de Aránzazu Solera #75, Medellín	Torrent	2024-05-16
80	Sandra	sandra.marco@gmail.com	+57 9674683655	Pasaje de Clara Mur #84, Bucaramanga	Marco	2023-04-04
81	Fernando	fernando.herrera@yahoo.com	+57 3363907187	Cañada Manolo Hernández #7, Manizales	Herrera	2022-04-01
82	Ruperto	ruperto.alonso@hotmail.com	+57 6193953154	Cañada de Jorge Codina #90, Barranquilla	Alonso	2021-04-11
83	Eli	eli.leiva@outlook.com	+57 2058360220	Pasadizo de Maxi Lillo #97, Barranquilla	Leiva	2022-05-17
84	Ligia	ligia.talavera@yahoo.com	+57 2973468200	Calle Julia Mendizábal #16, Pereira	Talavera	2021-01-04
85	Isidoro	isidoro.gálvez@yahoo.com	+57 8739765572	Urbanización Lorenza Chamorro #24, Cali	Gálvez	2024-09-02
86	Paola	paola.carbó@hotmail.com	+57 0783887502	Ronda Alexandra Rodriguez #268, Medellín	Carbó	2022-11-02
87	Marcos	marcos.rincón@yahoo.com	+57 6987756837	Rambla de Chucho Miralles #52, Bucaramanga	Rincón	2024-08-05
88	Benigno	benigno.quesada@outlook.com	+57 7426710116	Ronda Sosimo Mate #192, Cali	Quesada	2024-12-07
89	Patricio	patricio.manuel@gmail.com	+57 8721884513	Glorieta de Jose Francisco Angulo #34, Barranquilla	Manuel	2025-02-16
90	Marisa	marisa.mora@outlook.com	+57 9773531161	Calle de Rosendo Garcés #6, Bucaramanga	Mora	2025-08-14
91	Carla	carla.nogueira@hotmail.com	+57 8946133633	Rambla de Alejo Heredia #346, Medellín	Nogueira	2023-03-11
92	Tito	tito.carreras@yahoo.com	+57 8007807972	Calle Berto Tejero #94, Barranquilla	Carreras	2022-10-04
93	Chus	chus.perea@outlook.com	+57 6588382715	Vial de Antonio Montoya #26, Medellín	Perea	2020-06-02
94	Hernán	hernán.badía@gmail.com	+57 7206492742	Rambla Teodosio Benavides #55, Bogotá	Badía	2020-03-08
95	Maura	maura.peláez@yahoo.com	+57 7911300967	Ronda de Juan Antonio Uriarte #16, Bucaramanga	Peláez	2023-09-19
96	Dan	dan.campo@hotmail.com	+57 8474610406	Pasaje de Bárbara Durán #632, Cali	Campo	2024-08-17
97	Desiderio	desiderio.otero@yahoo.com	+57 5784542653	Avenida de Paula Quero #79, Manizales	Otero	2020-08-31
98	Anunciación	anunciación.perales@gmail.com	+57 5789019182	Camino de Lucho Santos #88, Pereira	Perales	2023-08-31
99	Glauco	glauco.valverde@hotmail.com	+57 9140099201	Avenida de Antonia Lobo #257, Manizales	Valverde	2020-04-11
100	Remigio	remigio.agullo@hotmail.com	+57 0951972755	Pasadizo de Cosme Linares #4, Medellín	Agullo	2023-03-19
\.


--
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.order_details (order_id, product_id, quantity, price) FROM stdin;
94	79	2	22582.72
33	81	3	225220.11
20	35	2	264727.09
87	18	3	72937.80
90	70	3	486097.11
59	50	5	23787.00
60	82	1	93466.17
60	2	3	168012.82
16	57	5	54839.90
82	64	4	473940.57
40	45	1	284709.45
6	60	2	313405.37
47	64	1	473940.57
6	4	3	183292.22
49	16	2	373922.07
10	6	3	370051.79
90	33	3	95623.95
53	76	4	204773.04
80	67	1	215565.15
13	48	4	443876.47
11	8	5	115507.43
7	41	3	357990.82
31	3	2	395769.94
89	98	2	157681.79
69	21	3	266095.47
58	57	3	54839.90
91	29	2	390609.30
51	86	4	189967.18
68	10	4	251423.52
86	57	1	54839.90
75	75	1	117519.28
37	6	1	370051.79
62	90	4	416171.17
24	48	1	443876.47
23	25	5	444754.74
31	45	3	284709.45
5	39	1	201098.80
60	4	5	183292.22
70	61	5	391708.84
25	75	1	117519.28
81	60	1	313405.37
71	22	2	310673.00
19	84	3	40120.05
79	4	2	183292.22
16	71	2	411794.05
4	28	2	301564.04
32	13	2	53587.04
78	1	1	75633.22
74	76	4	204773.04
40	28	2	301564.04
27	92	1	483106.93
37	69	2	141424.67
98	42	1	94529.03
36	18	1	72937.80
65	68	4	44556.69
4	63	3	297781.60
29	8	2	115507.43
45	5	1	74081.46
70	90	5	416171.17
23	56	5	466694.88
39	56	1	466694.88
64	61	3	391708.84
18	73	3	91732.79
34	46	5	355685.61
39	55	1	369152.41
29	51	3	471794.76
94	96	2	316389.19
15	10	2	251423.52
73	35	2	264727.09
83	79	4	22582.72
66	79	2	22582.72
15	4	3	183292.22
17	24	5	479340.75
13	63	2	297781.60
62	68	2	44556.69
78	43	4	82609.15
92	71	4	411794.05
64	87	2	330209.67
9	61	3	391708.84
99	79	4	22582.72
79	77	1	442005.81
94	35	2	264727.09
25	90	5	416171.17
67	75	5	117519.28
88	64	1	473940.57
73	69	1	141424.67
40	11	4	167191.36
33	78	3	498796.86
54	93	3	97331.07
38	19	1	142037.97
69	7	2	208529.24
1	35	3	264727.09
76	9	2	466669.53
63	48	4	443876.47
95	98	1	157681.79
85	44	1	159643.98
25	76	4	204773.04
82	75	5	117519.28
71	49	2	26575.55
27	8	2	115507.43
\.


--
-- Data for Name: order_details_audit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.order_details_audit (audit_id, order_detail_key, "actionOrderDetail", changed_at, changed_by, before_data, after_data) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders (id, customer_id, order_date, total, total_amount) FROM stdin;
3	13	2025-02-08	\N	2.7087972e+06
4	86	2024-01-13	\N	3.767002e+06
5	31	2020-10-10	\N	962219.4
6	91	2023-03-19	\N	1.0929405e+06
7	20	2022-03-12	\N	3.57441e+06
8	81	2020-02-08	\N	874698.3
9	85	2022-03-14	\N	3.0230882e+06
10	55	2022-12-16	\N	2.0036388e+06
11	98	2020-01-10	\N	1.3398345e+06
12	60	2024-02-04	\N	3.1263015e+06
13	60	2020-03-02	\N	4.2707935e+06
14	11	2020-08-24	\N	4.7974005e+06
15	56	2020-04-16	\N	912272.3
16	36	2020-01-04	\N	4.6228965e+06
17	77	2022-12-17	\N	3.1620555e+06
18	30	2024-04-20	\N	1.1583865e+06
19	37	2023-06-03	\N	929021.9
20	59	2023-10-20	\N	4.3478805e+06
21	73	2023-12-12	\N	3.1171332e+06
22	54	2023-05-07	\N	3.0036768e+06
23	79	2020-11-09	\N	1.8148631e+06
24	76	2021-01-02	\N	2.7490135e+06
25	19	2022-10-06	\N	943053.7
26	89	2021-01-07	\N	1.5312726e+06
27	38	2024-09-16	\N	1.8302412e+06
28	59	2025-08-19	\N	4.425487e+06
29	52	2020-11-29	\N	4.1293278e+06
30	72	2022-07-01	\N	2.205121e+06
31	45	2024-01-16	\N	1.4476351e+06
32	85	2020-10-13	\N	3.3434208e+06
33	13	2024-04-29	\N	2.291815e+06
34	33	2022-10-07	\N	2.9959178e+06
35	65	2020-03-07	\N	1.5135432e+06
36	80	2020-02-19	\N	985698.4
37	89	2023-10-03	\N	3.7923478e+06
38	61	2023-09-08	\N	3.1298765e+06
39	35	2021-01-10	\N	2.6987962e+06
40	25	2024-06-24	\N	2.1932272e+06
41	87	2021-07-13	\N	3.4757345e+06
42	49	2020-11-25	\N	4.8263495e+06
43	98	2023-01-27	\N	591833.56
44	76	2021-12-03	\N	2.2130738e+06
45	79	2022-09-29	\N	1.7664744e+06
46	50	2025-01-29	\N	2.2525715e+06
47	55	2021-07-07	\N	2.4483855e+06
48	29	2024-01-28	\N	2.4145345e+06
49	13	2025-06-08	\N	3.9373058e+06
50	54	2020-06-16	\N	540947.56
51	10	2023-08-07	\N	506682.38
52	82	2022-02-08	\N	4.387325e+06
53	69	2020-09-05	\N	4.2043065e+06
54	52	2023-05-02	\N	1.3207336e+06
55	55	2021-06-14	\N	4.298168e+06
56	44	2020-11-27	\N	2.774104e+06
57	1	2024-02-26	\N	4.9625315e+06
58	77	2022-07-02	\N	3.579244e+06
59	17	2024-06-06	\N	4.9358965e+06
60	65	2022-05-02	\N	3.0422492e+06
61	57	2020-11-10	\N	2.2333718e+06
62	32	2020-05-18	\N	1.4973395e+06
63	60	2025-03-14	\N	3.4052245e+06
64	45	2020-09-08	\N	2.1305948e+06
65	62	2022-02-18	\N	95534.69
66	28	2025-02-01	\N	930858.25
67	89	2020-10-07	\N	3.5295878e+06
68	81	2022-10-02	\N	4.5349425e+06
69	59	2021-10-28	\N	3.890475e+06
70	86	2025-08-14	\N	4.3294615e+06
71	39	2025-06-08	\N	3.5306718e+06
72	5	2020-11-02	\N	2.0053765e+06
73	62	2022-10-01	\N	724516.1
74	40	2022-01-25	\N	2.4227238e+06
75	61	2022-04-15	\N	3.000418e+06
76	12	2021-11-16	\N	2.8675932e+06
77	17	2024-04-14	\N	365256.1
78	43	2021-09-25	\N	1.7505696e+06
79	16	2021-10-04	\N	1.630053e+06
80	27	2025-04-16	\N	3.3709558e+06
81	58	2024-12-27	\N	4.372371e+06
82	70	2023-12-03	\N	4.551002e+06
83	31	2025-03-07	\N	2.7416685e+06
84	28	2023-10-23	\N	3.4208305e+06
85	24	2022-11-29	\N	3.2301782e+06
86	21	2021-02-22	\N	1.2308396e+06
87	13	2020-02-15	\N	2.8587495e+06
88	40	2020-01-27	\N	1.7808942e+06
89	66	2022-12-14	\N	2.9885122e+06
90	54	2025-04-29	\N	268539.84
91	69	2022-08-10	\N	2.376427e+06
92	90	2021-05-03	\N	1.7433746e+06
93	66	2025-06-10	\N	1.2344969e+06
94	8	2023-10-29	\N	3.489189e+06
95	36	2024-04-05	\N	4.413658e+06
96	32	2020-01-25	\N	4.8983125e+06
97	32	2020-03-26	\N	2.4929702e+06
98	95	2021-02-01	\N	2.1551892e+06
99	23	2022-09-15	\N	2.5046365e+06
100	35	2023-08-25	\N	2.2303252e+06
1	57	2022-07-24	\N	1.87e+07
2	49	2023-06-22	3000.00	1e+07
\.


--
-- Data for Name: orders_audit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders_audit (audit_id, order_id, "actionOrder", changed_at, changed_by, before_data, after_data) FROM stdin;
1	1	UPDATE	2025-10-14 19:11:17.216742+00	Admin	{"id": 1, "total": null, "order_date": "2022-07-24", "customer_id": 57, "total_amount": 2966903.8}	{"id": 1, "total": null, "order_date": "2022-07-24", "customer_id": 57, "total_amount": 18700000}
2	2	UPDATE	2025-10-14 19:13:40.437387+00	Admin	{"id": 2, "total": null, "order_date": "2023-06-22", "customer_id": 49, "total_amount": 4359917}	{"id": 2, "total": 3000.00, "order_date": "2023-06-22", "customer_id": 49, "total_amount": 10000000}
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.payments (id, order_id, payment_date, amount, method, payment_method) FROM stdin;
1	61	2021-02-22	2233371.76	\N	Contraentrega
2	48	2024-09-29	2414534.58	\N	Efectivo
3	13	2020-12-22	4270793.27	\N	PSE
4	73	2020-05-27	724516.12	\N	Tarjeta débito
5	78	2025-02-05	1750569.62	\N	Daviplata
6	92	2020-12-27	1743374.68	\N	PSE
7	86	2025-06-20	1230839.68	\N	Efectivo
8	24	2021-12-17	2749013.40	\N	Tarjeta de crédito
9	95	2020-11-22	4413657.78	\N	Tarjeta de crédito
10	46	2023-12-01	2252571.48	\N	Tarjeta de crédito
11	10	2020-05-06	2003638.81	\N	Tarjeta de crédito
12	30	2021-11-11	2205121.05	\N	PSE
13	60	2020-03-18	3042249.36	\N	Tarjeta débito
15	85	2024-10-17	3230178.20	\N	Daviplata
16	17	2021-06-18	3162055.40	\N	Efectivo
17	54	2021-04-26	1320733.62	\N	Contraentrega
18	11	2022-10-31	1339834.45	\N	Tarjeta de crédito
19	59	2025-06-05	4935896.70	\N	PSE
20	27	2022-11-12	1830241.22	\N	Daviplata
21	45	2022-11-04	1766474.32	\N	Contraentrega
22	93	2023-04-06	1234496.90	\N	Daviplata
23	64	2025-01-18	2130594.74	\N	Daviplata
25	75	2025-09-23	3000418.04	\N	Tarjeta débito
27	53	2024-05-01	4204306.63	\N	Tarjeta de crédito
29	68	2025-08-11	4534942.46	\N	Tarjeta débito
30	35	2020-03-20	1513543.30	\N	Daviplata
33	50	2025-06-16	540947.55	\N	Nequi
34	87	2021-04-10	2858749.49	\N	Contraentrega
36	34	2024-01-19	2995917.64	\N	Efectivo
37	65	2021-11-27	95534.69	\N	Tarjeta de crédito
40	20	2023-10-30	4347880.61	\N	Efectivo
42	57	2023-02-27	4962531.47	\N	Daviplata
44	38	2025-01-04	3129876.41	\N	Tarjeta de crédito
45	52	2020-09-25	4387325.15	\N	Nequi
47	3	2020-03-12	2708797.29	\N	PSE
50	88	2024-12-15	1780894.23	\N	Tarjeta de crédito
51	89	2022-09-30	2988512.32	\N	Tarjeta de crédito
52	81	2021-04-05	4372371.16	\N	Efectivo
57	22	2025-05-16	3003676.70	\N	Tarjeta de crédito
58	99	2021-08-27	2504636.49	\N	Contraentrega
59	77	2023-04-02	365256.09	\N	Nequi
60	43	2023-06-11	591833.55	\N	Contraentrega
62	56	2021-04-22	2774103.98	\N	PSE
63	51	2020-05-16	506682.37	\N	Daviplata
64	62	2020-05-29	1497339.45	\N	Contraentrega
65	14	2021-03-12	4797400.51	\N	Tarjeta débito
68	26	2025-01-20	1531272.60	\N	Efectivo
70	80	2020-12-29	3370955.79	\N	Daviplata
71	33	2021-10-06	2291814.95	\N	Tarjeta débito
72	83	2025-09-20	2741668.39	\N	Efectivo
73	4	2024-07-24	3767002.03	\N	Efectivo
74	82	2020-11-08	4551002.17	\N	Daviplata
77	23	2024-06-03	1814863.08	\N	Daviplata
78	90	2024-09-27	268539.84	\N	Efectivo
81	72	2024-03-31	2005376.56	\N	Nequi
82	19	2023-11-13	929021.86	\N	Nequi
83	49	2020-07-15	3937305.78	\N	Tarjeta débito
84	12	2024-09-21	3126301.41	\N	Contraentrega
88	18	2023-11-12	1158386.50	\N	Tarjeta de crédito
89	98	2024-09-23	2155189.15	\N	Tarjeta de crédito
100	44	2022-09-30	2213073.74	\N	Nequi
\.


--
-- Data for Name: payments_audit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.payments_audit (audit_id, payment_id, "actionPayment", changed_at, changed_by, before_data, after_data) FROM stdin;
\.


--
-- Data for Name: product_tags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_tags (product_id, tag_id, product_name, tag_name) FROM stdin;
2	2	Camiseta deportiva hombre	Ropa
29	44	Balón de fútbol oficial	Tecnología
75	18	Taladro eléctrico	Viajes
88	6	Muñeca de colección	Accesorios
80	72	Servicio de instalación	Mascotas
72	58	Alimento para perro 10kg	Viajes
26	5	Collar artesanal	Hogar
64	89	Celular Android última generación	Deportes
20	61	Servicio de instalación	Electrodomésticos
32	60	Alimento para perro 10kg	Servicios
45	60	Sofá de 3 puestos	Servicios
95	70	Taladro eléctrico	Supermercado
11	53	Kit de vitaminas	Muebles
73	16	Escritorio de oficina	Videojuegos
20	81	Servicio de instalación	Electrodomésticos
72	2	Alimento para perro 10kg	Ropa
82	81	Camiseta deportiva hombre	Electrodomésticos
50	78	Arroz premium 5kg	Viajes
32	48	Alimento para perro 10kg	Juguetes
33	49	Escritorio de oficina	Deportes
17	72	Paquete de ofertas	Mascotas
66	99	Collar artesanal	Instrumentos
15	20	Taladro eléctrico	Servicios
5	82	Sofá de 3 puestos	Ropa
30	93	Arroz premium 5kg	Muebles
19	49	Guitarra acústica	Deportes
95	20	Taladro eléctrico	Servicios
50	95	Arroz premium 5kg	Herramientas
1	79	Televisor LED 50 pulgadas	Instrumentos
29	19	Balón de fútbol oficial	Instrumentos
100	33	Servicio de instalación	Muebles
40	26	Servicio de instalación	Accesorios
71	39	Kit de vitaminas	Instrumentos
9	82	Balón de fútbol oficial	Ropa
67	5	Perfume mujer 100ml	Hogar
14	98	Cuaderno universitario	Viajes
12	99	Alimento para perro 10kg	Instrumentos
61	75	Televisor LED 50 pulgadas	Herramientas
99	35	Guitarra acústica	Herramientas
80	96	Servicio de instalación	Videojuegos
67	3	Perfume mujer 100ml	Zapatos
95	21	Taladro eléctrico	Electrodomésticos
87	75	Perfume mujer 100ml	Herramientas
93	26	Escritorio de oficina	Accesorios
89	98	Balón de fútbol oficial	Viajes
7	92	Perfume mujer 100ml	Mascotas
42	86	Camiseta deportiva hombre	Accesorios
20	39	Servicio de instalación	Instrumentos
58	72	Tiquetes de viaje	Mascotas
32	55	Alimento para perro 10kg	Herramientas
89	92	Balón de fútbol oficial	Mascotas
84	84	Celular Android última generación	Tecnología
57	88	Paquete de ofertas	Juguetes
50	23	Arroz premium 5kg	Zapatos
47	18	Perfume mujer 100ml	Viajes
49	2	Balón de fútbol oficial	Ropa
93	84	Escritorio de oficina	Tecnología
1	2	Televisor LED 50 pulgadas	Ropa
70	58	Arroz premium 5kg	Viajes
72	46	Alimento para perro 10kg	Accesorios
64	32	Celular Android última generación	Mascotas
2	38	Camiseta deportiva hombre	Viajes
81	85	Televisor LED 50 pulgadas	Hogar
19	14	Guitarra acústica	Papelería
75	1	Taladro eléctrico	Electrodomésticos
98	18	Tiquetes de viaje	Viajes
37	53	Paquete de ofertas	Muebles
9	45	Balón de fútbol oficial	Hogar
94	43	Cuaderno universitario	Zapatos
55	15	Taladro eléctrico	Herramientas
26	22	Collar artesanal	Ropa
98	4	Tiquetes de viaje	Tecnología
9	48	Balón de fútbol oficial	Juguetes
91	74	Kit de vitaminas	Papelería
89	29	Balón de fútbol oficial	Deportes
59	5	Guitarra acústica	Hogar
91	20	Kit de vitaminas	Servicios
93	17	Escritorio de oficina	Ofertas
25	19	Sofá de 3 puestos	Instrumentos
27	35	Perfume mujer 100ml	Herramientas
65	54	Sofá de 3 puestos	Papelería
50	81	Arroz premium 5kg	Electrodomésticos
33	16	Escritorio de oficina	Videojuegos
9	26	Balón de fútbol oficial	Accesorios
11	80	Kit de vitaminas	Servicios
15	79	Taladro eléctrico	Instrumentos
98	88	Tiquetes de viaje	Juguetes
83	8	Zapatos de cuero	Juguetes
28	34	Muñeca de colección	Papelería
74	46	Cuaderno universitario	Accesorios
51	97	Kit de vitaminas	Ofertas
55	81	Taladro eléctrico	Electrodomésticos
52	98	Alimento para perro 10kg	Viajes
23	39	Zapatos de cuero	Instrumentos
39	62	Guitarra acústica	Ropa
47	76	Perfume mujer 100ml	Videojuegos
91	90	Kit de vitaminas	Supermercado
35	58	Taladro eléctrico	Viajes
6	37	Collar artesanal	Ofertas
1	96	Televisor LED 50 pulgadas	Videojuegos
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products (id, seller_id, category_id, name, price, stock, status, description, created_at) FROM stdin;
4	75	99	Celular Android última generación	183292.22	284	\N	Producto de alta calidad con garantía incluida.	2024-11-23
5	68	65	Sofá de 3 puestos	74081.46	188	\N	Fácil de usar, práctico y con excelentes acabados.	2023-01-27
6	55	71	Collar artesanal	370051.79	196	\N	Materiales resistentes pensados para la familia colombiana.	2022-06-01
7	84	22	Perfume mujer 100ml	208529.24	500	\N	Disponible en varias tallas y colores según preferencia.	2023-04-01
8	65	15	Muñeca de colección	115507.43	449	\N	Materiales resistentes pensados para la familia colombiana.	2020-05-08
9	51	43	Balón de fútbol oficial	466669.53	105	\N	Diseño moderno y cómodo, perfecto para cualquier ocasión.	2021-01-24
10	37	9	Arroz premium 5kg	251423.52	230	\N	Hecho con insumos locales, apoyando la industria nacional.	2025-02-07
11	29	48	Kit de vitaminas	167191.36	341	\N	Ideal para el uso diario, resistente y duradero.	2021-10-29
12	84	17	Alimento para perro 10kg	374903.52	358	\N	Edición especial con precio promocional por tiempo limitado.	2023-04-10
13	33	5	Escritorio de oficina	53587.04	366	\N	Diseño moderno y cómodo, perfecto para cualquier ocasión.	2024-05-10
14	24	3	Cuaderno universitario	156935.08	325	\N	Producto de alta calidad con garantía incluida.	2024-05-20
15	23	51	Taladro eléctrico	312818.16	372	\N	Edición especial con precio promocional por tiempo limitado.	2020-12-05
16	8	61	Consola de videojuegos	373922.07	373	\N	Edición especial con precio promocional por tiempo limitado.	2024-10-28
17	89	39	Paquete de ofertas	455914.60	373	\N	Producto recomendado por cientos de clientes satisfechos.	2020-04-11
18	55	40	Tiquetes de viaje	72937.80	447	\N	Materiales resistentes pensados para la familia colombiana.	2025-08-20
19	99	36	Guitarra acústica	142037.97	190	\N	Producto de alta calidad con garantía incluida.	2021-01-02
20	33	95	Servicio de instalación	463618.18	472	\N	Diseño moderno y cómodo, perfecto para cualquier ocasión.	2021-05-07
21	10	5	Televisor LED 50 pulgadas	266095.47	401	\N	Disponible en varias tallas y colores según preferencia.	2021-12-30
22	31	32	Camiseta deportiva hombre	310673.00	70	\N	Edición especial con precio promocional por tiempo limitado.	2024-11-21
23	7	26	Zapatos de cuero	388092.52	228	\N	Ideal para el uso diario, resistente y duradero.	2021-07-26
24	9	6	Celular Android última generación	479340.75	376	\N	Fácil de usar, práctico y con excelentes acabados.	2022-09-08
25	76	53	Sofá de 3 puestos	444754.74	161	\N	Diseño moderno y cómodo, perfecto para cualquier ocasión.	2022-10-16
26	49	22	Collar artesanal	271716.19	69	\N	Con envío gratis a todo el país y garantía de satisfacción.	2020-06-18
27	64	17	Perfume mujer 100ml	114749.22	475	\N	Producto de alta calidad con garantía incluida.	2024-11-24
28	46	9	Muñeca de colección	301564.04	121	\N	Disponible en varias tallas y colores según preferencia.	2022-01-27
29	40	100	Balón de fútbol oficial	390609.30	131	\N	Hecho con insumos locales, apoyando la industria nacional.	2025-04-09
30	63	18	Arroz premium 5kg	269362.78	334	\N	Materiales resistentes pensados para la familia colombiana.	2021-04-24
31	55	7	Kit de vitaminas	230791.98	340	\N	Producto de alta calidad con garantía incluida.	2025-06-09
32	73	68	Alimento para perro 10kg	159714.45	59	\N	Con envío gratis a todo el país y garantía de satisfacción.	2021-01-17
33	42	6	Escritorio de oficina	95623.95	158	\N	Producto recomendado por cientos de clientes satisfechos.	2020-01-29
34	54	54	Cuaderno universitario	141443.70	342	\N	Fácil de usar, práctico y con excelentes acabados.	2024-01-25
35	84	17	Taladro eléctrico	264727.09	493	\N	Edición especial con precio promocional por tiempo limitado.	2021-12-23
36	50	4	Consola de videojuegos	388690.59	413	\N	Con envío gratis a todo el país y garantía de satisfacción.	2021-10-27
37	3	27	Paquete de ofertas	381683.09	327	\N	Producto de alta calidad con garantía incluida.	2024-09-10
38	68	82	Tiquetes de viaje	181437.52	124	\N	Hecho con insumos locales, apoyando la industria nacional.	2023-05-17
39	84	87	Guitarra acústica	201098.80	221	\N	Materiales resistentes pensados para la familia colombiana.	2022-01-02
40	18	60	Servicio de instalación	193479.15	301	\N	Materiales resistentes pensados para la familia colombiana.	2024-12-22
41	15	10	Televisor LED 50 pulgadas	357990.82	54	\N	Hecho con insumos locales, apoyando la industria nacional.	2023-08-30
42	19	63	Camiseta deportiva hombre	94529.03	102	\N	Diseño moderno y cómodo, perfecto para cualquier ocasión.	2025-01-13
43	35	42	Zapatos de cuero	82609.15	171	\N	Fácil de usar, práctico y con excelentes acabados.	2021-07-04
44	12	56	Celular Android última generación	159643.98	235	\N	Con envío gratis a todo el país y garantía de satisfacción.	2022-02-21
45	17	11	Sofá de 3 puestos	284709.45	283	\N	Ideal para el uso diario, resistente y duradero.	2023-09-23
46	12	66	Collar artesanal	355685.61	427	\N	Edición especial con precio promocional por tiempo limitado.	2020-08-10
47	32	22	Perfume mujer 100ml	498497.38	49	\N	Producto de alta calidad con garantía incluida.	2025-06-30
48	87	62	Muñeca de colección	443876.47	47	\N	Con envío gratis a todo el país y garantía de satisfacción.	2020-03-07
49	71	46	Balón de fútbol oficial	26575.55	287	\N	Diseño moderno y cómodo, perfecto para cualquier ocasión.	2020-02-19
50	13	56	Arroz premium 5kg	23787.00	339	\N	Fácil de usar, práctico y con excelentes acabados.	2023-07-09
51	6	11	Kit de vitaminas	471794.76	8	\N	Disponible en varias tallas y colores según preferencia.	2025-06-14
52	85	60	Alimento para perro 10kg	475692.79	369	\N	Edición especial con precio promocional por tiempo limitado.	2023-11-15
1	42	52	Televisor LED 50 pulgadas	75633.22	50	\N	Hecho con insumos locales, apoyando la industria nacional.	2024-03-25
2	45	62	Camiseta deportiva hombre	168012.82	195	\N	Con envío gratis a todo el país y garantía de satisfacción.	2025-04-02
54	84	8	Cuaderno universitario	317601.02	271	\N	Diseño moderno y cómodo, perfecto para cualquier ocasión.	2022-01-10
55	71	53	Taladro eléctrico	369152.41	337	\N	Ideal para el uso diario, resistente y duradero.	2024-06-20
56	66	53	Consola de videojuegos	466694.88	247	\N	Producto recomendado por cientos de clientes satisfechos.	2023-08-02
57	61	76	Paquete de ofertas	54839.90	129	\N	Producto de alta calidad con garantía incluida.	2024-05-28
58	15	82	Tiquetes de viaje	454399.18	288	\N	Producto de alta calidad con garantía incluida.	2020-12-03
59	1	89	Guitarra acústica	13225.33	187	\N	Producto de alta calidad con garantía incluida.	2025-07-12
60	23	88	Servicio de instalación	313405.37	25	\N	Con envío gratis a todo el país y garantía de satisfacción.	2023-01-06
61	92	26	Televisor LED 50 pulgadas	391708.84	371	\N	Materiales resistentes pensados para la familia colombiana.	2022-09-16
62	24	58	Camiseta deportiva hombre	461293.29	233	\N	Hecho con insumos locales, apoyando la industria nacional.	2022-10-11
63	90	87	Zapatos de cuero	297781.60	313	\N	Ideal para el uso diario, resistente y duradero.	2024-04-18
64	73	10	Celular Android última generación	473940.57	387	\N	Producto recomendado por cientos de clientes satisfechos.	2021-10-02
65	19	72	Sofá de 3 puestos	294691.72	39	\N	Materiales resistentes pensados para la familia colombiana.	2023-11-06
66	83	94	Collar artesanal	380119.62	143	\N	Ideal para el uso diario, resistente y duradero.	2022-12-23
67	60	100	Perfume mujer 100ml	215565.15	16	\N	Producto recomendado por cientos de clientes satisfechos.	2024-03-25
69	61	73	Balón de fútbol oficial	141424.67	386	\N	Con envío gratis a todo el país y garantía de satisfacción.	2023-03-16
70	6	64	Arroz premium 5kg	486097.11	357	\N	Diseño moderno y cómodo, perfecto para cualquier ocasión.	2022-08-15
71	29	83	Kit de vitaminas	411794.05	346	\N	Producto recomendado por cientos de clientes satisfechos.	2023-11-28
72	79	31	Alimento para perro 10kg	359850.00	176	\N	Ideal para el uso diario, resistente y duradero.	2020-06-28
73	47	19	Escritorio de oficina	91732.79	404	\N	Con envío gratis a todo el país y garantía de satisfacción.	2024-06-10
74	72	40	Cuaderno universitario	474501.26	475	\N	Edición especial con precio promocional por tiempo limitado.	2020-12-22
75	71	69	Taladro eléctrico	117519.28	42	\N	Diseño moderno y cómodo, perfecto para cualquier ocasión.	2024-12-24
76	52	48	Consola de videojuegos	204773.04	159	\N	Producto recomendado por cientos de clientes satisfechos.	2020-07-30
77	33	71	Paquete de ofertas	442005.81	196	\N	Ideal para el uso diario, resistente y duradero.	2025-05-09
78	49	90	Tiquetes de viaje	498796.86	28	\N	Producto de alta calidad con garantía incluida.	2025-06-08
79	15	39	Guitarra acústica	22582.72	309	\N	Hecho con insumos locales, apoyando la industria nacional.	2022-06-19
80	41	99	Servicio de instalación	285522.98	282	\N	Edición especial con precio promocional por tiempo limitado.	2022-05-11
81	91	25	Televisor LED 50 pulgadas	225220.11	11	\N	Hecho con insumos locales, apoyando la industria nacional.	2024-02-21
82	24	8	Camiseta deportiva hombre	93466.17	436	\N	Producto recomendado por cientos de clientes satisfechos.	2025-05-10
83	59	32	Zapatos de cuero	405048.02	282	\N	Con envío gratis a todo el país y garantía de satisfacción.	2022-03-11
84	97	62	Celular Android última generación	40120.05	48	\N	Hecho con insumos locales, apoyando la industria nacional.	2020-12-20
85	15	46	Sofá de 3 puestos	233611.04	480	\N	Producto de alta calidad con garantía incluida.	2023-06-04
86	35	53	Collar artesanal	189967.18	404	\N	Con envío gratis a todo el país y garantía de satisfacción.	2023-11-16
87	66	37	Perfume mujer 100ml	330209.67	274	\N	Disponible en varias tallas y colores según preferencia.	2023-07-11
88	84	96	Muñeca de colección	144131.66	401	\N	Edición especial con precio promocional por tiempo limitado.	2024-02-18
89	14	92	Balón de fútbol oficial	315738.47	478	\N	Ideal para el uso diario, resistente y duradero.	2025-05-29
90	70	31	Arroz premium 5kg	416171.17	303	\N	Edición especial con precio promocional por tiempo limitado.	2022-02-09
91	92	84	Kit de vitaminas	229039.54	486	\N	Producto de alta calidad con garantía incluida.	2021-06-07
92	33	10	Alimento para perro 10kg	483106.93	33	\N	Ideal para el uso diario, resistente y duradero.	2020-03-30
93	47	27	Escritorio de oficina	97331.07	351	\N	Edición especial con precio promocional por tiempo limitado.	2022-05-21
94	17	64	Cuaderno universitario	253953.52	75	\N	Ideal para el uso diario, resistente y duradero.	2025-09-06
95	23	31	Taladro eléctrico	325246.65	173	\N	Producto de alta calidad con garantía incluida.	2023-09-06
96	31	59	Consola de videojuegos	316389.19	244	\N	Ideal para el uso diario, resistente y duradero.	2024-12-05
97	29	81	Paquete de ofertas	259951.04	195	\N	Disponible en varias tallas y colores según preferencia.	2021-11-30
98	92	17	Tiquetes de viaje	157681.79	156	\N	Hecho con insumos locales, apoyando la industria nacional.	2020-06-22
99	84	32	Guitarra acústica	34566.59	23	\N	Hecho con insumos locales, apoyando la industria nacional.	2020-04-12
100	46	54	Servicio de instalación	191187.72	492	\N	Disponible en varias tallas y colores según preferencia.	2021-08-13
53	56	50	Escritorio de oficina	68083.28	195	\N	Materiales resistentes pensados para la familia colombiana.	2022-09-27
68	14	39	Muñeca de colección	44556.69	2000000	\N	Disponible en varias tallas y colores según preferencia.	2023-09-05
3	68	74	Zapatos de cuero	395769.94	195	\N	Materiales resistentes pensados para la familia colombiana.	2024-04-21
\.


--
-- Data for Name: products_audit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_audit (audit_id, product_id, "actionProduct", changed_at, changed_by, before_data, after_data) FROM stdin;
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reviews (id, product_id, rating, comment, review_comment) FROM stdin;
1	67	4	\N	Producto de buena calidad, aunque esperaba un mejor acabado.
2	90	2	\N	El color y la talla coinciden perfectamente, satisfecho.
3	73	3	\N	Excelente relación calidad-precio, lo recomiendo.
4	20	5	\N	El servicio al cliente fue excelente, resolvieron mis dudas rápido.
5	60	5	\N	Muy buena calidad, llegó a tiempo.
6	47	4	\N	Excelente relación calidad-precio, lo recomiendo.
7	35	1	\N	No estoy satisfecho, el producto se dañó al poco tiempo de uso.
8	80	1	\N	Producto de buena calidad, aunque esperaba un mejor acabado.
9	75	5	\N	El color y la talla coinciden perfectamente, satisfecho.
10	100	5	\N	Muy buena calidad, llegó a tiempo.
11	54	1	\N	No estoy satisfecho, el producto se dañó al poco tiempo de uso.
12	2	1	\N	No estoy satisfecho, el producto se dañó al poco tiempo de uso.
13	86	3	\N	Demoró un poco en el envío, pero valió la pena.
14	84	4	\N	No era lo que esperaba, la descripción debe ser más clara.
15	94	1	\N	El color y la talla coinciden perfectamente, satisfecho.
16	52	4	\N	Excelente relación calidad-precio, lo recomiendo.
17	85	5	\N	Excelente relación calidad-precio, lo recomiendo.
18	96	5	\N	El servicio al cliente fue excelente, resolvieron mis dudas rápido.
19	39	3	\N	Demoró un poco en el envío, pero valió la pena.
20	63	2	\N	No era lo que esperaba, la descripción debe ser más clara.
21	52	4	\N	El color y la talla coinciden perfectamente, satisfecho.
22	65	1	\N	Muy buena calidad, llegó a tiempo.
23	1	3	\N	Muy buena calidad, llegó a tiempo.
24	49	2	\N	Excelente relación calidad-precio, lo recomiendo.
25	40	4	\N	Excelente relación calidad-precio, lo recomiendo.
26	36	5	\N	El servicio al cliente fue excelente, resolvieron mis dudas rápido.
27	58	5	\N	El empaque estaba un poco dañado, pero el producto funciona bien.
28	13	5	\N	No era lo que esperaba, la descripción debe ser más clara.
29	100	2	\N	Llegó antes de lo previsto, muy contento con la compra.
30	60	5	\N	Producto de buena calidad, aunque esperaba un mejor acabado.
31	52	2	\N	El servicio al cliente fue excelente, resolvieron mis dudas rápido.
32	76	4	\N	El empaque estaba un poco dañado, pero el producto funciona bien.
33	26	3	\N	Llegó antes de lo previsto, muy contento con la compra.
34	11	2	\N	El color y la talla coinciden perfectamente, satisfecho.
35	25	3	\N	Excelente relación calidad-precio, lo recomiendo.
36	97	5	\N	No estoy satisfecho, el producto se dañó al poco tiempo de uso.
37	63	1	\N	Muy buena calidad, llegó a tiempo.
38	78	3	\N	Muy buena calidad, llegó a tiempo.
39	18	5	\N	El color y la talla coinciden perfectamente, satisfecho.
40	9	3	\N	No era lo que esperaba, la descripción debe ser más clara.
41	33	2	\N	El color y la talla coinciden perfectamente, satisfecho.
42	83	4	\N	No estoy satisfecho, el producto se dañó al poco tiempo de uso.
43	98	4	\N	Producto de buena calidad, aunque esperaba un mejor acabado.
44	3	4	\N	No era lo que esperaba, la descripción debe ser más clara.
45	77	1	\N	Muy buena calidad, llegó a tiempo.
46	38	5	\N	Producto de buena calidad, aunque esperaba un mejor acabado.
47	18	5	\N	Producto de buena calidad, aunque esperaba un mejor acabado.
48	32	4	\N	Excelente relación calidad-precio, lo recomiendo.
49	27	1	\N	Muy buena calidad, llegó a tiempo.
50	99	1	\N	El empaque estaba un poco dañado, pero el producto funciona bien.
51	46	5	\N	No estoy satisfecho, el producto se dañó al poco tiempo de uso.
52	38	3	\N	Llegó antes de lo previsto, muy contento con la compra.
53	59	3	\N	Llegó antes de lo previsto, muy contento con la compra.
54	16	3	\N	Llegó antes de lo previsto, muy contento con la compra.
55	40	5	\N	El servicio al cliente fue excelente, resolvieron mis dudas rápido.
56	79	3	\N	Muy buena calidad, llegó a tiempo.
57	30	5	\N	El servicio al cliente fue excelente, resolvieron mis dudas rápido.
58	68	5	\N	No era lo que esperaba, la descripción debe ser más clara.
59	17	2	\N	El color y la talla coinciden perfectamente, satisfecho.
60	91	3	\N	El servicio al cliente fue excelente, resolvieron mis dudas rápido.
61	99	2	\N	Producto de buena calidad, aunque esperaba un mejor acabado.
62	29	3	\N	Llegó antes de lo previsto, muy contento con la compra.
63	58	3	\N	Excelente relación calidad-precio, lo recomiendo.
64	87	1	\N	El servicio al cliente fue excelente, resolvieron mis dudas rápido.
65	12	5	\N	Producto de buena calidad, aunque esperaba un mejor acabado.
66	7	1	\N	Llegó antes de lo previsto, muy contento con la compra.
67	37	4	\N	El empaque estaba un poco dañado, pero el producto funciona bien.
68	23	1	\N	Demoró un poco en el envío, pero valió la pena.
69	19	5	\N	No era lo que esperaba, la descripción debe ser más clara.
70	89	4	\N	Llegó antes de lo previsto, muy contento con la compra.
71	61	1	\N	Producto de buena calidad, aunque esperaba un mejor acabado.
72	16	5	\N	No estoy satisfecho, el producto se dañó al poco tiempo de uso.
73	55	4	\N	Muy buena calidad, llegó a tiempo.
74	91	1	\N	El servicio al cliente fue excelente, resolvieron mis dudas rápido.
75	23	2	\N	Llegó antes de lo previsto, muy contento con la compra.
76	62	4	\N	Producto de buena calidad, aunque esperaba un mejor acabado.
77	96	5	\N	Muy buena calidad, llegó a tiempo.
78	48	2	\N	Muy buena calidad, llegó a tiempo.
79	94	5	\N	Muy buena calidad, llegó a tiempo.
80	25	5	\N	Excelente relación calidad-precio, lo recomiendo.
81	6	1	\N	No estoy satisfecho, el producto se dañó al poco tiempo de uso.
82	18	5	\N	Muy buena calidad, llegó a tiempo.
83	66	3	\N	Muy buena calidad, llegó a tiempo.
84	15	4	\N	El color y la talla coinciden perfectamente, satisfecho.
85	67	1	\N	No era lo que esperaba, la descripción debe ser más clara.
86	22	4	\N	Producto de buena calidad, aunque esperaba un mejor acabado.
87	60	1	\N	El color y la talla coinciden perfectamente, satisfecho.
88	85	5	\N	No era lo que esperaba, la descripción debe ser más clara.
89	80	4	\N	El color y la talla coinciden perfectamente, satisfecho.
90	53	4	\N	Demoró un poco en el envío, pero valió la pena.
91	75	1	\N	No estoy satisfecho, el producto se dañó al poco tiempo de uso.
92	97	1	\N	No era lo que esperaba, la descripción debe ser más clara.
93	83	1	\N	El empaque estaba un poco dañado, pero el producto funciona bien.
94	42	1	\N	Producto de buena calidad, aunque esperaba un mejor acabado.
95	9	3	\N	Excelente relación calidad-precio, lo recomiendo.
96	97	4	\N	El color y la talla coinciden perfectamente, satisfecho.
97	2	5	\N	Producto de buena calidad, aunque esperaba un mejor acabado.
98	73	5	\N	Demoró un poco en el envío, pero valió la pena.
99	33	2	\N	Demoró un poco en el envío, pero valió la pena.
100	3	1	\N	El empaque estaba un poco dañado, pero el producto funciona bien.
\.


--
-- Data for Name: reviews_audit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reviews_audit (audit_id, review_id, "actionReview", changed_at, changed_by, before_data, after_data) FROM stdin;
\.


--
-- Data for Name: sellers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sellers (id, name, email, phone, address, created_at) FROM stdin;
1	Daniela Díaz	daniela.díaz22@outlook.com	+34733524732	\N	2023-08-13
2	Juan López	juan.lópez65@yahoo.com	+34 719871252	\N	2020-10-14
3	Laura Moreno	laura.moreno53@yahoo.com	+34733 975 835	\N	2023-01-17
4	Natalia Díaz	natalia.díaz37@gmail.com	+34 661 47 59 25	\N	2021-12-01
5	Natalia Hernández	natalia.hernández83@gmail.com	+34955 558 004	\N	2022-05-31
6	Natalia López	natalia.lópez75@hotmail.com	+34737 18 21 78	\N	2024-02-13
7	Felipe Moreno	felipe.moreno89@hotmail.com	+34 942747852	\N	2020-11-13
8	Camilo López	camilo.lópez35@yahoo.com	+34725 09 11 88	\N	2024-09-17
9	Valentina Castro	valentina.castro6@gmail.com	+34725 21 00 03	\N	2023-09-15
10	María Martínez	maría.martínez55@hotmail.com	+34 744 095 660	\N	2024-03-20
11	Santiago Torres	santiago.torres34@yahoo.com	+34 715942309	\N	2025-05-24
12	Carlos Díaz	carlos.díaz33@outlook.com	+34 935776558	\N	2022-05-18
13	María Martínez	maría.martínez94@yahoo.com	+34749 506 871	\N	2024-10-02
14	Felipe Martínez	felipe.martínez67@hotmail.com	+34 729 168 505	\N	2024-06-12
15	Laura Moreno	laura.moreno9@yahoo.com	+34691571008	\N	2020-07-31
16	Juliana Díaz	juliana.díaz28@outlook.com	+34 722 558 893	\N	2020-04-19
17	Juan Hernández	juan.hernández23@gmail.com	+34 954 75 79 90	\N	2021-08-23
18	Carlos Moreno	carlos.moreno93@gmail.com	+34 606 14 75 13	\N	2020-10-25
19	Juliana Moreno	juliana.moreno35@yahoo.com	+34 709 38 65 96	\N	2024-03-20
20	Daniela Torres	daniela.torres70@outlook.com	+34 948626388	\N	2020-01-09
21	Valentina Torres	valentina.torres92@outlook.com	+34721 69 77 47	\N	2023-08-31
22	Juan Martínez	juan.martínez29@hotmail.com	+34715 476 270	\N	2024-02-08
23	Laura Ramírez	laura.ramírez53@outlook.com	+34655417218	\N	2021-04-25
24	Juan Martínez	juan.martínez88@outlook.com	+34925 66 81 33	\N	2021-09-13
25	Andrés Hernández	andrés.hernández21@gmail.com	+34685 48 66 76	\N	2020-10-16
26	Felipe Pérez	felipe.pérez32@hotmail.com	+34 722 09 13 73	\N	2024-06-07
27	Andrés Torres	andrés.torres6@gmail.com	+34 667388775	\N	2023-10-30
28	Andrés Díaz	andrés.díaz91@outlook.com	+34722995100	\N	2021-04-11
29	Santiago Martínez	santiago.martínez31@gmail.com	+34616 59 73 07	\N	2024-07-19
30	Andrés Castro	andrés.castro19@hotmail.com	+34 636 002 688	\N	2020-12-04
31	Valentina Gómez	valentina.gómez85@outlook.com	+34 708283968	\N	2020-08-13
32	Daniela González	daniela.gonzález62@hotmail.com	+34739 47 18 18	\N	2021-07-25
33	Juliana Hernández	juliana.hernández57@gmail.com	+34 903 87 30 74	\N	2021-06-07
34	Laura Castro	laura.castro92@outlook.com	+34858 67 42 12	\N	2021-05-10
35	Juan Martínez	juan.martínez51@hotmail.com	+34715 97 02 18	\N	2020-02-21
36	Santiago Hernández	santiago.hernández38@yahoo.com	+34993 918 103	\N	2022-07-07
37	María Castro	maría.castro82@yahoo.com	+34 738 69 25 84	\N	2021-09-27
38	Daniela Gómez	daniela.gómez5@outlook.com	+34 701 194 235	\N	2022-09-02
39	Laura Torres	laura.torres20@outlook.com	+34 708 995 189	\N	2020-01-29
40	Juliana Martínez	juliana.martínez69@gmail.com	+34748597058	\N	2020-08-28
41	Felipe Rodríguez	felipe.rodríguez96@yahoo.com	+34704 066 172	\N	2023-10-29
42	Juliana Díaz	juliana.díaz78@hotmail.com	+34 704 695 465	\N	2020-02-15
43	Andrés Martínez	andrés.martínez46@hotmail.com	+34 745601492	\N	2024-01-14
44	Camilo Ramírez	camilo.ramírez22@yahoo.com	+34 892242970	\N	2023-03-30
45	Juan Moreno	juan.moreno70@yahoo.com	+34735 09 27 51	\N	2022-04-06
46	Camilo Hernández	camilo.hernández39@gmail.com	+34706620850	\N	2023-02-14
47	Juliana Díaz	juliana.díaz27@hotmail.com	+34 733664964	\N	2023-01-23
48	Camilo González	camilo.gonzález33@yahoo.com	+34 709 27 12 68	\N	2020-03-20
49	Felipe Díaz	felipe.díaz69@hotmail.com	+34702 529 625	\N	2023-04-19
50	Felipe Ramírez	felipe.ramírez93@gmail.com	+34 708291107	\N	2020-09-21
51	Laura Martínez	laura.martínez87@gmail.com	+34736 01 82 41	\N	2024-01-27
52	Andrés Hernández	andrés.hernández1@yahoo.com	+34960 586 727	\N	2022-11-18
53	Daniela Pérez	daniela.pérez17@yahoo.com	+34 877739786	\N	2024-10-14
54	Natalia Torres	natalia.torres31@gmail.com	+34626 94 73 54	\N	2025-03-20
55	María Gómez	maría.gómez39@yahoo.com	+34984 74 63 92	\N	2021-07-01
56	Felipe Gómez	felipe.gómez2@outlook.com	+34630 873 547	\N	2022-12-18
57	Natalia Pérez	natalia.pérez16@gmail.com	+34 747819845	\N	2021-04-01
58	Laura López	laura.lópez78@gmail.com	+34870 253 454	\N	2024-05-11
59	Carlos Torres	carlos.torres6@gmail.com	+34976 94 28 53	\N	2023-08-17
60	Valentina Castro	valentina.castro62@gmail.com	+34 733991884	\N	2025-07-14
61	Santiago López	santiago.lópez1@hotmail.com	+34 703656046	\N	2022-08-03
62	Carlos Torres	carlos.torres93@hotmail.com	+34 711945591	\N	2022-01-31
63	Carlos Gómez	carlos.gómez34@hotmail.com	+34 730 835 590	\N	2022-02-13
64	Santiago Pérez	santiago.pérez15@yahoo.com	+34 996590567	\N	2021-07-13
65	María Moreno	maría.moreno82@outlook.com	+34704 49 17 06	\N	2024-09-17
66	Juan Torres	juan.torres43@outlook.com	+34740778986	\N	2025-04-23
67	Natalia Torres	natalia.torres46@outlook.com	+34 631 194 349	\N	2020-02-08
68	Andrés Moreno	andrés.moreno21@outlook.com	+34840 14 63 32	\N	2025-01-20
69	María Pérez	maría.pérez46@outlook.com	+34 671 119 340	\N	2023-12-15
70	Santiago Hernández	santiago.hernández66@hotmail.com	+34717 275 447	\N	2021-04-29
71	Santiago Pérez	santiago.pérez10@hotmail.com	+34704030849	\N	2021-10-27
72	Valentina Castro	valentina.castro22@outlook.com	+34744496720	\N	2022-10-14
73	María González	maría.gonzález36@gmail.com	+34 928939898	\N	2023-06-26
74	Juliana López	juliana.lópez27@outlook.com	+34 723 147 896	\N	2022-01-26
75	Laura Díaz	laura.díaz79@hotmail.com	+34737 129 348	\N	2024-01-10
76	Santiago González	santiago.gonzález97@outlook.com	+34749964362	\N	2021-03-25
77	Juliana Moreno	juliana.moreno83@hotmail.com	+34731 346 945	\N	2024-06-16
78	Camilo Castro	camilo.castro62@gmail.com	+34711 723 655	\N	2023-02-03
79	Natalia Rodríguez	natalia.rodríguez3@hotmail.com	+34719 286 562	\N	2023-03-03
80	Valentina Moreno	valentina.moreno77@gmail.com	+34 945 212 604	\N	2023-01-28
81	Carlos Pérez	carlos.pérez84@hotmail.com	+34669083488	\N	2022-07-28
82	María Moreno	maría.moreno20@gmail.com	+34 703 85 56 45	\N	2024-05-03
83	Daniela Moreno	daniela.moreno96@yahoo.com	+34 718 502 701	\N	2025-06-15
84	Juliana Díaz	juliana.díaz54@gmail.com	+34 816 134 749	\N	2020-12-27
85	Natalia Moreno	natalia.moreno91@hotmail.com	+34 717588532	\N	2023-01-06
86	Carlos Moreno	carlos.moreno60@gmail.com	+34 741 986 332	\N	2023-04-08
87	Daniela Díaz	daniela.díaz34@yahoo.com	+34 851 270 488	\N	2024-05-02
88	Juliana Ramírez	juliana.ramírez89@hotmail.com	+34 632723987	\N	2023-06-24
89	Laura Moreno	laura.moreno45@hotmail.com	+34 746 368 617	\N	2024-06-28
90	Daniela Díaz	daniela.díaz89@gmail.com	+34 972 456 973	\N	2024-06-08
91	Camilo González	camilo.gonzález49@hotmail.com	+34 715 78 82 79	\N	2025-10-04
92	María Pérez	maría.pérez55@gmail.com	+34741 937 117	\N	2024-02-09
93	Carlos Martínez	carlos.martínez87@gmail.com	+34 700788590	\N	2024-07-14
94	Daniela López	daniela.lópez79@outlook.com	+34 906332799	\N	2023-09-12
95	Valentina Martínez	valentina.martínez82@outlook.com	+34728427640	\N	2020-10-03
96	Valentina Ramírez	valentina.ramírez29@gmail.com	+34941 11 55 88	\N	2025-07-15
97	Santiago Díaz	santiago.díaz18@gmail.com	+34745364097	\N	2021-03-03
98	Valentina Gómez	valentina.gómez36@outlook.com	+34709 99 81 49	\N	2022-09-21
99	Daniela López	daniela.lópez11@hotmail.com	+34 740082508	\N	2024-03-16
100	Santiago Castro	santiago.castro34@yahoo.com	+34 995 05 87 66	\N	2020-01-30
\.


--
-- Data for Name: shippings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.shippings (id, order_id, address, shipping_date, tracking_code, shipping_address, tracking_number) FROM stdin;
1	99	\N	2021-07-26	\N	Diagonal 12 #34-56, Pereira, Risaralda	COL8499277220
2	14	\N	2020-11-26	\N	Transversal 54 #89-12, Cali, Valle del Cauca	COL8932634034
3	31	\N	2024-12-22	\N	Diagonal 12 #34-56, Medellín, Antioquia	COL4089012555
4	49	\N	2024-03-25	\N	Carrera 10 #23-45, Cúcuta, Norte de Santander	COL3610564099
5	97	\N	2024-07-26	\N	Transversal 54 #89-12, Barranquilla, Atlántico	COL8224363552
6	40	\N	2022-10-13	\N	Diagonal 12 #34-56, Cali, Valle del Cauca	COL5825706303
7	66	\N	2024-05-27	\N	Avenida 68 #45-90, Cali, Valle del Cauca	COL7831158854
8	52	\N	2025-04-28	\N	Calle 45 #12-67, Medellín, Antioquia	COL1151733591
9	39	\N	2023-03-24	\N	Diagonal 12 #34-56, Santa Marta, Magdalena	COL3907877743
10	95	\N	2021-10-21	\N	Avenida 68 #45-90, Pereira, Risaralda	COL6879354147
11	76	\N	2024-12-26	\N	Avenida 68 #45-90, Cali, Valle del Cauca	COL4710377404
12	64	\N	2024-12-22	\N	Transversal 54 #89-12, Cartagena, Bolívar	COL2791925395
13	41	\N	2024-11-08	\N	Avenida 68 #45-90, Cali, Valle del Cauca	COL5170134718
14	23	\N	2023-11-15	\N	Avenida 68 #45-90, Manizales, Caldas	COL3350471414
15	62	\N	2023-01-25	\N	Transversal 54 #89-12, Santa Marta, Magdalena	COL8805718904
16	19	\N	2020-05-16	\N	Diagonal 12 #34-56, Pereira, Risaralda	COL1879779014
17	61	\N	2023-10-09	\N	Avenida 68 #45-90, Medellín, Antioquia	COL5683918596
18	21	\N	2023-05-03	\N	Diagonal 12 #34-56, Manizales, Caldas	COL5208303518
19	15	\N	2020-08-13	\N	Diagonal 12 #34-56, Cartagena, Bolívar	COL7638531094
20	72	\N	2022-11-13	\N	Transversal 54 #89-12, Bucaramanga, Santander	COL9009169612
21	82	\N	2024-05-06	\N	Transversal 54 #89-12, Santa Marta, Magdalena	COL6006492987
22	81	\N	2022-07-10	\N	Carrera 10 #23-45, Barranquilla, Atlántico	COL7753614446
23	43	\N	2020-02-12	\N	Transversal 54 #89-12, Pereira, Risaralda	COL2443474705
24	60	\N	2023-09-28	\N	Transversal 54 #89-12, Medellín, Antioquia	COL8563571019
26	30	\N	2024-10-06	\N	Carrera 10 #23-45, Cúcuta, Norte de Santander	COL6980029924
27	11	\N	2021-02-07	\N	Carrera 10 #23-45, Cúcuta, Norte de Santander	COL8470941993
28	7	\N	2020-07-08	\N	Carrera 10 #23-45, Manizales, Caldas	COL1997462516
29	77	\N	2024-07-06	\N	Diagonal 12 #34-56, Manizales, Caldas	COL5630524774
31	32	\N	2022-05-31	\N	Diagonal 12 #34-56, Cali, Valle del Cauca	COL5288562688
32	89	\N	2021-09-06	\N	Avenida 68 #45-90, Bogotá, Cundinamarca	COL7968555537
33	70	\N	2022-10-26	\N	Calle 45 #12-67, Medellín, Antioquia	COL1306513187
34	33	\N	2024-08-05	\N	Avenida 68 #45-90, Santa Marta, Magdalena	COL8019363025
35	92	\N	2020-09-08	\N	Calle 45 #12-67, Medellín, Antioquia	COL1565398988
36	68	\N	2020-07-24	\N	Transversal 54 #89-12, Bogotá, Cundinamarca	COL6676131702
37	88	\N	2022-02-05	\N	Avenida 68 #45-90, Santa Marta, Magdalena	COL7146844129
38	18	\N	2025-08-12	\N	Transversal 54 #89-12, Santa Marta, Magdalena	COL7056102611
40	5	\N	2022-03-28	\N	Transversal 54 #89-12, Manizales, Caldas	COL5521667133
41	55	\N	2022-10-29	\N	Carrera 10 #23-45, Cúcuta, Norte de Santander	COL7629593253
45	57	\N	2023-08-22	\N	Transversal 54 #89-12, Pereira, Risaralda	COL2593177854
46	74	\N	2023-07-15	\N	Transversal 54 #89-12, Cali, Valle del Cauca	COL7181384023
47	63	\N	2020-08-20	\N	Transversal 54 #89-12, Bucaramanga, Santander	COL9561872031
48	96	\N	2024-12-15	\N	Carrera 10 #23-45, Barranquilla, Atlántico	COL4221861231
49	71	\N	2021-07-26	\N	Avenida 68 #45-90, Bogotá, Cundinamarca	COL5314416701
50	46	\N	2024-04-06	\N	Avenida 68 #45-90, Bogotá, Cundinamarca	COL2029813793
52	51	\N	2024-05-06	\N	Calle 45 #12-67, Bogotá, Cundinamarca	COL2562911377
54	56	\N	2024-12-15	\N	Transversal 54 #89-12, Barranquilla, Atlántico	COL7574283885
55	50	\N	2020-01-24	\N	Transversal 54 #89-12, Barranquilla, Atlántico	COL1370761691
56	80	\N	2024-01-02	\N	Carrera 10 #23-45, Pereira, Risaralda	COL2986107354
58	36	\N	2020-05-19	\N	Carrera 10 #23-45, Manizales, Caldas	COL3212747164
59	44	\N	2022-06-02	\N	Diagonal 12 #34-56, Cartagena, Bolívar	COL5528088668
60	100	\N	2024-05-10	\N	Carrera 10 #23-45, Santa Marta, Magdalena	COL3728447201
61	12	\N	2025-04-16	\N	Avenida 68 #45-90, Medellín, Antioquia	COL3200001119
62	65	\N	2022-12-08	\N	Diagonal 12 #34-56, Manizales, Caldas	COL2506686253
64	16	\N	2022-06-30	\N	Carrera 10 #23-45, Medellín, Antioquia	COL2931740604
65	75	\N	2020-01-25	\N	Carrera 10 #23-45, Pereira, Risaralda	COL6972793031
68	28	\N	2025-08-17	\N	Avenida 68 #45-90, Bucaramanga, Santander	COL3201211140
70	59	\N	2023-07-23	\N	Avenida 68 #45-90, Manizales, Caldas	COL5177818577
73	47	\N	2021-01-11	\N	Carrera 10 #23-45, Santa Marta, Magdalena	COL8665432515
78	78	\N	2025-05-03	\N	Avenida 68 #45-90, Bucaramanga, Santander	COL8187576987
79	45	\N	2022-02-13	\N	Diagonal 12 #34-56, Medellín, Antioquia	COL1686618547
82	73	\N	2021-07-02	\N	Diagonal 12 #34-56, Cali, Valle del Cauca	COL2624662868
86	69	\N	2022-10-07	\N	Calle 45 #12-67, Pereira, Risaralda	COL6557191487
89	2	\N	2022-03-01	\N	Avenida 68 #45-90, Bucaramanga, Santander	COL3809368229
94	8	\N	2023-07-30	\N	Diagonal 12 #34-56, Bucaramanga, Santander	COL4334717551
98	4	\N	2024-05-16	\N	Calle 45 #12-67, Cúcuta, Norte de Santander	COL7385153084
100	84	\N	2025-08-23	\N	Avenida 68 #45-90, Medellín, Antioquia	COL7055826578
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tags (id, name) FROM stdin;
1	Electrodomésticos
2	Ropa
3	Zapatos
4	Tecnología
5	Hogar
6	Accesorios
7	Belleza
8	Juguetes
9	Deportes
10	Supermercado
11	Salud
12	Mascotas
13	Muebles
14	Papelería
15	Herramientas
16	Videojuegos
17	Ofertas
18	Viajes
19	Instrumentos
20	Servicios
21	Electrodomésticos
22	Ropa
23	Zapatos
24	Tecnología
25	Hogar
26	Accesorios
27	Belleza
28	Juguetes
29	Deportes
30	Supermercado
31	Salud
32	Mascotas
33	Muebles
34	Papelería
35	Herramientas
36	Videojuegos
37	Ofertas
38	Viajes
39	Instrumentos
40	Servicios
41	Electrodomésticos
42	Ropa
43	Zapatos
44	Tecnología
45	Hogar
46	Accesorios
47	Belleza
48	Juguetes
49	Deportes
50	Supermercado
51	Salud
52	Mascotas
53	Muebles
54	Papelería
55	Herramientas
56	Videojuegos
57	Ofertas
58	Viajes
59	Instrumentos
60	Servicios
61	Electrodomésticos
62	Ropa
63	Zapatos
64	Tecnología
65	Hogar
66	Accesorios
67	Belleza
68	Juguetes
69	Deportes
70	Supermercado
71	Salud
72	Mascotas
73	Muebles
74	Papelería
75	Herramientas
76	Videojuegos
77	Ofertas
78	Viajes
79	Instrumentos
80	Servicios
81	Electrodomésticos
82	Ropa
83	Zapatos
84	Tecnología
85	Hogar
86	Accesorios
87	Belleza
88	Juguetes
89	Deportes
90	Supermercado
91	Salud
92	Mascotas
93	Muebles
94	Papelería
95	Herramientas
96	Videojuegos
97	Ofertas
98	Viajes
99	Instrumentos
100	Servicios
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_id_seq', 12, true);


--
-- Name: order_details_audit_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.order_details_audit_audit_id_seq', 1, false);


--
-- Name: orders_audit_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.orders_audit_audit_id_seq', 2, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: payments_audit_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.payments_audit_audit_id_seq', 1, false);


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.payments_id_seq', 1, false);


--
-- Name: products_audit_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_audit_audit_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_id_seq', 6, true);


--
-- Name: reviews_audit_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reviews_audit_audit_id_seq', 1, false);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reviews_id_seq', 1, false);


--
-- Name: sellers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sellers_id_seq', 1, false);


--
-- Name: shippings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.shippings_id_seq', 1, false);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tags_id_seq', 1, false);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: order_details_audit order_details_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_details_audit
    ADD CONSTRAINT order_details_audit_pkey PRIMARY KEY (audit_id);


--
-- Name: order_details order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (order_id, product_id);


--
-- Name: orders_audit orders_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders_audit
    ADD CONSTRAINT orders_audit_pkey PRIMARY KEY (audit_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: payments_audit payments_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payments_audit
    ADD CONSTRAINT payments_audit_pkey PRIMARY KEY (audit_id);


--
-- Name: payments payments_order_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_order_id_key UNIQUE (order_id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: product_tags product_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_tags
    ADD CONSTRAINT product_tags_pkey PRIMARY KEY (product_id, tag_id);


--
-- Name: products_audit products_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_audit
    ADD CONSTRAINT products_audit_pkey PRIMARY KEY (audit_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: reviews_audit reviews_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reviews_audit
    ADD CONSTRAINT reviews_audit_pkey PRIMARY KEY (audit_id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: sellers sellers_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT sellers_email_key UNIQUE (email);


--
-- Name: sellers sellers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT sellers_pkey PRIMARY KEY (id);


--
-- Name: shippings shippings_order_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shippings
    ADD CONSTRAINT shippings_order_id_key UNIQUE (order_id);


--
-- Name: shippings shippings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shippings
    ADD CONSTRAINT shippings_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: order_details ai_order_details_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER ai_order_details_audit AFTER INSERT ON public.order_details FOR EACH ROW EXECUTE FUNCTION public.order_details_ai_audit();


--
-- Name: orders ai_orders_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER ai_orders_audit AFTER INSERT ON public.orders FOR EACH ROW EXECUTE FUNCTION public.orders_ai_audit();


--
-- Name: payments ai_payments_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER ai_payments_audit AFTER INSERT ON public.payments FOR EACH ROW EXECUTE FUNCTION public.payments_ai_audit();


--
-- Name: products ai_products_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER ai_products_audit AFTER INSERT ON public.products FOR EACH ROW EXECUTE FUNCTION public.products_ai_audit();


--
-- Name: reviews ai_reviews_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER ai_reviews_audit AFTER INSERT ON public.reviews FOR EACH ROW EXECUTE FUNCTION public.reviews_ai_audit();


--
-- Name: order_details au_order_details_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER au_order_details_audit AFTER UPDATE ON public.order_details FOR EACH ROW EXECUTE FUNCTION public.order_details_au_audit();


--
-- Name: orders au_orders_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER au_orders_audit AFTER UPDATE ON public.orders FOR EACH ROW EXECUTE FUNCTION public.orders_au_audit();


--
-- Name: payments au_payments_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER au_payments_audit AFTER UPDATE ON public.payments FOR EACH ROW EXECUTE FUNCTION public.payments_au_audit();


--
-- Name: products au_products_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER au_products_audit AFTER UPDATE ON public.products FOR EACH ROW EXECUTE FUNCTION public.products_au_audit();


--
-- Name: reviews au_reviews_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER au_reviews_audit AFTER UPDATE ON public.reviews FOR EACH ROW EXECUTE FUNCTION public.reviews_au_audit();


--
-- Name: order_details bd_order_details_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bd_order_details_audit BEFORE DELETE ON public.order_details FOR EACH ROW EXECUTE FUNCTION public.order_details_bd_audit();


--
-- Name: order_details_audit bd_order_details_audit_block; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bd_order_details_audit_block BEFORE DELETE ON public.order_details_audit FOR EACH ROW EXECUTE FUNCTION public.order_details_audit_block_bd();


--
-- Name: orders bd_orders_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bd_orders_audit BEFORE DELETE ON public.orders FOR EACH ROW EXECUTE FUNCTION public.orders_bd_audit();


--
-- Name: orders_audit bd_orders_audit_block; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bd_orders_audit_block BEFORE DELETE ON public.orders_audit FOR EACH ROW EXECUTE FUNCTION public.orders_audit_block_bd();


--
-- Name: payments bd_payments_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bd_payments_audit BEFORE DELETE ON public.payments FOR EACH ROW EXECUTE FUNCTION public.payments_bd_audit();


--
-- Name: payments_audit bd_payments_audit_block; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bd_payments_audit_block BEFORE DELETE ON public.payments_audit FOR EACH ROW EXECUTE FUNCTION public.payments_audit_block_bd();


--
-- Name: products bd_products_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bd_products_audit BEFORE DELETE ON public.products FOR EACH ROW EXECUTE FUNCTION public.products_bd_audit();


--
-- Name: products_audit bd_products_audit_block; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bd_products_audit_block BEFORE DELETE ON public.products_audit FOR EACH ROW EXECUTE FUNCTION public.products_audit_block_bd();


--
-- Name: reviews bd_reviews_audit; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bd_reviews_audit BEFORE DELETE ON public.reviews FOR EACH ROW EXECUTE FUNCTION public.reviews_bd_audit();


--
-- Name: reviews_audit bd_reviews_audit_block; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bd_reviews_audit_block BEFORE DELETE ON public.reviews_audit FOR EACH ROW EXECUTE FUNCTION public.reviews_audit_block_bd();


--
-- Name: order_details_audit bi_order_details_audit_guard; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bi_order_details_audit_guard BEFORE INSERT ON public.order_details_audit FOR EACH ROW EXECUTE FUNCTION public.order_details_audit_guard_bi();


--
-- Name: orders_audit bi_orders_audit_guard; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bi_orders_audit_guard BEFORE INSERT ON public.orders_audit FOR EACH ROW EXECUTE FUNCTION public.orders_audit_guard_bi();


--
-- Name: payments_audit bi_payments_audit_guard; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bi_payments_audit_guard BEFORE INSERT ON public.payments_audit FOR EACH ROW EXECUTE FUNCTION public.payments_audit_guard_bi();


--
-- Name: products_audit bi_products_audit_guard; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bi_products_audit_guard BEFORE INSERT ON public.products_audit FOR EACH ROW EXECUTE FUNCTION public.products_audit_guard_bi();


--
-- Name: reviews_audit bi_reviews_audit_guard; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bi_reviews_audit_guard BEFORE INSERT ON public.reviews_audit FOR EACH ROW EXECUTE FUNCTION public.reviews_audit_guard_bi();


--
-- Name: order_details_audit bu_order_details_audit_block; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bu_order_details_audit_block BEFORE UPDATE ON public.order_details_audit FOR EACH ROW EXECUTE FUNCTION public.order_details_audit_block_bu();


--
-- Name: orders_audit bu_orders_audit_block; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bu_orders_audit_block BEFORE UPDATE ON public.orders_audit FOR EACH ROW EXECUTE FUNCTION public.orders_audit_block_bu();


--
-- Name: payments_audit bu_payments_audit_block; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bu_payments_audit_block BEFORE UPDATE ON public.payments_audit FOR EACH ROW EXECUTE FUNCTION public.payments_audit_block_bu();


--
-- Name: products_audit bu_products_audit_block; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bu_products_audit_block BEFORE UPDATE ON public.products_audit FOR EACH ROW EXECUTE FUNCTION public.products_audit_block_bu();


--
-- Name: reviews_audit bu_reviews_audit_block; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER bu_reviews_audit_block BEFORE UPDATE ON public.reviews_audit FOR EACH ROW EXECUTE FUNCTION public.reviews_audit_block_bu();


--
-- Name: order_details order_details_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: order_details order_details_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: payments payments_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: product_tags product_tags_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_tags
    ADD CONSTRAINT product_tags_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: product_tags product_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_tags
    ADD CONSTRAINT product_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: products products_seller_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_seller_id_fkey FOREIGN KEY (seller_id) REFERENCES public.sellers(id);


--
-- Name: reviews reviews_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: shippings shippings_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shippings
    ADD CONSTRAINT shippings_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- PostgreSQL database dump complete
--

\unrestrict 03Oj3pEiBfTZI7yn1DHzbGZGdIJgwKD0y7xIAOdEDIO8kTntIU6iwDmjZlL4eMn

