--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2024-12-16 21:58:42

--
-- TOC entry 226 (class 1255 OID 17247)
-- Name: auto_gen_account_id(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.auto_gen_account_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN
  NEW.id := nextval('account_id_generator');
  RETURN NEW;
END;$$;


ALTER FUNCTION public.auto_gen_account_id() OWNER TO postgres;

--
-- TOC entry 4829 (class 0 OID 0)
-- Dependencies: 226
-- Name: FUNCTION auto_gen_account_id(); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.auto_gen_account_id() IS 'automatically generates and inserts id for new account';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 17099)
-- Name: Account_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Account_types" (
    id bigint NOT NULL,
    type_name character varying(255) NOT NULL
);


ALTER TABLE public."Account_types" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17092)
-- Name: Accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Accounts" (
    id bigint NOT NULL,
    user_name character varying(255) NOT NULL,
    type_id bigint NOT NULL,
    email character varying(255) NOT NULL,
    hashed_password character varying(255) NOT NULL,
    profile_proto json,
    phone character varying(255),
    resume json
);


ALTER TABLE public."Accounts" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17060)
-- Name: Achievements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Achievements" (
    account_id bigint NOT NULL,
    total_tests_count bigint DEFAULT 0 NOT NULL,
    total_exercises_count bigint DEFAULT 0 NOT NULL,
    total_articles_count bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public."Achievements" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17104)
-- Name: Article_Themes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Article_Themes" (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public."Article_Themes" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17068)
-- Name: Articles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Articles" (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    rating bigint DEFAULT 0,
    author_id bigint NOT NULL,
    first_paragraph character varying(255) NOT NULL,
    file json NOT NULL,
    theme_id bigint NOT NULL
);


ALTER TABLE public."Articles" OWNER TO postgres;

--
-- TOC entry 4830 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN "Articles".first_paragraph; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Articles".first_paragraph IS 'will be shown as a preview, can be the first paragraph of the file or manually inserted';


--
-- TOC entry 224 (class 1259 OID 17109)
-- Name: Person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Person" (
    account_id bigint NOT NULL,
    name character varying(255),
    surname character varying(255),
    father_name character varying(255),
    dob date
);


ALTER TABLE public."Person" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17076)
-- Name: Tests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tests" (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    rating bigint DEFAULT 0,
    author_id bigint NOT NULL,
    file json NOT NULL
);


ALTER TABLE public."Tests" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17084)
-- Name: Vacancy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Vacancy" (
    id bigint NOT NULL,
    title bigint NOT NULL,
    file json NOT NULL,
    hire_manager_id bigint NOT NULL,
    publish_date date NOT NULL,
    remove_date date NOT NULL,
    views bigint DEFAULT 0
);


ALTER TABLE public."Vacancy" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17151)
-- Name: account_id_generator; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_id_generator
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 1000000
    CACHE 20;


ALTER SEQUENCE public.account_id_generator OWNER TO postgres;

--
-- TOC entry 4831 (class 0 OID 0)
-- Dependencies: 225
-- Name: account_id_generator; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_id_generator OWNED BY public."Accounts".id;


--
-- TOC entry 4832 (class 0 OID 0)
-- Dependencies: 225
-- Name: SEQUENCE account_id_generator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON SEQUENCE public.account_id_generator IS 'generates account id';

ALTER TABLE ONLY public."Account_types"
    ADD CONSTRAINT "Account_types_pkey" PRIMARY KEY (id);


--
-- TOC entry 4655 (class 2606 OID 17098)
-- Name: Accounts Accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_pkey" PRIMARY KEY (id);


--
-- TOC entry 4647 (class 2606 OID 17067)
-- Name: Achievements Achievements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Achievements"
    ADD CONSTRAINT "Achievements_pkey" PRIMARY KEY (account_id);


--
-- TOC entry 4659 (class 2606 OID 17108)
-- Name: Article_Themes Article_Themes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Article_Themes"
    ADD CONSTRAINT "Article_Themes_pkey" PRIMARY KEY (id);


--
-- TOC entry 4649 (class 2606 OID 17075)
-- Name: Articles Articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Articles"
    ADD CONSTRAINT "Articles_pkey" PRIMARY KEY (id);


--
-- TOC entry 4661 (class 2606 OID 17115)
-- Name: Person Person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Person"
    ADD CONSTRAINT "Person_pkey" PRIMARY KEY (account_id);


--
-- TOC entry 4651 (class 2606 OID 17083)
-- Name: Tests Tests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tests"
    ADD CONSTRAINT "Tests_pkey" PRIMARY KEY (id);


--
-- TOC entry 4653 (class 2606 OID 17091)
-- Name: Vacancy Vacancy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vacancy"
    ADD CONSTRAINT "Vacancy_pkey" PRIMARY KEY (id);


--
-- TOC entry 4669 (class 2620 OID 17248)
-- Name: Accounts auto_gen_new_account_id; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER auto_gen_new_account_id BEFORE INSERT ON public."Accounts" FOR EACH ROW EXECUTE FUNCTION public.auto_gen_account_id();


--
-- TOC entry 4834 (class 0 OID 0)
-- Dependencies: 4669
-- Name: TRIGGER auto_gen_new_account_id ON "Accounts"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TRIGGER auto_gen_new_account_id ON public."Accounts" IS 'automatically generates new account id when a new row is inserted';


--
-- TOC entry 4667 (class 2606 OID 17116)
-- Name: Accounts accounts_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT accounts_type_id_foreign FOREIGN KEY (type_id) REFERENCES public."Account_types"(id);


--
-- TOC entry 4662 (class 2606 OID 17121)
-- Name: Achievements achievements_account_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Achievements"
    ADD CONSTRAINT achievements_account_id_foreign FOREIGN KEY (account_id) REFERENCES public."Accounts"(id);


--
-- TOC entry 4663 (class 2606 OID 17126)
-- Name: Articles articles_author_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Articles"
    ADD CONSTRAINT articles_author_id_foreign FOREIGN KEY (author_id) REFERENCES public."Accounts"(id);


--
-- TOC entry 4664 (class 2606 OID 17131)
-- Name: Articles articles_theme_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Articles"
    ADD CONSTRAINT articles_theme_id_foreign FOREIGN KEY (theme_id) REFERENCES public."Article_Themes"(id);


--
-- TOC entry 4668 (class 2606 OID 17136)
-- Name: Person person_account_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Person"
    ADD CONSTRAINT person_account_id_foreign FOREIGN KEY (account_id) REFERENCES public."Accounts"(id);


--
-- TOC entry 4665 (class 2606 OID 17141)
-- Name: Tests tests_author_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tests"
    ADD CONSTRAINT tests_author_id_foreign FOREIGN KEY (author_id) REFERENCES public."Accounts"(id);


--
-- TOC entry 4666 (class 2606 OID 17146)
-- Name: Vacancy vacancy_hire_manager_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vacancy"
    ADD CONSTRAINT vacancy_hire_manager_id_foreign FOREIGN KEY (hire_manager_id) REFERENCES public."Accounts"(id);


-- Completed on 2024-12-16 21:58:42

--
-- PostgreSQL database dump complete
--

