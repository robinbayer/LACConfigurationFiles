ALTER DEFAULT PRIVILEGES IN SCHEMA customer GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO i2fprocessuser;
ALTER DEFAULT PRIVILEGES IN SCHEMA session GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO i2fprocessuser;
ALTER DEFAULT PRIVILEGES IN SCHEMA product GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO i2fprocessuser;
ALTER DEFAULT PRIVILEGES IN SCHEMA website GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO i2fprocessuser;

CREATE TABLE IF NOT EXISTS website.landing_page_view
(
    landing_page_view_internal_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    landing_page_view_external_id character varying(32) COLLATE pg_catalog."default" NOT NULL,
    character_name character varying(30) COLLATE pg_catalog."default" NOT NULL,
    character_image_filename character varying(40) COLLATE pg_catalog."default" NOT NULL,
    character_brief_description character varying(50) COLLATE pg_catalog."default" NOT NULL,
    character_descriptive_markup character varying(500) COLLATE pg_catalog."default" NOT NULL,
    sort_order integer NOT NULL,
    active boolean NOT NULL,
    CONSTRAINT landing_page_view_pkey PRIMARY KEY (landing_page_view_internal_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS website.landing_page_view
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS product.product_status
(
    product_status_code integer NOT NULL,
    description character varying(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT product_status_pkey PRIMARY KEY (product_status_code)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS product.product_status
    OWNER to postgres;

INSERT INTO product.product_status
  (product_status_code, description)
  VALUES (1, 'Development');

INSERT INTO product.product_status
  (product_status_code, description)
  VALUES (2, 'Active');

INSERT INTO product.product_status
  (product_status_code, description)
  VALUES (3, 'Discontinued');

INSERT INTO product.product_status
  (product_status_code, description)
  VALUES (4, 'Temporarily Inactive');

CREATE TABLE IF NOT EXISTS product.product_size
(
    product_size_code character varying(3) COLLATE pg_catalog."default" NOT NULL,
    description character varying(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT product_size_pkey PRIMARY KEY (product_size_code)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS product.product_size
    OWNER to postgres;

INSERT INTO product.product_size
  (product_size_code, description)
  VALUES ('R', 'Regular');

INSERT INTO product.product_size
  (product_size_code, description)
  VALUES ('S', 'Small');

CREATE TABLE IF NOT EXISTS product.product
(
    product_internal_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    product_external_id character varying(32) COLLATE pg_catalog."default",
    model_name character varying(30) COLLATE pg_catalog."default" NOT NULL,
    description character varying(100) COLLATE pg_catalog."default" NOT NULL,
	right_panel_color_code character varying(10) COLLATE pg_catalog."default",
	left_panel_color_code character varying(10) COLLATE pg_catalog."default",
	center_panel_color_code character varying(10) COLLATE pg_catalog."default",
    product_status_code integer NOT NULL,
    sort_order integer,
    record_added_date_time timestamp without time zone NOT NULL,
    record_last_updated_date_time timestamp without time zone NOT NULL,
    CONSTRAINT product_pkey PRIMARY KEY (product_internal_id),
    CONSTRAINT fk_product_product_status FOREIGN KEY (product_status_code)
        REFERENCES product.product_status (product_status_code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS product.product
    OWNER to postgres;

GRANT ALL ON TABLE product.product TO postgres;

CREATE INDEX IF NOT EXISTS idx_product
    ON product.product USING btree
    (product_external_id COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

CREATE INDEX IF NOT EXISTS idx2_product
    ON product.product USING btree
    (model_name COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

CREATE INDEX IF NOT EXISTS idx3_product
    ON product.product USING btree
    (ecommerce_system_product_id COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

CREATE INDEX IF NOT EXISTS idx5_product
    ON product.product USING btree
    (ecommerce_system_product_id COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS product.product_size_mapping_entry
(
    product_size_mapping_entry_internal_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    product_size_mapping_entry_external_id character varying COLLATE pg_catalog."default" NOT NULL,
    product_internal_id integer NOT NULL,
    product_size_code character varying(3) COLLATE pg_catalog."default" NOT NULL,
    sku character varying COLLATE pg_catalog."default" NOT NULL,
    ecommerce_provider_product_external_id character varying(32) COLLATE pg_catalog."default",
    product_status_code integer NOT NULL,
    record_added_date_time timestamp without time zone NOT NULL,
    record_last_updated_date_time timestamp without time zone NOT NULL,
    CONSTRAINT product_size_mapping_entry_pkey PRIMARY KEY (product_size_mapping_entry_internal_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS product.product_size_mapping_entry
    OWNER to postgres;

CREATE INDEX IF NOT EXISTS idx_product_size_mapping_entry
    ON product.product_size_mapping_entry USING btree
    (product_size_mapping_entry_external_id COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

CREATE INDEX IF NOT EXISTS idx2_product_size_mapping_entry
    ON product.product_size_mapping_entry USING btree
    (product_internal_id ASC NULLS LAST)
    TABLESPACE pg_default;

CREATE INDEX IF NOT EXISTS idx3_product_size_mapping_entry
    ON product.product_size_mapping_entry USING btree
    (sku COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

ALTER TABLE product.product_size_mapping_entry
    ADD CONSTRAINT fk_product_size_mapping_entry_product_size 
	FOREIGN KEY (product_size_code) REFERENCES product.product_size (product_size_code);

ALTER TABLE product.product_size_mapping_entry
    ADD CONSTRAINT fk_product_size_mapping_entry_product_status 
	FOREIGN KEY (product_status_code) REFERENCES product.product_status (product_status_code);


CREATE TABLE IF NOT EXISTS product.product_depiction
(
    product_depiction_internal_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    product_depiction_external_id character varying(32) COLLATE pg_catalog."default" NOT NULL,
    product_internal_id integer NOT NULL,
    depiction_category character varying(30) COLLATE pg_catalog."default" NOT NULL,
    reference_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    image_file_name character varying(40) COLLATE pg_catalog."default" NOT NULL,
    record_added_date_time timestamp without time zone NOT NULL,
    record_last_updated_date_time timestamp without time zone NOT NULL,
    CONSTRAINT product_depiction_pkey PRIMARY KEY (product_depiction_internal_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS product.product_depiction
    OWNER to postgres;

CREATE INDEX idx_product_depiction
    ON product.product_depiction USING btree
    (product_depiction_external_id COLLATE pg_catalog."default" ASC NULLS LAST);

CREATE INDEX idx2_product_depiction 
    ON customer.job_for_processing_server_instance 
    (processing_job_internal_id);

CREATE INDEX idx3_product_depiction
    ON product.product_depiction USING btree
    (depiction_category COLLATE pg_catalog."default" ASC NULLS LAST);

ALTER TABLE product.product_depiction
    ADD CONSTRAINT fk_product_depiction_product 
	FOREIGN KEY (product_internal_id) REFERENCES product.product (product_internal_id);



CREATE TABLE IF NOT EXISTS customer.order_status
(
    order_status_code integer NOT NULL,
    description character varying(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT order_status_pkey PRIMARY KEY (order_status_code)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS customer.order_status
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS customer.processing_job_result_code
(
    result_code integer NOT NULL,
    description character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT processing_job_result_code_pkey PRIMARY KEY (result_code)
)

TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS customer.processing_job
(
    processing_job_internal_id integer NOT NULL,
    job_name character varying(60) COLLATE pg_catalog."default" NOT NULL,
    description_comments character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT processing_job_pkey PRIMARY KEY (processing_job_internal_id)
)

TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS customer.job_for_processing_server_instance
(
    processing_job_internal_id integer NOT NULL,
    processing_server_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    cron_expression character varying(60) COLLATE pg_catalog."default",
    active boolean NOT NULL,
    last_run_date_time timestamp without time zone,
    last_run_information_text character varying(1024) COLLATE pg_catalog."default",
    last_run_result_code integer,
    CONSTRAINT job_for_processing_server_instance_pkey PRIMARY KEY (processing_job_internal_id, processing_server_id)
)

TABLESPACE pg_default;

CREATE INDEX idx_job_for_processing_server_instance ON customer.job_for_processing_server_instance (processing_job_internal_id);

ALTER TABLE customer.job_for_processing_server_instance
    ADD CONSTRAINT fk_job_for_processing_server_instance 
	FOREIGN KEY (processing_job_internal_id) REFERENCES customer.processing_job (processing_job_internal_id);

CREATE TABLE IF NOT EXISTS customer.customer
(
    customer_internal_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    customer_external_id character varying(32) COLLATE pg_catalog."default" NOT NULL,
    idp_customer_external_id character varying(32) COLLATE pg_catalog."default",
    record_added_date_time timestamp without time zone NOT NULL,
    email_address character varying(100) COLLATE pg_catalog."default" NOT NULL,
    email_address_verified boolean NOT NULL,
    email_verification_code character varying(6) COLLATE pg_catalog."default",
    last_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    first_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    ecp_customer_external_id character varying(32) COLLATE pg_catalog."default",
    CONSTRAINT customer_pkey PRIMARY KEY (customer_internal_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS customer.customer
    OWNER to postgres;

CREATE INDEX idx_customer ON customer.customer (customer_external_id);
CREATE INDEX idx2_customer ON customer.customer (email_address);
CREATE INDEX idx3_customer ON customer.customer (idp_customer_external_id);
CREATE INDEX idx4_customer ON customer.customer (ecp_customer_external_id);

CREATE TABLE IF NOT EXISTS session.customer_session
(
    customer_session_internal_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    customer_session_external_id character varying(32) COLLATE pg_catalog."default" NOT NULL,
    request_ip_address character varying(15),
    customer_internal_id integer,
    ecp_cart_external_id character varying(32) COLLATE pg_catalog."default",
    cookies_accepted boolean,
    email_address_verified boolean,
    record_created_date_time timestamp without time zone NOT NULL,
    record_last_updated_date_time timestamp without time zone NOT NULL,
    valid_until_date_time timestamp without time zone NOT NULL,
    CONSTRAINT customer_session_pkey PRIMARY KEY (customer_session_internal_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS session.customer_session
    OWNER to postgres;

CREATE INDEX idx_customer_session ON customer.customer_session (customer_session_external_id);
CREATE INDEX idx2_customer_session ON customer.customer_session (customer_internal_id);
CREATE INDEX idx3_customer_session ON customer.customer_session (valid_until_date_time);

ALTER TABLE session.customer_session
    ADD CONSTRAINT fk_customer_session_customer 
	FOREIGN KEY (customer_internal_id) REFERENCES customer.customer (customer_internal_id);

CREATE TABLE IF NOT EXISTS customer.completed_order
(
    completed_order_internal_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    completed_order_external_id character varying(32) COLLATE pg_catalog."default" NOT NULL,
    ecp_order_external_id character varying(32) COLLATE pg_catalog."default" NOT NULL,
    customer_internal_id integer NOT NULL,
    carrier_tracking_number character varying(32) COLLATE pg_catalog."default",
    order_status_code integer NOT NULL,
    record_created_date_time timestamp without time zone NOT NULL,
    record_last_updated_date_time timestamp without time zone NOT NULL,
    CONSTRAINT completed_order_pkey PRIMARY KEY (completed_order_internal_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS customer.completed_order
    OWNER to postgres;

CREATE INDEX idx_completed_order ON customer.completed_order (completed_order_external_id);
CREATE INDEX idx2_completed_order ON customer.completed_order (ecp_order_external_id);
CREATE INDEX idx3_completed_order ON customer.completed_order (customer_internal_id);
CREATE INDEX idx4_completed_order ON customer.completed_order (carrier_tracking_number);

ALTER TABLE customer.completed_order
    ADD CONSTRAINT fk_completed_order_order_status 
	FOREIGN KEY (order_status_code) REFERENCES customer.order_status (order_status_code);

ALTER TABLE customer.completed_order
    ADD CONSTRAINT fk_completed_order_customer 
	FOREIGN KEY (customer_internal_id) REFERENCES customer.customer (customer_internal_id);

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA customer TO i2fprocessuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA session TO i2fprocessuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA product TO i2fprocessuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA website TO i2fprocessuser;