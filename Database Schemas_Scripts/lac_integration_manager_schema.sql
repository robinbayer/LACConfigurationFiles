ALTER DEFAULT PRIVILEGES IN SCHEMA utilities GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO lacprocessuser;
ALTER DEFAULT PRIVILEGES IN SCHEMA integration GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO lacprocessuser;

// TEMP CODE
CREATE TABLE IF NOT EXISTS utilities.prior_member
(
    prior_member_internal_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    first_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    account_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    lac_membership_start_date timestamp without time zone NOT NULL,
    lac_membership_end_date timestamp without time zone,
    salesforce_id character varying(18) COLLATE pg_catalog."default" NOT NULL,
    lac_membership_level character varying(50) COLLATE pg_catalog."default",
    superseded_salesforce_id character varying(18) COLLATE pg_catalog."default" NOT NULL,
    membership_level_code integer NOT NULL,
    record_processing_status_code integer NOT NULL,
    work_queue_id integer NOT NULL,
    CONSTRAINT prior_member_pkey PRIMARY KEY (prior_member_internal_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS utilities.prior_member
    OWNER to postgres;
// END TEMP CODE


CREATE TABLE IF NOT EXISTS integration.membership_level
(
    membership_level_code integer NOT NULL,
    description character varying(50) COLLATE pg_catalog."default" NOT NULL,
    active boolean NOT NULL,
    CONSTRAINT membership_level_pkey PRIMARY KEY (membership_level_code)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS integration.membership_level
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS integration.membership_status
(
    membership_status_code integer NOT NULL,
    description character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT membership_status_pkey PRIMARY KEY (membership_status_code)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS integration.membership_status
    OWNER to postgres;



CREATE TABLE IF NOT EXISTS integration.website_user
(
    website_user_internal_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    website_user_external_id character varying(32) COLLATE pg_catalog."default" NOT NULL,
    login_name character varying(30) COLLATE pg_catalog."default" NOT NULL,
    reference_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    wp_user_id integer NOT NULL,
    sf_id character varying(18) COLLATE pg_catalog."default" NOT NULL,
    record_added_date_time timestamp without time zone NOT NULL,
    record_last_updated_date_time timestamp without time zone NOT NULL,
    CONSTRAINT website_user_pkey PRIMARY KEY (website_user_internal_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS integration.website_user
    OWNER to postgres;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA utilities TO lacprocessuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA integration TO lacprocessuser;
