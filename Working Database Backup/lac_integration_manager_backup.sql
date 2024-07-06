PGDMP      	                |           i2f_customer %   14.12 (Ubuntu 14.12-0ubuntu0.22.04.1)    16.3 j    w           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            x           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            y           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            z           1262    16385    i2f_customer    DATABASE     x   CREATE DATABASE i2f_customer WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE i2f_customer;
                postgres    false                        2615    16386    customer    SCHEMA        CREATE SCHEMA customer;
    DROP SCHEMA customer;
                postgres    false                        2615    16766    product    SCHEMA        CREATE SCHEMA product;
    DROP SCHEMA product;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            {           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4                        2615    16474    session    SCHEMA        CREATE SCHEMA session;
    DROP SCHEMA session;
                postgres    false            	            2615    16845    website    SCHEMA        CREATE SCHEMA website;
    DROP SCHEMA website;
                postgres    false            �            1259    16387    completed_order    TABLE     �  CREATE TABLE customer.completed_order (
    completed_order_internal_id integer NOT NULL,
    completed_order_external_id character varying(32) NOT NULL,
    ecp_order_external_id character varying(32) NOT NULL,
    carrier_tracking_number character varying(32),
    order_status_code integer NOT NULL,
    record_created_date_time timestamp without time zone NOT NULL,
    record_last_updated_date_time timestamp without time zone NOT NULL,
    customer_internal_id integer NOT NULL
);
 %   DROP TABLE customer.completed_order;
       customer         heap    postgres    false    6            |           0    0    TABLE completed_order    ACL     W   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE customer.completed_order TO i2fprocessuser;
          customer          postgres    false    213            �            1259    16390 /   completed_order_completed_order_internal_id_seq    SEQUENCE       ALTER TABLE customer.completed_order ALTER COLUMN completed_order_internal_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME customer.completed_order_completed_order_internal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            customer          postgres    false    6    213            �            1259    16391    customer    TABLE       CREATE TABLE customer.customer (
    customer_internal_id integer NOT NULL,
    customer_external_id character varying(32) NOT NULL,
    idp_customer_external_id character varying(32),
    record_added_date_time timestamp without time zone NOT NULL,
    email_address character varying(100) NOT NULL,
    last_name character varying(50) NOT NULL,
    first_name character varying(50) NOT NULL,
    ecp_customer_external_id character varying(32),
    email_address_verified boolean NOT NULL,
    email_verification_code character varying(6)
);
    DROP TABLE customer.customer;
       customer         heap    postgres    false    6            }           0    0    TABLE customer    ACL     P   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE customer.customer TO i2fprocessuser;
          customer          postgres    false    215            �            1259    16394 !   customer_customer_internal_id_seq    SEQUENCE     �   ALTER TABLE customer.customer ALTER COLUMN customer_internal_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME customer.customer_customer_internal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            customer          postgres    false    215    6            �            1259    16404 "   job_for_processing_server_instance    TABLE     |  CREATE TABLE customer.job_for_processing_server_instance (
    processing_job_internal_id integer NOT NULL,
    processing_server_id character varying(10) NOT NULL,
    cron_expression character varying(60),
    active boolean NOT NULL,
    last_run_date_time timestamp without time zone,
    last_run_information_text character varying(1024),
    last_run_result_code integer
);
 8   DROP TABLE customer.job_for_processing_server_instance;
       customer         heap    postgres    false    6            ~           0    0 (   TABLE job_for_processing_server_instance    ACL     j   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE customer.job_for_processing_server_instance TO i2fprocessuser;
          customer          postgres    false    217            �            1259    16409    order_status    TABLE        CREATE TABLE customer.order_status (
    order_status_code integer NOT NULL,
    description character varying(30) NOT NULL
);
 "   DROP TABLE customer.order_status;
       customer         heap    postgres    false    6                       0    0    TABLE order_status    ACL     T   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE customer.order_status TO i2fprocessuser;
          customer          postgres    false    218            �            1259    16412    processing_job    TABLE     �   CREATE TABLE customer.processing_job (
    processing_job_internal_id integer NOT NULL,
    job_name character varying(60) NOT NULL,
    description_comments character varying(255)
);
 $   DROP TABLE customer.processing_job;
       customer         heap    postgres    false    6            �           0    0    TABLE processing_job    ACL     V   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE customer.processing_job TO i2fprocessuser;
          customer          postgres    false    219            �            1259    16415    processing_job_result_code    TABLE     �   CREATE TABLE customer.processing_job_result_code (
    result_code integer NOT NULL,
    description character varying NOT NULL
);
 0   DROP TABLE customer.processing_job_result_code;
       customer         heap    postgres    false    6            �           0    0     TABLE processing_job_result_code    ACL     b   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE customer.processing_job_result_code TO i2fprocessuser;
          customer          postgres    false    220            �            1259    16785    product    TABLE     ;  CREATE TABLE product.product (
    product_internal_id integer NOT NULL,
    product_external_id character varying(32),
    model_name character varying(30) NOT NULL,
    description character varying(100) NOT NULL,
    right_panel_color_code character varying(10),
    left_panel_color_code character varying(10),
    center_panel_color_code character varying(10),
    product_status_code integer NOT NULL,
    record_added_date_time timestamp without time zone NOT NULL,
    record_last_updated_date_time timestamp without time zone NOT NULL,
    sort_order integer
);
    DROP TABLE product.product;
       product         heap    postgres    false    8            �           0    0    TABLE product    ACL     N   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE product.product TO i2fprocessuser;
          product          postgres    false    225            �            1259    16802    product_depiction    TABLE     �  CREATE TABLE product.product_depiction (
    product_depiction_internal_id integer NOT NULL,
    product_depiction_external_id character varying(32) NOT NULL,
    product_internal_id integer NOT NULL,
    depiction_category character varying(30) NOT NULL,
    reference_name character varying(100) NOT NULL,
    image_file_name character varying(40) NOT NULL,
    record_added_date_time timestamp without time zone NOT NULL,
    record_last_updated_date_time timestamp without time zone NOT NULL
);
 &   DROP TABLE product.product_depiction;
       product         heap    postgres    false    8            �           0    0    TABLE product_depiction    ACL     X   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE product.product_depiction TO i2fprocessuser;
          product          postgres    false    227            �            1259    16801 3   product_depiction_product_depiction_internal_id_seq    SEQUENCE       ALTER TABLE product.product_depiction ALTER COLUMN product_depiction_internal_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME product.product_depiction_product_depiction_internal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            product          postgres    false    227    8            �            1259    16784    product_product_internal_id_seq    SEQUENCE     �   ALTER TABLE product.product ALTER COLUMN product_internal_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME product.product_product_internal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            product          postgres    false    8    225            �            1259    16815    product_size    TABLE     �   CREATE TABLE product.product_size (
    product_size_code character varying(3) NOT NULL,
    description character varying(30) NOT NULL
);
 !   DROP TABLE product.product_size;
       product         heap    postgres    false    8            �           0    0    TABLE product_size    ACL     S   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE product.product_size TO i2fprocessuser;
          product          postgres    false    228            �            1259    16821    product_size_mapping_entry    TABLE     0  CREATE TABLE product.product_size_mapping_entry (
    product_size_mapping_entry_internal_id integer NOT NULL,
    product_size_mapping_entry_external_id character varying NOT NULL,
    product_internal_id integer NOT NULL,
    sku character varying NOT NULL,
    product_size_code character varying(3) NOT NULL,
    product_status_code integer NOT NULL,
    record_added_date_time timestamp without time zone NOT NULL,
    record_last_updated_date_time timestamp without time zone NOT NULL,
    ecommerce_provider_product_external_id character varying(32)
);
 /   DROP TABLE product.product_size_mapping_entry;
       product         heap    postgres    false    8            �           0    0     TABLE product_size_mapping_entry    ACL     a   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE product.product_size_mapping_entry TO i2fprocessuser;
          product          postgres    false    230            �            1259    16820 ;   product_size_sku_product_size_mapping_entry_internal_id_seq    SEQUENCE     /  ALTER TABLE product.product_size_mapping_entry ALTER COLUMN product_size_mapping_entry_internal_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME product.product_size_sku_product_size_mapping_entry_internal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            product          postgres    false    8    230            �            1259    16767    product_status    TABLE     �   CREATE TABLE product.product_status (
    product_status_code integer NOT NULL,
    description character varying(30) NOT NULL
);
 #   DROP TABLE product.product_status;
       product         heap    postgres    false    8            �           0    0    TABLE product_status    ACL     U   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE product.product_status TO i2fprocessuser;
          product          postgres    false    223            �            1259    16476    customer_session    TABLE     4  CREATE TABLE session.customer_session (
    customer_session_internal_id integer NOT NULL,
    customer_session_external_id character varying(32) NOT NULL,
    customer_internal_id integer,
    record_created_date_time timestamp without time zone NOT NULL,
    record_last_updated_date_time timestamp without time zone NOT NULL,
    valid_until_date_time timestamp without time zone NOT NULL,
    cookies_accepted boolean,
    email_address_verified boolean,
    request_ip_address character varying(15) NOT NULL,
    ecp_cart_external_id character varying(32)
);
 %   DROP TABLE session.customer_session;
       session         heap    postgres    false    7            �           0    0    TABLE customer_session    ACL     W   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE session.customer_session TO i2fprocessuser;
          session          postgres    false    222            �            1259    16475 1   customer_session_customer_session_internal_id_seq    SEQUENCE       ALTER TABLE session.customer_session ALTER COLUMN customer_session_internal_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME session.customer_session_customer_session_internal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            session          postgres    false    7    222            �            1259    16847    landing_page_view    TABLE     �  CREATE TABLE website.landing_page_view (
    landing_page_view_internal_id integer NOT NULL,
    landing_page_view_external_id character varying(32) NOT NULL,
    character_name character varying(30) NOT NULL,
    character_image_filename character varying(40) NOT NULL,
    character_descriptive_markup character varying(500) NOT NULL,
    active boolean NOT NULL,
    sort_order integer NOT NULL,
    character_brief_description character varying(50) NOT NULL
);
 &   DROP TABLE website.landing_page_view;
       website         heap    postgres    false    9            �            1259    16846 3   landing_page_view_landing_page_view_internal_id_seq    SEQUENCE       ALTER TABLE website.landing_page_view ALTER COLUMN landing_page_view_internal_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME website.landing_page_view_landing_page_view_internal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            website          postgres    false    232    9            a          0    16387    completed_order 
   TABLE DATA           �   COPY customer.completed_order (completed_order_internal_id, completed_order_external_id, ecp_order_external_id, carrier_tracking_number, order_status_code, record_created_date_time, record_last_updated_date_time, customer_internal_id) FROM stdin;
    customer          postgres    false    213   �       c          0    16391    customer 
   TABLE DATA           �   COPY customer.customer (customer_internal_id, customer_external_id, idp_customer_external_id, record_added_date_time, email_address, last_name, first_name, ecp_customer_external_id, email_address_verified, email_verification_code) FROM stdin;
    customer          postgres    false    215   3�       e          0    16404 "   job_for_processing_server_instance 
   TABLE DATA           �   COPY customer.job_for_processing_server_instance (processing_job_internal_id, processing_server_id, cron_expression, active, last_run_date_time, last_run_information_text, last_run_result_code) FROM stdin;
    customer          postgres    false    217   ��       f          0    16409    order_status 
   TABLE DATA           H   COPY customer.order_status (order_status_code, description) FROM stdin;
    customer          postgres    false    218          g          0    16412    processing_job 
   TABLE DATA           f   COPY customer.processing_job (processing_job_internal_id, job_name, description_comments) FROM stdin;
    customer          postgres    false    219   ߑ       h          0    16415    processing_job_result_code 
   TABLE DATA           P   COPY customer.processing_job_result_code (result_code, description) FROM stdin;
    customer          postgres    false    220   ��       m          0    16785    product 
   TABLE DATA             COPY product.product (product_internal_id, product_external_id, model_name, description, right_panel_color_code, left_panel_color_code, center_panel_color_code, product_status_code, record_added_date_time, record_last_updated_date_time, sort_order) FROM stdin;
    product          postgres    false    225   �       o          0    16802    product_depiction 
   TABLE DATA           �   COPY product.product_depiction (product_depiction_internal_id, product_depiction_external_id, product_internal_id, depiction_category, reference_name, image_file_name, record_added_date_time, record_last_updated_date_time) FROM stdin;
    product          postgres    false    227   C�       p          0    16815    product_size 
   TABLE DATA           G   COPY product.product_size (product_size_code, description) FROM stdin;
    product          postgres    false    228   ܞ       r          0    16821    product_size_mapping_entry 
   TABLE DATA           &  COPY product.product_size_mapping_entry (product_size_mapping_entry_internal_id, product_size_mapping_entry_external_id, product_internal_id, sku, product_size_code, product_status_code, record_added_date_time, record_last_updated_date_time, ecommerce_provider_product_external_id) FROM stdin;
    product          postgres    false    230   �       k          0    16767    product_status 
   TABLE DATA           K   COPY product.product_status (product_status_code, description) FROM stdin;
    product          postgres    false    223   0�       j          0    16476    customer_session 
   TABLE DATA           !  COPY session.customer_session (customer_session_internal_id, customer_session_external_id, customer_internal_id, record_created_date_time, record_last_updated_date_time, valid_until_date_time, cookies_accepted, email_address_verified, request_ip_address, ecp_cart_external_id) FROM stdin;
    session          postgres    false    222   ��       t          0    16847    landing_page_view 
   TABLE DATA           �   COPY website.landing_page_view (landing_page_view_internal_id, landing_page_view_external_id, character_name, character_image_filename, character_descriptive_markup, active, sort_order, character_brief_description) FROM stdin;
    website          postgres    false    232   �       �           0    0 /   completed_order_completed_order_internal_id_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('customer.completed_order_completed_order_internal_id_seq', 1, false);
          customer          postgres    false    214            �           0    0 !   customer_customer_internal_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('customer.customer_customer_internal_id_seq', 1, true);
          customer          postgres    false    216            �           0    0 3   product_depiction_product_depiction_internal_id_seq    SEQUENCE SET     c   SELECT pg_catalog.setval('product.product_depiction_product_depiction_internal_id_seq', 51, true);
          product          postgres    false    226            �           0    0    product_product_internal_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('product.product_product_internal_id_seq', 28, true);
          product          postgres    false    224            �           0    0 ;   product_size_sku_product_size_mapping_entry_internal_id_seq    SEQUENCE SET     k   SELECT pg_catalog.setval('product.product_size_sku_product_size_mapping_entry_internal_id_seq', 28, true);
          product          postgres    false    229            �           0    0 1   customer_session_customer_session_internal_id_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('session.customer_session_customer_session_internal_id_seq', 2, true);
          session          postgres    false    221            �           0    0 3   landing_page_view_landing_page_view_internal_id_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('website.landing_page_view_landing_page_view_internal_id_seq', 4, true);
          website          postgres    false    231            �           2606    16421 $   completed_order completed_order_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY customer.completed_order
    ADD CONSTRAINT completed_order_pkey PRIMARY KEY (completed_order_internal_id);
 P   ALTER TABLE ONLY customer.completed_order DROP CONSTRAINT completed_order_pkey;
       customer            postgres    false    213            �           2606    16423    customer customer_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY customer.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_internal_id);
 B   ALTER TABLE ONLY customer.customer DROP CONSTRAINT customer_pkey;
       customer            postgres    false    215            �           2606    16429 J   job_for_processing_server_instance job_for_processing_server_instance_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY customer.job_for_processing_server_instance
    ADD CONSTRAINT job_for_processing_server_instance_pkey PRIMARY KEY (processing_job_internal_id, processing_server_id);
 v   ALTER TABLE ONLY customer.job_for_processing_server_instance DROP CONSTRAINT job_for_processing_server_instance_pkey;
       customer            postgres    false    217    217            �           2606    16431    order_status order_status_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY customer.order_status
    ADD CONSTRAINT order_status_pkey PRIMARY KEY (order_status_code);
 J   ALTER TABLE ONLY customer.order_status DROP CONSTRAINT order_status_pkey;
       customer            postgres    false    218            �           2606    16433 "   processing_job processing_job_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY customer.processing_job
    ADD CONSTRAINT processing_job_pkey PRIMARY KEY (processing_job_internal_id);
 N   ALTER TABLE ONLY customer.processing_job DROP CONSTRAINT processing_job_pkey;
       customer            postgres    false    219            �           2606    16435 :   processing_job_result_code processing_job_result_code_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY customer.processing_job_result_code
    ADD CONSTRAINT processing_job_result_code_pkey PRIMARY KEY (result_code);
 f   ALTER TABLE ONLY customer.processing_job_result_code DROP CONSTRAINT processing_job_result_code_pkey;
       customer            postgres    false    220            �           2606    16806 (   product_depiction product_depiction_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY product.product_depiction
    ADD CONSTRAINT product_depiction_pkey PRIMARY KEY (product_depiction_internal_id);
 S   ALTER TABLE ONLY product.product_depiction DROP CONSTRAINT product_depiction_pkey;
       product            postgres    false    227            �           2606    16789    product product_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY product.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_internal_id);
 ?   ALTER TABLE ONLY product.product DROP CONSTRAINT product_pkey;
       product            postgres    false    225            �           2606    16819    product_size product_size_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY product.product_size
    ADD CONSTRAINT product_size_pkey PRIMARY KEY (product_size_code);
 I   ALTER TABLE ONLY product.product_size DROP CONSTRAINT product_size_pkey;
       product            postgres    false    228            �           2606    16827 0   product_size_mapping_entry product_size_sku_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY product.product_size_mapping_entry
    ADD CONSTRAINT product_size_sku_pkey PRIMARY KEY (product_size_mapping_entry_internal_id);
 [   ALTER TABLE ONLY product.product_size_mapping_entry DROP CONSTRAINT product_size_sku_pkey;
       product            postgres    false    230            �           2606    16771 "   product_status product_status_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY product.product_status
    ADD CONSTRAINT product_status_pkey PRIMARY KEY (product_status_code);
 M   ALTER TABLE ONLY product.product_status DROP CONSTRAINT product_status_pkey;
       product            postgres    false    223            �           2606    16480 &   customer_session customer_session_pkey 
   CONSTRAINT        ALTER TABLE ONLY session.customer_session
    ADD CONSTRAINT customer_session_pkey PRIMARY KEY (customer_session_internal_id);
 Q   ALTER TABLE ONLY session.customer_session DROP CONSTRAINT customer_session_pkey;
       session            postgres    false    222            �           2606    16853 (   landing_page_view landing_page_view_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY website.landing_page_view
    ADD CONSTRAINT landing_page_view_pkey PRIMARY KEY (landing_page_view_internal_id);
 S   ALTER TABLE ONLY website.landing_page_view DROP CONSTRAINT landing_page_view_pkey;
       website            postgres    false    232            �           1259    16436    idx2_completed_order    INDEX     c   CREATE INDEX idx2_completed_order ON customer.completed_order USING btree (ecp_order_external_id);
 *   DROP INDEX customer.idx2_completed_order;
       customer            postgres    false    213            �           1259    16437    idx2_customer    INDEX     M   CREATE INDEX idx2_customer ON customer.customer USING btree (email_address);
 #   DROP INDEX customer.idx2_customer;
       customer            postgres    false    215            �           1259    16808    idx2_product_depiction    INDEX     }   CREATE INDEX idx2_product_depiction ON customer.job_for_processing_server_instance USING btree (processing_job_internal_id);
 ,   DROP INDEX customer.idx2_product_depiction;
       customer            postgres    false    217            �           1259    16439    idx3_completed_order    INDEX     b   CREATE INDEX idx3_completed_order ON customer.completed_order USING btree (customer_internal_id);
 *   DROP INDEX customer.idx3_completed_order;
       customer            postgres    false    213            �           1259    16440    idx3_customer    INDEX     X   CREATE INDEX idx3_customer ON customer.customer USING btree (idp_customer_external_id);
 #   DROP INDEX customer.idx3_customer;
       customer            postgres    false    215            �           1259    16442    idx4_completed_order    INDEX     e   CREATE INDEX idx4_completed_order ON customer.completed_order USING btree (carrier_tracking_number);
 *   DROP INDEX customer.idx4_completed_order;
       customer            postgres    false    213            �           1259    16443    idx4_customer    INDEX     X   CREATE INDEX idx4_customer ON customer.customer USING btree (ecp_customer_external_id);
 #   DROP INDEX customer.idx4_customer;
       customer            postgres    false    215            �           1259    16444    idx_completed_order    INDEX     h   CREATE INDEX idx_completed_order ON customer.completed_order USING btree (completed_order_external_id);
 )   DROP INDEX customer.idx_completed_order;
       customer            postgres    false    213            �           1259    16445    idx_customer    INDEX     S   CREATE INDEX idx_customer ON customer.customer USING btree (customer_external_id);
 "   DROP INDEX customer.idx_customer;
       customer            postgres    false    215            �           1259    16447 &   idx_job_for_processing_server_instance    INDEX     �   CREATE INDEX idx_job_for_processing_server_instance ON customer.job_for_processing_server_instance USING btree (processing_job_internal_id);
 <   DROP INDEX customer.idx_job_for_processing_server_instance;
       customer            postgres    false    217            �           1259    16796    idx2_product    INDEX     G   CREATE INDEX idx2_product ON product.product USING btree (model_name);
 !   DROP INDEX product.idx2_product;
       product            postgres    false    225            �           1259    16831    idx2_product_size_mapping_entry    INDEX     v   CREATE INDEX idx2_product_size_mapping_entry ON product.product_size_mapping_entry USING btree (product_internal_id);
 4   DROP INDEX product.idx2_product_size_mapping_entry;
       product            postgres    false    230            �           1259    16809    idx3_product_depiction    INDEX     c   CREATE INDEX idx3_product_depiction ON product.product_depiction USING btree (depiction_category);
 +   DROP INDEX product.idx3_product_depiction;
       product            postgres    false    227            �           1259    16832    idx3_product_size_mapping_entry    INDEX     f   CREATE INDEX idx3_product_size_mapping_entry ON product.product_size_mapping_entry USING btree (sku);
 4   DROP INDEX product.idx3_product_size_mapping_entry;
       product            postgres    false    230            �           1259    16795    idx_product    INDEX     O   CREATE INDEX idx_product ON product.product USING btree (product_external_id);
     DROP INDEX product.idx_product;
       product            postgres    false    225            �           1259    16807    idx_product_depiction    INDEX     m   CREATE INDEX idx_product_depiction ON product.product_depiction USING btree (product_depiction_external_id);
 *   DROP INDEX product.idx_product_depiction;
       product            postgres    false    227            �           1259    16830    idx_product_size_mapping_entry    INDEX     �   CREATE INDEX idx_product_size_mapping_entry ON product.product_size_mapping_entry USING btree (product_size_mapping_entry_external_id);
 3   DROP INDEX product.idx_product_size_mapping_entry;
       product            postgres    false    230            �           1259    16486    idx2_customer_session    INDEX     c   CREATE INDEX idx2_customer_session ON session.customer_session USING btree (customer_internal_id);
 *   DROP INDEX session.idx2_customer_session;
       session            postgres    false    222            �           1259    16487    idx3_customer_session    INDEX     d   CREATE INDEX idx3_customer_session ON session.customer_session USING btree (valid_until_date_time);
 *   DROP INDEX session.idx3_customer_session;
       session            postgres    false    222            �           1259    16488    idx_customer_session    INDEX     j   CREATE INDEX idx_customer_session ON session.customer_session USING btree (customer_session_external_id);
 )   DROP INDEX session.idx_customer_session;
       session            postgres    false    222            �           2606    16448 +   completed_order fk_completed_order_customer    FK CONSTRAINT     �   ALTER TABLE ONLY customer.completed_order
    ADD CONSTRAINT fk_completed_order_customer FOREIGN KEY (customer_internal_id) REFERENCES customer.customer(customer_internal_id);
 W   ALTER TABLE ONLY customer.completed_order DROP CONSTRAINT fk_completed_order_customer;
       customer          postgres    false    215    3239    213            �           2606    16453 /   completed_order fk_completed_order_order_status    FK CONSTRAINT     �   ALTER TABLE ONLY customer.completed_order
    ADD CONSTRAINT fk_completed_order_order_status FOREIGN KEY (order_status_code) REFERENCES customer.order_status(order_status_code);
 [   ALTER TABLE ONLY customer.completed_order DROP CONSTRAINT fk_completed_order_order_status;
       customer          postgres    false    213    218    3249            �           2606    16468 H   job_for_processing_server_instance fk_job_for_processing_server_instance    FK CONSTRAINT     �   ALTER TABLE ONLY customer.job_for_processing_server_instance
    ADD CONSTRAINT fk_job_for_processing_server_instance FOREIGN KEY (processing_job_internal_id) REFERENCES customer.processing_job(processing_job_internal_id);
 t   ALTER TABLE ONLY customer.job_for_processing_server_instance DROP CONSTRAINT fk_job_for_processing_server_instance;
       customer          postgres    false    217    219    3251            �           2606    16810 .   product_depiction fk_product_depiction_product    FK CONSTRAINT     �   ALTER TABLE ONLY product.product_depiction
    ADD CONSTRAINT fk_product_depiction_product FOREIGN KEY (product_internal_id) REFERENCES product.product(product_internal_id);
 Y   ALTER TABLE ONLY product.product_depiction DROP CONSTRAINT fk_product_depiction_product;
       product          postgres    false    3264    227    225            �           2606    16790 !   product fk_product_product_status    FK CONSTRAINT     �   ALTER TABLE ONLY product.product
    ADD CONSTRAINT fk_product_product_status FOREIGN KEY (product_status_code) REFERENCES product.product_status(product_status_code);
 L   ALTER TABLE ONLY product.product DROP CONSTRAINT fk_product_product_status;
       product          postgres    false    3260    223    225            �           2606    16833 E   product_size_mapping_entry fk_product_size_mapping_entry_product_size    FK CONSTRAINT     �   ALTER TABLE ONLY product.product_size_mapping_entry
    ADD CONSTRAINT fk_product_size_mapping_entry_product_size FOREIGN KEY (product_size_code) REFERENCES product.product_size(product_size_code);
 p   ALTER TABLE ONLY product.product_size_mapping_entry DROP CONSTRAINT fk_product_size_mapping_entry_product_size;
       product          postgres    false    228    230    3270            �           2606    16838 G   product_size_mapping_entry fk_product_size_mapping_entry_product_status    FK CONSTRAINT     �   ALTER TABLE ONLY product.product_size_mapping_entry
    ADD CONSTRAINT fk_product_size_mapping_entry_product_status FOREIGN KEY (product_status_code) REFERENCES product.product_status(product_status_code);
 r   ALTER TABLE ONLY product.product_size_mapping_entry DROP CONSTRAINT fk_product_size_mapping_entry_product_status;
       product          postgres    false    223    3260    230            �           2606    16481 -   customer_session fk_customer_session_customer    FK CONSTRAINT     �   ALTER TABLE ONLY session.customer_session
    ADD CONSTRAINT fk_customer_session_customer FOREIGN KEY (customer_internal_id) REFERENCES customer.customer(customer_internal_id);
 X   ALTER TABLE ONLY session.customer_session DROP CONSTRAINT fk_customer_session_customer;
       session          postgres    false    222    215    3239            #           826    16473    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     }   ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA customer GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES TO i2fprocessuser;
          customer          postgres    false    6            %           826    16844    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     |   ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA product GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES TO i2fprocessuser;
          product          postgres    false    8            $           826    16843    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     |   ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA session GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES TO i2fprocessuser;
          session          postgres    false    7            a      x������ � �      c   b   x�3�4ttv5vtsurt2u��̜]�!|W ߈3Ə����D��L��P���
