PGDMP                      |           lac_integration_manager %   14.12 (Ubuntu 14.12-0ubuntu0.22.04.1)    16.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16385    lac_integration_manager    DATABASE     �   CREATE DATABASE lac_integration_manager WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
 '   DROP DATABASE lac_integration_manager;
                postgres    false                        2615    16402    integration    SCHEMA        CREATE SCHEMA integration;
    DROP SCHEMA integration;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false                       0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4                        2615    16401 	   utilities    SCHEMA        CREATE SCHEMA utilities;
    DROP SCHEMA utilities;
                postgres    false            �            1259    16410    website_user    TABLE     �  CREATE TABLE integration.website_user (
    website_user_internal_id integer NOT NULL,
    website_user_external_id character varying(32) NOT NULL,
    login_name character varying(30) NOT NULL,
    reference_name character varying(50) NOT NULL,
    wp_user_id integer NOT NULL,
    sf_id character varying(18) NOT NULL,
    record_added_date_time timestamp without time zone NOT NULL,
    record_last_updated_date_time timestamp without time zone NOT NULL
);
 %   DROP TABLE integration.website_user;
       integration         heap    postgres    false    7                       0    0    TABLE website_user    ACL     W   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE integration.website_user TO lacprocessuser;
          integration          postgres    false    214            �            1259    16409 )   website_user_website_user_internal_id_seq    SEQUENCE     	  ALTER TABLE integration.website_user ALTER COLUMN website_user_internal_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME integration.website_user_website_user_internal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            integration          postgres    false    7    214            �            1259    16404    prior_member    TABLE     �  CREATE TABLE utilities.prior_member (
    prior_member_internal_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    account_name character varying(255) NOT NULL,
    lac_membership_start_date timestamp without time zone NOT NULL,
    lac_membership_end_date timestamp without time zone,
    sf_id character varying(18) NOT NULL,
    lac_membership_level character varying(50),
    record_processing_status_code integer NOT NULL
);
 #   DROP TABLE utilities.prior_member;
    	   utilities         heap    postgres    false    6                       0    0    TABLE prior_member    ACL     U   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE utilities.prior_member TO lacprocessuser;
       	   utilities          postgres    false    212            �            1259    16403 )   prior_member_prior_member_internal_id_seq    SEQUENCE       ALTER TABLE utilities.prior_member ALTER COLUMN prior_member_internal_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME utilities.prior_member_prior_member_internal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
         	   utilities          postgres    false    6    212            �          0    16410    website_user 
   TABLE DATA           �   COPY integration.website_user (website_user_internal_id, website_user_external_id, login_name, reference_name, wp_user_id, sf_id, record_added_date_time, record_last_updated_date_time) FROM stdin;
    integration          postgres    false    214          �          0    16404    prior_member 
   TABLE DATA           �   COPY utilities.prior_member (prior_member_internal_id, first_name, last_name, account_name, lac_membership_start_date, lac_membership_end_date, sf_id, lac_membership_level, record_processing_status_code) FROM stdin;
 	   utilities          postgres    false    212   -                  0    0 )   website_user_website_user_internal_id_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('integration.website_user_website_user_internal_id_seq', 1, false);
          integration          postgres    false    213            	           0    0 )   prior_member_prior_member_internal_id_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('utilities.prior_member_prior_member_internal_id_seq', 1, false);
       	   utilities          postgres    false    211            o           2606    16414    website_user website_user_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY integration.website_user
    ADD CONSTRAINT website_user_pkey PRIMARY KEY (website_user_internal_id);
 M   ALTER TABLE ONLY integration.website_user DROP CONSTRAINT website_user_pkey;
       integration            postgres    false    214            m           2606    16408    prior_member prior_member_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY utilities.prior_member
    ADD CONSTRAINT prior_member_pkey PRIMARY KEY (prior_member_internal_id);
 K   ALTER TABLE ONLY utilities.prior_member DROP CONSTRAINT prior_member_pkey;
    	   utilities            postgres    false    212            �           826    16418    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA integration GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES TO lacprocessuser;
          integration          postgres    false    7            �           826    16417    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     ~   ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA utilities GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES TO lacprocessuser;
       	   utilities          postgres    false    6            �      x������ � �      �      x������ � �     