�8��KR�KR�2�dZbr���K����p�끴� 	�=... >~      e      x������ � �      f      x������ � �      g      x������ � �      h      x������ � �      m     x��W�NG}������F�]]}�[_!��ȶ��e�V,3d/�����²Ǝ�l�YZ3ԙSuN��@.Y�V����R�Q8�"�R�twwݴ���}�a�m�������B���7M��y7��S�N���|{�a���	5 �@�f_�F�_�o?y05� |�JD�2DrT�:c|P�"��Ŭk�8���t�wOPN����s���^�����-��W�I%�ѫdI&k�")C)�\��にS���d���	_�[ #�r�1GeQ罰>jQlpک i��m!]��w�՚�w�������Ӹ>����-���O���+�( ��"�b*�Ed�0��H�\p�V7q�xF���w�!A��-ّ�*��LOuڒ�Ȁ���UK�o�ߌ�+8&O(^�ZAY�~>;uvI�Phd�M!YgT���>�(
��d�j���o����g)�����Xk}���$�%?~� -j,�r�Hg�}�5&ǂ�~�
��}�|\��n�ӿ�x�������y�@C�b}�Kߞ_nɍ��Z地9;CN�@!Q�L:%m=�^���0l
�Cw���xu����x$T�ڲ�$ʒ��2����D�$ί���Î�t7�aYsU�a�v�����Rb����}7t�'��!\r��pXLg�/�r<�X��JV[�Q J*�8&"�Z�J,j�਽m���R��Y��N4���<�J��g�f���	��*�6|i�O�����ξ���6���b�W,!��!3�vz���a2鮺o�tw��w��T�l~��RR2[/��I§/��&�kA�Xto�ȝ.�RHd�"jEx�Fy���Us�^������o���ZD�AC�M�(u*�Z��D��x���{x�M&����c���q�
PR"�U@�+�x���*o��c�=z����J����	d�%�lX"HWL����l��Mv*��y�I#�z�djr�#q4
���N��a6g��d�/͞	�V���.s���hIZ�b�6Y�Sl��o�o��&��u����l� RQ�/�	-$�/��v>��^���כg����АD���O�j�!��<�B�2Kȋ�|S}aw��7��(�"�jS䬐�J�	2�~����Y��w���M��H�,w�s���)2���3�;)%� U�e�^������l�7����ӵI���y��}&��p.%g���*�
.&���� �
#{���\������X�-�8
�F�8�qOr4�7D����֚�]�u�&Log����vcBw�ȁ1ig���o
c���F���7��p����;��?�F�!��      o   �  x����N[K�w��/����������$G�F�<�5a�@����g9�ƛ����������Z�3ё��n�ą��l�\��Z�q���s5oW�뛛����t����zQV���8����\�����6���򴜝����?�,�S�:���?���=a$Q�<�hC���$��>f;�(�^}��ڪ֓Y�bxJ)pv�$������,1PQ#�gW?V��׫��b+}�z��79z���D;��ͩ��1��JOm?!����T�D�>�%�p�q�*�IXm��j�[W��M���ǋ��֗�vqy�sĵ��&�YDmrQl�Eqqժ�|3qB�hu���E[�u����r�~4O=�x�(vJ$MH[��F�-��TM�P~������������V�����&����-^V,�+��]K�v1yB[�|ǀ����?���ZfI;k
��H���TKP�$m%���g&����jqz���[~:K�L���f�-s��Ms�#���(�&����]�����'�����|/��9�ӈ�:�(-�"�t��S�����z�����^]�����v��	��D%�S	�0|>�:� Wk�:c�����a%��v'{n���Q�^(宛�+-W�"����J�ۡ������1mo4q(Υ�[�F�i��RBj���C�[�ݩ���c��l��x�1�J�Xʨh/��K���om��۶�m�z4CB��G[s����J���s��;T��;���{L>���&���$碾Wm�U�p�m���	w'~�p��g��`.��H�y[�9��j������w�}q�h�5��)�{F��*Qk&�Ɩ;'�q��Aܶ���x	�R+T�0x��!15��l÷"�8bx>b�E�k�7���pYj#�f����٭d1<1��#\f8
�4�Gn�-� �[��N ��"���%7���:�p�=熹�^J��o[��j�!��"��q#��I ��N�� �܃�5�"f��S�Ṉ�h"��@9Q(2�չ�]l5E���8�>���J��YG�r���6a]p�R�s�-bv��sCȦ9���9�"'��^���o��O ��"��I�VKYA/�p�Y��E�������\İ3�ɗ�9��0)�z���1r+"�#F�#���Ѱ���(E@>Uܵ�z�\�7q���Jv#s�O��l�&jX~���ە	�	��\İ7#z�5�1���zm���= ;�����C��E�zϒյ$�m��1q�<�i���k�bd.b�AD�p�6vN�x�E)��-bvէ#s��To'���G�I1j^]'�<�	�)��\��"�3���j�歖T[l���3֏�����@��E��7y�nb�W�i�
[6b�7b����G}�~�R"&�)�>tW�̾vlj��`S�KQ��cl'3܈6�����A�6'�!Հ�h[�.^(�g��U	;y���v�+�w��:�\����
������d��樶peP�wP��k;�_�#s�^}�������߱��.���������<{"l������,6Ԃ�l�=�-*���R:�����/_���ey��żjĴ�b�#e��p�2r���ǵ�V�V��zl��z��i�x$[6+l����a����#�yHx�~l\���ӗ��]���*�!t�UI���:"�Wg�VC�=Tŭٍ�xv��y������G�IB�,��QR	�5��;��F6/�ѳ��/۳��~6�Oʡ��c�V� f�!�����>X�}k�~y�g��eӷ�����b����?����O�BH�%k�$�j�E=T̾Qٴ|~rt|�ny������U�G��g#���hFQ'�Y<�|����
�3-����9.�ɛz4oD=v�V�	�z���
��-Ţv��3�n�\�ΎY��7/uyzrz:sD��Ǔ'O���b      p      x��JM/�I,�
��M������� T]?      r     x���;��FE��Ux3��qF�'8���av�p�D�S� HG��{I�p�D	A���_w�����r� �����?� �����{H�A����d񚅶�] �W��į�<�4�E�L��wޠu�*�9���k�'E*E>�2���6_B���!�,�>G�p��	ry�$Ѝ}܅�c>��'�Q�|C�f�L�"r�}hR�2�7�5܆�Ua���)���Z�c�Ea�_Pbg/�,(�+�.�^�6����%ZOpl�[z�\n�Ѯw�R#8��#��ܮk_�+��Z�!b���o�~�7���q�N�s��H��it*3�Es��f���3X��hsw����
I9����=���s�%+������/�k��T��x���iu���g�xyvL�����{���i��OX��տL�u�!�����{�o�oq��u���P����͸k���=��ws�{"T:Q�f��4v��hq��"����۽�h����l���ڙB>��,�cƈ�N�v���K+��iŰ#�-��'���9cg,�ʽ�g8�φ&�f�7�����x�U/ڳ�D��Y����Ԡ'��ޘDc����sv�l+/�m�*��n����ޘ=�m�>p+>{�H����ݾn�!ٻc�����r�_������_w�}�׬�]C������~��K-
�t�ݕ{9�ՙ�'�$��:�t�]i��?�{����8�ƓZz�{�т��s*��/������YY���Zzߐɇv^kc�#{�f��®�ܞ!�=iߋ��Ϗ�� ��I      k   M   x�3�tI-K��/�M�+�2�tL.�,K�2�t�,N��+��+MM�2�I�-�/J,�̩T�K,K��IL�I����� %�      j   H   x�3�tstvuvtsurtr������FF&�f�F�
V`�C�� ]�-���,��9c��b���� 4h      t   Q  x��UMo�6=+���a{�;rb;	���ȡ=t��
,hi,1�H���j}�Pr�AO�����ތ�I�Z?l7�u���V�t�}�.ӻ�l�Ɏ�t����J��������d�)��l�<ۯ��;y!�5���''u!�Yh�WF��'ܔ�SጧF�~�(D%�˥#a�)�< ��9�c.J��Rt*T����e]s�2��$#|0������J����~<z'-BeڲT�֒�U&ģ��kk�P�EZ㟰hm���񖌭i:��h�yd��s�E��#��T!O5�8�)�����;�R11�6����õ���q1r�����M6��ҘB�L??'!Y&�^�V����k% ϰ��R��]������a��:��l�n�l��-^��}�M6��9�)������P��sѨZ�.r�49Y(�����"v�#d-ε���!��D#/ļ98󃯐�B�!&��w�S��#�$j��V�Ć����U���fE�����������3Z����(O�Ox�`-��h���,�teK�bQCc�VF_��-��]�r%���Q�/����4-d�,D� �u�<��$!�T(�9��QW�I��e�l�R*=�_�a�����V�f o�yoQ�M�,w��%=���zu���z��#�KV�u�����7J�j����ѱ �ö^�^�Mϥ3Ȩ+>4w=/��BCk�H������a �&=d��J\s	���y�+�aS0�L%�bL�b�}�Y���w��Al�]��M���d Ep�f���+�x:�������,�*s��l��a�~�����߶�n��1�3����ɑ��Q���V��Z%���e����t�:�g���~�ZlֻM��gYr ���"ޮZa"q4�~�ꢆ6A�_1���射B�퓏.�C�x��ʯ�ߞo�GA�g������t���jc��D�����0�X�o��ZnBg����,�-�<� ���R��=���$"s3þ��$NG�q��(E�]�f5`E8�󟦽���{Тd��Zlb���;XΫ�-vTgں�iy�zUr�IId�E)����k~ss����     