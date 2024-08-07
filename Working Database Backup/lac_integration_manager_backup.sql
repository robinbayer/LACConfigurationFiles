PGDMP      ,                |           lac_integration_manager %   14.12 (Ubuntu 14.12-0ubuntu0.22.04.1)    16.3 !               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16385    lac_integration_manager    DATABASE     �   CREATE DATABASE lac_integration_manager WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
 '   DROP DATABASE lac_integration_manager;
                postgres    false                        2615    16402    integration    SCHEMA        CREATE SCHEMA integration;
    DROP SCHEMA integration;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false                       0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4                        2615    16401 	   utilities    SCHEMA        CREATE SCHEMA utilities;
    DROP SCHEMA utilities;
                postgres    false            �            1259    16422    membership_level    TABLE     �   CREATE TABLE integration.membership_level (
    membership_level_code integer NOT NULL,
    description character varying(50) NOT NULL,
    active boolean NOT NULL
);
 )   DROP TABLE integration.membership_level;
       integration         heap    postgres    false    7                       0    0    TABLE membership_level    ACL     [   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE integration.membership_level TO lacprocessuser;
          integration          postgres    false    215            �            1259    16437    membership_status    TABLE     �   CREATE TABLE integration.membership_status (
    membership_status_code integer NOT NULL,
    description character varying(50) NOT NULL
);
 *   DROP TABLE integration.membership_status;
       integration         heap    postgres    false    7                       0    0    TABLE membership_status    ACL     \   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE integration.membership_status TO lacprocessuser;
          integration          postgres    false    216            �            1259    16410    website_user    TABLE     �  CREATE TABLE integration.website_user (
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
       integration         heap    postgres    false    7                       0    0    TABLE website_user    ACL     W   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE integration.website_user TO lacprocessuser;
          integration          postgres    false    214            �            1259    16409 )   website_user_website_user_internal_id_seq    SEQUENCE     	  ALTER TABLE integration.website_user ALTER COLUMN website_user_internal_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME integration.website_user_website_user_internal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            integration          postgres    false    214    7            �            1259    16404    prior_member    TABLE     �  CREATE TABLE utilities.prior_member (
    prior_member_internal_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    account_name character varying(255) NOT NULL,
    lac_membership_start_date timestamp without time zone NOT NULL,
    lac_membership_end_date timestamp without time zone,
    salesforce_id character varying(18) NOT NULL,
    lac_membership_level character varying(50),
    record_processing_status_code integer NOT NULL,
    membership_level_code integer NOT NULL,
    superseded_salesforce_id character varying,
    work_queue_id integer,
    email_address character varying(50)
);
 #   DROP TABLE utilities.prior_member;
    	   utilities         heap    postgres    false    6                       0    0    TABLE prior_member    ACL     U   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE utilities.prior_member TO lacprocessuser;
       	   utilities          postgres    false    212            �            1259    16403 )   prior_member_prior_member_internal_id_seq    SEQUENCE       ALTER TABLE utilities.prior_member ALTER COLUMN prior_member_internal_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME utilities.prior_member_prior_member_internal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
         	   utilities          postgres    false    6    212            �            1259    16445    rjb_add_email    TABLE     �   CREATE TABLE utilities.rjb_add_email (
    salesforce_id character varying(18) NOT NULL,
    email_address character varying(50) NOT NULL
);
 $   DROP TABLE utilities.rjb_add_email;
    	   utilities         heap    postgres    false    6                       0    0    TABLE rjb_add_email    ACL     V   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE utilities.rjb_add_email TO lacprocessuser;
       	   utilities          postgres    false    217                      0    16422    membership_level 
   TABLE DATA           [   COPY integration.membership_level (membership_level_code, description, active) FROM stdin;
    integration          postgres    false    215   �(                 0    16437    membership_status 
   TABLE DATA           U   COPY integration.membership_status (membership_status_code, description) FROM stdin;
    integration          postgres    false    216   O)                 0    16410    website_user 
   TABLE DATA           �   COPY integration.website_user (website_user_internal_id, website_user_external_id, login_name, reference_name, wp_user_id, sf_id, record_added_date_time, record_last_updated_date_time) FROM stdin;
    integration          postgres    false    214   �)                 0    16404    prior_member 
   TABLE DATA           /  COPY utilities.prior_member (prior_member_internal_id, first_name, last_name, account_name, lac_membership_start_date, lac_membership_end_date, salesforce_id, lac_membership_level, record_processing_status_code, membership_level_code, superseded_salesforce_id, work_queue_id, email_address) FROM stdin;
 	   utilities          postgres    false    212   �)                 0    16445    rjb_add_email 
   TABLE DATA           H   COPY utilities.rjb_add_email (salesforce_id, email_address) FROM stdin;
 	   utilities          postgres    false    217   �k                  0    0 )   website_user_website_user_internal_id_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('integration.website_user_website_user_internal_id_seq', 1, false);
          integration          postgres    false    213                       0    0 )   prior_member_prior_member_internal_id_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('utilities.prior_member_prior_member_internal_id_seq', 602, true);
       	   utilities          postgres    false    211            }           2606    16426 &   membership_level membership_level_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY integration.membership_level
    ADD CONSTRAINT membership_level_pkey PRIMARY KEY (membership_level_code);
 U   ALTER TABLE ONLY integration.membership_level DROP CONSTRAINT membership_level_pkey;
       integration            postgres    false    215                       2606    16441 (   membership_status membership_status_pkey 
   CONSTRAINT        ALTER TABLE ONLY integration.membership_status
    ADD CONSTRAINT membership_status_pkey PRIMARY KEY (membership_status_code);
 W   ALTER TABLE ONLY integration.membership_status DROP CONSTRAINT membership_status_pkey;
       integration            postgres    false    216            {           2606    16414    website_user website_user_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY integration.website_user
    ADD CONSTRAINT website_user_pkey PRIMARY KEY (website_user_internal_id);
 M   ALTER TABLE ONLY integration.website_user DROP CONSTRAINT website_user_pkey;
       integration            postgres    false    214            y           2606    16408    prior_member prior_member_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY utilities.prior_member
    ADD CONSTRAINT prior_member_pkey PRIMARY KEY (prior_member_internal_id);
 K   ALTER TABLE ONLY utilities.prior_member DROP CONSTRAINT prior_member_pkey;
    	   utilities            postgres    false    212            �           826    16418    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA integration GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES TO lacprocessuser;
          integration          postgres    false    7            �           826    16417    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     ~   ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA utilities GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES TO lacprocessuser;
       	   utilities          postgres    false    6               �   x�e�1�0���+n�f�D��Q�� �����ä-iZ�7�vP����Sp��ۀ׺`
���*��3�����'7�d2�{8z2�{59�"�����r�.�ۆ}4u5�����j��� w��ՏS��Nn������4�A8�v����x��B��RC>         *   x�3�tL.�,K�2�t�(�,JM�2�H�K��K����� �F	j            x������ � �            x��}�S�Ȗ�s޿��21S�V�����h�����Ҷl-.-������9����d�1��n�*}~��ُ�K���X@.�A��F��&��û;y�vN�4f��s�"���oG������5�$Y�%�'���l˺!����:���O�,���,�7����k:�a�:4�{#��ޮ���%��G.�i��8k:;��C�sE#�[Eh��C����7hЧ����J_�5B�V��qҹm�%@'#�n9:Y���8�iL.�xvv��:����$r��{d��|�L��)WL9|�^ԾuJ�����,����P"�A%�������c湶K�I:n˗�N����4.����X	0���j���GIu��`
���*p@9r.<F�.��s���'�.��ks/�?$퇢}`��ĲN�Y�/��R� 6�0a�d������0�0����f�<� p����T�x�]o�J�B� �R�W�w-˪��|;�
��0��	��(����~r���ວWgg�V��bNL�c�,���˜�Z�\R�%��;'Y������R���2��(����կ3V�3׺���@)�D�Y38p҄?:;wl�lw6�T����b�ϥ1a8�U��S�'R�U��N�8���: ݑ�ɡ{�/.n��AS�2qZ�K�I6�m�TC#'�z:9O=�v[;~�.��m��j(�F��姊VP�4��Sx��'dmg��ϒ��¿�,�������G�h�xo�����C���?��n�,�����2<J5Kzӏ곤��p�{q�p΢l�����1����ĳ�û�p�(Y-�#_�y~L-�&	x>R+L�A)�p��</�-��͙d+֙w��U�c�y��ꏔ��Ƃn[f-����͖/ �a
a2E�?��Ϩ�l�Q,�2A�q_�%cro�S/y�[�y�Ok�i�d*��ŝ���X,�-׺.���8�c÷`y�8q~B������W���b�2끚���fd����Y@Qp��7�� �#���hIգ�> ���`ĉ�C�.O����F��4�ټeQ��P�"s�X�cgG��{�Z.������k<���7��}���>�aR@��@�0b�]��d	�
�����S#QT4�nN�K�����y��y�e2��~=B�V�A޼��2��| �ﹶ�N� bO�w��L���)��/���ɶ�Ľ5����4vm�������P�8�N��[Wʙ�[�z�lc&>�;<2�<<::�[J��mLf��$*(�d\V *�C���j���8���'�_
_vU�;���<:A�f4Jb�	��0L7,����w*�h����b}'|��݌v]������&�ب�7q��G�5�G7��*��=擫�}XZr�&�#Q ��
�?r�Ocl�h���}�Ct	xn�'�adS`n��1⁏���6N�ז��R�
�4��;��8�.9�� ��qޢ^U�0^�#��~8h<t�#�UP}��81[�x��zț3�v�)[�k���`���r�B�1c�`��" ������ǃ�J�7D�O���4�ښ�ՓN� P&�H/���c����q~E����kw�q �$���R�*�#���眆�G�0^}����\��ø1��t�$�!,�N�L�w� ֐�xvvxWcD?�M��iE�;- R�	2����<�fE��ᝍ!=���q����s�\�q�{6`�����`O��k�0x�t� g��tr��2�	�M�tvxgcL��&Lc����-|Nv�m�I(� �eJ��4�C8����X3���4����]X���J&E��@Fr̜�|@�¥�dL;t�L7�\ӡ���o�aF|�`���f�ε������@�9\��k�\{L�����qp����+�]��6{ 6u�i@�a�G≈�����&�et�W�	�(`3�M�	M� ����▦e���c��4�ʨ�"Sв����q� *����{X���Fl�N9�:�,i� �.*u�|9f��+�6ho���0�T������2�а�Bg�K��$��Jt�
�d�\�\����u���I@cQ�͐�I�
��,^K4)�0��9h:j�b(��8Y�j6`�逑�4�����FN��ٺ��ɭ+�9-�N]7�DKȽ�i	���Xo]��	��x���G�S�#�U\]�\2��7u�0����6�t�	Hn,���,�#s��C��ݔ5K��i�Ũ�i.w�6N��M�&����1��=�B�pU��U�x�V�UQo�����0���:;�S3x����З�ҡ+'g#�Qa�i� dYZ�����G��,�����3�y��%�FGƏӔ��?v��O#�ٹG,�Ϝ���
,i.���`�A�
M�X����@x�f��	ΫgYG�L��?\Xd�{$�.�k��-�Ts%�o�M"՘@oF� ���	������0�I�����ě@�H��u�lTąi��񊻪��e���;�%�� v���x"c�即ش�g��dW�G��麢�w6��n�4�F,t\�.�\
�v�)z��.s�h+����u���q�ltB@��P�Ec9�d�8�DW��pxbYJ��;b���@�t�	@Od7���x��%H$H� F����6v;���ƻ�����u�a�q*sj#N� �+V?\��@I�f`�7�͈{�<�[B�/R�%YQ8���J�Ĳ�|�����WH)���1�#,b1Le�0�\�xd���f^��i׈Ϭ�j�'�;�!��X��I�e�g����/����J�x��8��S�'�L��Vʀ"�(�s{�;�ه�O�|{��4����A�V'�'�}���w�u�-�����"��.l��~���suaY�����* �"-����`#z�A�_��u��f#�$aA��Y���o�P<O�����t�`�Y�_Ռ��18����z�L�i�a�F";{�Q����zyb��e]T�`N�F��!��%��e�w����aD=`O��+�E��I��fi~�u��7���.ۍ2��U�]��B��K�5��^�/�3�z�q"\�Z3D�b����p5�g�u����؄�Zg�F���z�v�z!��d���Kg�h�L������g{3$�#��f�Lr�����nO;����f���뫍1Zђߝ��1	v���&���A�{���0�W��(�zvcN��K���~��}���)k�ʺW?�6��wF�X�L�{_�`��Y����>��RJY��#kf�.��M�"�CFR�Ѐy��P<�'�EW[�{��oM6p��wg8��1���2�Sx��,k���MA��g�S��L�Y �x'��2Y��m�:��W�gPǍ9�U'dY^8��`��ǲ�q�,E��_^�\��L�n�����h^��;6^gfd2��)Ǳ���� 0�Eyf��<C�?��u���AX6� Vó�9ťwΆ y�y��������<yv|�N1��ȉ��ЍW��.��ڵ�=��b%��Jih��+GG�SSzP���]VZ8�|u�c��%}�F.ɚ.R�Ğ� ��W�V�`�%a��Y�W��߷�Z�������"OC`�������ӒI��B��}�2`��w���p�#C_�8@��\r�<�����&������(���q���i�:���4&K�5v���<2_��n�w ����H�	�㇫�qYΔ��w0V*��Xf��S�c�z9�MP|��d�6�A�]�ם���ƾ�p@��K�^Z�x�G�'wW�Sd��V"'�;��P���(]v�?��]�_�z���d����:r�ta#3d�Pz�OXp���]���'}��'��gɫ�f���£�0�n�5(�Bg���y:�'5�]��N{\��S,����}yl���}kv;O���o�כ^'�^`fr@����"X��-3�O�R���gm�\M    �6��]�7��b����v���~*��~}`_��1r/��>�@u$7�ܤp���h��P�g���,�m6�����S$�Zlқs��*#(-30�'������e<2��������翙��jѭ��e]ٍV7�"g�!��Y,���Ո}�rd׷��z�̦Hw����E�B9
��V�x3|+�Vޱ3r�+�h��Q5 �zi�lE%����G�<{����x����u�1s)�2n0@څ4 h�Y੘򈀷���ɻ`�Oh�=�D8�s��a��
��!lMx���F	��.��	r
03n��J�Z�i��Ȟ�P��[2�z���������S���<�	��3t%^�	F>�n��až��L�us���_<?'��f���/����-�#C�EG�R�Q	��TY�oÚ}$;@>��4����tS"6�d��
���.@.���UJ��U�6r;S��'`�}(��c�X�c��n��jnr�S�{���!_���n�9��q:}{���Z
����/8�XuϠiF7?�T�di�P$`4%��Fe;�!��hUz�^	�۫��~Z}K��:r�K�Yd��N!|T%����6��aS����xUU5��r ����<˷�H�Rɠ��:l�s��#�F4'�
T_Ɂr�B�X<+�|�Qc���V�,�6�UvQ��� ����Eh>�ZT������[��"\�g1u�Q��X<�
���UST �Y�n�-��0��y�k�o(=���N2��SD����>�h���v��2�����;�,�I�ӯ��Z��cNw�Gd��c�"0�>q�xgco�c���DS�����(��lHɉ�q�X��}�P:�%�(��(/�����'����H@(�E����%����<��Q'��#.�f.b����eԺs îpV��$s�$���a��/K��Ryf��ľ"#���ǿ��2wG��0M�0�f���t�K�w�� D�W"t����/o���r��(�Z��ӝ�]�;*��!Gg������������� ~*�����޺�"9����LDʀIۍ]�%'�����t��X��(�,�Ķs��������Y=.��῍n1��r=D(Lfͦ��� Gh��YM}'�
�V�)¡�V5ы���_?{-W��Kߺ܂��O����u�"�l�R��1�CD���ٱD;�?	9wrx6��z
���qE]� ?u�aQ��:WԶ��`�(�	�⧸��������Y����tyV��s2 ��t���3߈o�T����f�����r �x�<C��l&p�/�Y�jKC�G�k��6Y��s�\x��J4(�e��z<|�,=�~��P-a��R@� V!joʘ�p��<kʘ��t4K0+��M#}�=��qW)�)�A���t�0E�Ӳ���tyΈ��T��nJ��*.�~O�j�����)��z73ڝ��-�Y[e���Ҵ&�?���Y�㔍��2����S7�[t�.��S�J��z�������!��邏.J�D0���A���6�w�G��O�k��)�#��k�d�����~Ѣ�BSl�Ɉ�e׹�X0s�X��^W"b�~��0o��G-�b���z��^g�!�����JC]���Ǹ�1��h��K����cwҙu^k�5ܼ@��LVz�@w ��u�T]�{_�ԟ5�v��S��d��"xW͒I�2���%�j�S��.���DȐ�7F�+jޮ�Wh�b.�0��
�_���?6��{�	t����q��� O̿qE1-r`�f�;~����<�v�`ק���풇�'1�K=�{.�]��c�ϫZs'����:r�1�1ాS��/��!>��a�������w�a�
�G�,���v���Yv4x���y���5W���)��i`|�/�n�F� �}�&Cm/L� ˬ
����/Oa�5k�t!�?i��Q�=uiM����]��8�\x�� ��xS-�2!���m#9�k�sª����X���$5Έ�'�.v5����ՙ�Pkzѫv&I��%2Ƅ�����.SM�Q�yly�i�3�Tz�?��<=�i��΀����F�2�՛���x�]������)EY2�r�<��Gљu]%ڽ ��j������c̿Fxl�S\��a}���o�W��f��nD�����N�����:��o�5n�x���,�"�Ð�
�{� �����n�5�����
�1��+���_>l�Z��ޔ��K��`=���������#�1���%#Y2��:��כ䯚�<�(�&�0�̜�giP?k:;A�S�{�X�B/v������V���aXp��I�F�v֌y1�F�\�厢f	7ث�娮���ь�*J�6��\���ǖ�)E�n��*�矊_�6��`5�_O����� ���O�ػ�5+؄���iXs�2_��W}X{*/GP>�Qݡ��Π��c�a;��?�&�:�d'���DO#�hk�����Zfb�%�%��ס�te�dLC���D)���$��p��frȼ��y������ӟ5��A7s���s�i�+�<����k6�c���\Pǜ)yy�R���J��'�ѕo���jPt�/U���a�/��X���``)�������cn�G�!�T)qʔߏ�Z����5+��9�f���+`��xL1V,��?S��@0.s�����]���~��� �a��8��y�j���UE :�P�e��?;�#��������ZF��٫�sбb[�"��صK��˔�1tNɅ�ƝDi�=F������ο���r%\�\�Gu�^Z5�,�����'S&o0���z����s�=l&̅%�(�ݙPҋ��k�#NL����3&����ݘ�]E�5�EY��	!���V�l-	3�l�8������U�).�1�w詔� 2z]�I8�1�QY^�z���srИ�.�� +r��c=̾d/��p�굄�����9|���y�I#�F2�d�F^xVGs/��������^Q*2��g���R;�vq�x���`�9�ݘ�X�EbY��n�Xq�_��s�g_ T$�-K�P+
��-���^�P&#Nz��h��I�Vw��C��fMf��t�����W=4=T�c��;���^s�%��藏�R=j���GK��_�(Ƌd�`�KǬ�c9���������wV.���Ju� |�t�([��,����mۍ󶳃I�QK̓O}֣n��:������ yl(��*���1ؘ�6kx�v�^�٩��#~���~�5���� ��q�J,G(o?V�\�rb,F��E�q,
���s)^̶_�
��<V�+�Ę">�4����X��q,�t���T����xP��n�p;�����2J���}�L~�TFh|$j���zQ1��6��%�e�$s�s�S4Ӷ�"��܎0��`�o����PԊ���1V�Vl/d��K�d��4ϛ-+
9��w�ǫ:y����L^�bJa,��e��@'���o��~��EO]]��J8 ���`5�-�� ڀ�Y(�x���r��v+n�-�~�����x ���>����4M�����������Ț�L��iy��Zkބ���vaNs$�fB�,��,���>\U�;u#�V.Z���gݣ�J�{`��+cA4��8��~a��o���.J��EV%`��j���]:X���DF���X���1h�Z�yD}�4S��P���b.�9��v]^��/��S_Y|��o��ۭ'<��b*�!dUYf�m=k��y}�6�s*:�~�ur�rߡ����7X�>��}��i����F����$,B��7���O>��è�����X��'c⹼D�FY��[�ߔH/�:J�	ލv�Ra������>V5�X��
Y���8��]e�v�Iת��x���P��ª) h����@u[f�RʬU��@j3��F� ���n�Ǎ�g����p(��2��X�v�N�a��0��m��%��4��p޸��?;;Yg3�?�<}ַkܓp����D��[����"iaă2��    \�%G�R����+�����I���![�]+K�n��BX�p�Q.�j��H/tD=�5Lf\���*KIR3k�i���
}qPͅ`�\ax{o��y��M������r�HG��]5��qG:ܓpA�tx����؝�Wg�n��J�ug�<i��wշ�_B�>ݳ���]2�8��X������\�=����Oy�eY��JWal������dVР����nZ��\����o���O|��`4InP�bS )�����X���j|�P������
نXW�37(�[*�y�':@����<�;�6�d<�)\O���C7����1�~a45��ya�0h�Z�z��j�����i�8�`��A:��X�+Z�Y������Rq�]�K1ITA�{1ǤF[�
 ^!���#G/3���̩��;����w��b��,�<YL\�Mm���2s���i�êJ�l�q�+�Sʋs߱�eؔeZ�4�B�\I	��r|��Ο��_��h��H� N�lQ�;�QWG"�*��d��e��8����ZA-NYa�ip zU�Q�/��ԅȼ*���'��H~<�e�0rz�Pj����&J؈���T��c�8�B�u��������</&����������\`���9	g�~�
'ge����51�3�'���?E�6�mZQ��4��"��aO�(�1z�!�Ձ4��*�NtrV<����֛'�9p@���V��(�a7����b�m#C�"�� ��Ѝ,��}:�˛��>�c�#��!��?�@|oJQɕ%$�Y*���p�V�Y(a�a�~4�-4�s�T$Oh.�
1�Xy~�����;�$�a0�C�-�&�܎C�T��͞ī���О�zT��(�\�<����g�W�{�<?�Gu�CX�v�����=Ky��ʟ�J���� ���K6w�7�BSA�	:x��N%����Ur ��7��}mD�ܩ�?�͞RT��T� �<�Q �b��+�l}H�2ron�SV�4|�����!�H�O��F�ɕ�j*`��h�q̂�7��(�^妸t���0-��W���g3s�8���G9�U���Ŭ��� ��07�}�=�u��^�\P�}d#�.k��U$�].n2�#��G�ԟ�BJ{ٔ�z�s�u�r#\�oRNc7�*D�֢T��
ۍSC��7�u���.��m��0E�)�3S޻l4.�y{�)Y�ܔg�w�=�1�I�S/��G��G���M��LJy���	f{�	f�J۽�u<$�d��-�b�� �vޙ�P�R��roD����m�5�!+�Ğ'A8aӬ�
;�zH_�cԼ:kp�	3$� O&����%����D�wclƟ��T���sҫ��$v,�Y%�x���m7N�����3�x����i<�%� �)��*Dw�QCs�c�S�O�.�l���1���vͻJ^�8
ӭa�*^�I?�i�S^��	uy�W����qlm�ء���`Sk��F#��Z��'��<��L�qޝ���S{����"�n�<��;���?+�G�}\g�y���[�h�d�,�1�X�o�*OV�����]��z�+��F3�n�+�INS�m��S�0o i�a�1�9l��9�	�9�B�\�1�<�ޘ��7ȅa/Z�ƴ�0��A��a��m�i����	�G���,E��	��9���gl�pzC�u�N�@Q<�1�Df2m�1U�dLUd��t�H��V��P�.����z�É��.�"֍z���n�S�L����� ���dȖ3t���(��f�Ρ�!-/d^��&yY�
ɫxr�������~\g��\�<�b��,Z��i0���"���/G���/ ª���
%�`6��w�0�����
(�B5 6�x�JޮT@��m��-I�\U_�&�ug�� �.浚EDQ�� ��� c>QseMg'���a�Ez�L��/�+Ћ U�ȣ�.�9���cV��a��|(?��o�����y��R4"���(��>���y�Xů�1���,��n�i��jm#ԡ�zt^��ܬz�J4�
W�̜��ɜy������E�4�r!s_��3	3��B�FT1(+.^˒��W^�'�c�q�|Η�7�*!|BUH���ɷ�]^-u�WT������F���	d��2������e�@��+
!2������d9��D@)�풇0���)�\7���,)�R^h�U�]^Y���{�H"� "�Z��6�lV+R6+�jY�o�L���/W���JtMBGWJP�m�X��<0a�-4��B����8�tM���+�$^y�p��:a�g�}�UQ?�[�MTH�Z�q��i\Ѻp�f�� ��B�|C�����׽F�L��A��;parb�<�\�����y#��V���?�x�_�: �x�vQ�и��G�<wQ{���馑e�/��U�f�W�%�	��J)�U1�Q<�M���pD��b�NG�yu���;z��ܿ�� �3{ GX�VHl3�؈SU� ~ B%w�?8���/��N&H���8+��a�G�ՓT��Jv�m���p@D֖$t�	\o(����Fcd>�,�O"h�]h��-�e��1���(A��jO.�G=;�Z�9ֻ��Um���q/���=aWjeؕ���!��=�F`y��4t* ��׮�9����� ��_-6��&� ډ+��]����^6]\���^�*��$f_�ᨖ{8*]�܇C�{xQt5��m�����P�	�'���������{���h��R�$�n��uN~s�{��,1�:\�ޫ2k����+�0.�[�������셵����0��S�E��E�M�~m���EE�3Őȱˣگ)3dQ�r�����_8 �}uy.��<�b��h�{��n_o����\��}�w����F�5z~z6&cd��o���0���19�u*���
�+��1�'���)=��i�q���~�����M�����z���)������>=4T,Z�g�31����JhZ��0�<S��o�+�)��7@��4���-�M�J����?�Jn�N���P}Mc�r=���Չh]�F[�Z?j�,�n��4�->����UW5�Z�H�Z��Q4Mr�0ǭ��T�n�\�k3�J2��<9`�~i�V�J
�ӣU1=���C8���e�Ni��)�J�^��֪NhU�ᄦI�Bdݼ�ٗ��k�!��d����Zb"�6�T�����z5�V��V%�gCg_���G��2�#LUݾ�{��4U�ɽ&�s�s���ܢ�
y�� _�U��xU���W��z��V�]Te�� ��2}�V��Ve��/� ���<mC�V����4�mI俶)�_�{��lk/wy�PK��Z���V��D�H�=v��9@��e�6�\Ӧ*�H^��ym������&����_m��WUV�Y����V��*:��6�����+]r���TZ�3���8�с�el���Г���f����vG[X�5D�D�C���M�GZ����ʄ+N�X��U�TUU�RQ�e�M�"��������$z�6&zQU���!ߜ:�)�Y�xVU�$�@��c�f�Q���8"�+��/��,��ۂ#X����[qe��і�ZEaU5D��>:���Q��b�T�5�+���:8�,}��	�v�fT="�}g�����VZ\U������͟xXV�SJfR��ɓnX>Қ �U\����[�����õE"�pkrke��5�K������3���+��Q�9w˭>�?�q\'xI����sM��x&V��Bؚ;9�S7@|�kc���
 *����D�����~� o;;��`E�S�)?$<]�p ��>@ꢀP%DS׉W��f��Z�5�^PY����6g�	̀U^���S�H݂�D�:&Q�T��y�7�o4-��\ �gu{�M�r*hvo��X뒇�ǥ��v(v�Ԇޠ���K�V.�Z�{4�*mE� M�������FȬ�bO��;-����: ���5�����0�-�`�+@Fnw�<�.�O���Ɂ�R�]^ɶ��F#,���W@��'w����n    �.���6�AT~�"���tW�Apy��8����%��ĎY�e��iu�I$���쪮��[���� �V^ Z�u"jۉJw��w��ֻS�.9�~��^��U�6x�r��P��V��沈A���i���]!U�܆\&��n�� Y��rs]N�E�Zyx����}�S�uX�V��vu򌾩 ��b��-���*��o��Gy���:�%��d3��Z]�]�v~+�x�Xr���L����L�ܶ�2Q'����,Rꝇc�g�����\��+�6�hn��<�# �S����R��M�V�GfOC�.#��X"��>�� ���19r�1��2�s�U�9/��J��)ы�zVm�+�2�0�]�Ė���� �a���������]�N<t6[��X_;�d����R��?A��A��ֹ���|n�h�?�_ �jvg�Q\-&	�O�����r��zYC��`�����?*9��±����I�V&cNw7�0Vg�T�"��"��V�SO5Ur�^\�>���Y˙��;m��n�֤5y��ζV�Ո͉�&����c⩊ۋ�}���^�]r�x�d�M���+<k\�9��&�sfo��urĢB�t�4�������;mIӫ���UM�\�Y��`Yuр�����c5S���}Ar��f�n/�#��ñ���{��y��!����Ξ,r��'0��*�\/�f��s��Ɩ�;m�ˀ�i��Y���s�'��ď�Y��Nv�_����uX	'��4q����0����K��^���R� ]_^���m%�	�����ga�9Z���O�x(��'7�g����Ľ�i�|���|jg���nX`�`����p��t�&m`�]&�S�_�+�����գM�h��faY�u���U�a���îf�x=%�~e�w9���v����*���p�4ł��	"tu�����k�i��1���4- �s�~�U<��{i8J��՟7}�z�����Ka�\��>"�jJd��� �ٯ0�����m�)���x3
��%�_z=X׷㧳���U+U�$XǞ\���5��ʚ�*�]KGi�&OrG�;���2��G��Lw����p�v}$]�&��������qW�"jD�w������!�nec��	MHL�=8���������Ƚ�=�[���폐�NtK�b�� ��yޢ�(�����ov�t�^xV�8EZsAY.�p��S�F�o��C�V~�5}ˀUgY�[F_��E��zd8��v�1%6,�̆�;��n�1���P@�#�,p�j�ꙙ���84MyYk��_����&�͗����s1���9��̺���G�B�
\���p@y�s�#GN:c
�|���`�P0@jLЖ��ɒ4Sz+| �� ��  �(,�ݔ��C�f��˛��m�v��X��x�/�C�L�2�SM��:YBU����~��r���V��2$���i���pcʄ��p�f��
4�c3T��3���U�f�ovAa�TX�1씫4��Y��ti�\\)�<��S��s�pM�è�nh�B��O���f�m`w�;uV��F�\���f�"�e��h�8_��?��"�!��G�57�����7r
\�fv2j��B��:�ٮyWCD���s��F����R�ݙAzM�~9/K��!tݾ��Q%��r�Eō���)���E�#��E�r}w�bel���7�)K�$u��άV���Y��}k�� ��'V��B:�����n|�\�ʛ���8��~���viVk�?y�m����������(z�.ܤ���9ߊ_�p�"��YC��8���/��7�_k�J0@��EV�������q��� Ǭ |�άӭ���kg�è��:����#^ �ĩ�ڕ�UU�d�x�/��s�`Н"If�\�t".r�F(U�S(�]��Qm�m]*�������F��w���nǃCA ����DG����g[yE|���}��J�AT=�
r����%u�P��V���5�KV�$����-����Jw���K�-��ӗt}��X�Bd�\" ~�|Z�a([�ccV�(o���NC�l�.0�qPS2����	��.@�S�Q/)Ϩ�Z��#�;��r��0r��5*0n���#V�3ݻ��:�i��3����q&��6�j��eLH�՚ᘧ�T<1d!�y��lK)%����T�����R��҅�$��;��D�G�?L`�d����e#��ą���q@�0fM<y^Cף����}j_ �&��LG}�.��9��Qj�S����e��w:J%��A�N�eiY���V{�k'(8qWX���D��K�P���5o�ԺD>�̧�w�MF�=�q��=�g���f����vr�/��V^s��+�X�(�˔dv+�[�G�w���¦�%�p��� ��"�Z|G(�"���n�@Q�%�|��	6la��e
�"JΆ*���ć�#���;�^�Cv��
W2+=ZY#hd��&�-1P��e���K�܏k�x:�a� �������Mp�Z`�D��,;�Y���\ǚ����'��!�h)v=����X��g�œ��!�y����֭N?<�x!=�����g�[�z/gͭl</ox^���]�)�I��p}pG��
����Q��1����pgA��K�2+�Yb96ׅ�7�~�q��?ΰX��vO������D"u��aK���>�3��5��ّ��Gk̩�C�~���@U	l��n+L�����]T��U�\�]�otZ�o��\�9��d�d�G��=E�&�\)��R��޺!���s�A<s�u<�mf���x�1'�*rM�+K}7�_�q};�P�݊�ǷY�c��w1N�Vޝ�/+����[/ !Mf��$* SQ2GY��� Κ��~����H�l�j�$���z�bNa©�&��A�=g�1;�=���/x=�����ɯj�k�L�(#X�S�`��S�?t4F3e�j@�4|��b�B@����Y����~���H���u\����BZ�P�
����/��B?s���4d�tb�$)��1|��Ga8%��7d�#�1��ܘ����8cV��N��HQ�~t*y
���b=�_�p���0��
�7ʨ�R�PW0���n`�����r?�}�3��SZ!���_O7�(.����w�8��#��e�<������vZA�	�� ��Q\W01rdc�:��~��y˭c�Kcd�?7!s��A��.�ւal�N�b����Px�ީ8��_J�-W38)���E�Joy���7-c�сV��u��/ֱ� �l�p��C ���톼��˦@P�/./W�d=xI&��m���ۂ�����l��}L��rb�Υ���c��!��S�R��Pϳ�p6y�v7{�� t^�*'�;�'�n~�nd������^9�=�A�E�|vv�>�#��f:�t���^2N16G(v;Cd�=��и�p}DC|l�������ł����e�{�%��Ӌ�i�bAe/k�L@����a�^�S
�/^Y�ُ�;ش�b�A���p<DT��UI���� >
��8VH��fۅs
��漟B�,���	d���8I&�	Py�'���.��κ�G�>o��$���݋����X�T�1�Hq���M9�%9�uM#�t��m΀�S.���4vc�K& �����[u��q����1v��UMGs#ކ�a������v*�`�56.4N��C�\A8���O��;e�H��,��j:��e?�ꉾ����'c��0�2x	�]?�1t`��&�C�|/&6<MY�L1�t|71 �m's��%�!\e���\xq���W�K���e�@���͋���] �����C:ky��o�3'���n�4/>uk��u���Ƅ�rܷ��ܜ�����p��&T�Wlً`ey3rP2��Ȁ�hy���-�<�erw���z�k{��5;��+�b�m��gg{pZ�~<����B\�i��.���&�u
�+�*]��= �  1�����Vĝ6��n����~$�F��!0O��Cw��E^���4�#���M�b*(�']ϳX�������vʠyۃ��#��bwTܩ��p�&\�[��=��푴	J~Fp7_gx�C���\g4���E�p������"Am���{�!�&���	�Z�xs`��F-�D�D��b�ȑ��ʃ1���8o:;���X��ܺ����<��Ete��Kr8.��)�
��:�{*���U=��}���9��L!�l@N ����p��c�5�Z����ʯ`V��1*s6q����aS�y!4ˍ�{�߲�gtA��Y#��y����=�ib%��'���ӧ��e؁;��`��]
$<V��ѕ0{e2^�i;�]K���MD�p�C�/x��#zҿ��e�v�4b���-`�a_ ',๟x�2���X�q�46���t���&O�a�f�[��}��16���&�r��#�/�'��e�#q�v���e-            x��\is۸����+�.K��M�c;���k�zU)��H� A�d�׿nH�32��ܱ���75U��RXݧ�Y�7N�����m��_k��BG�J:S¸����=�/�Fn�F�rJ�2x�v��a�o�e<w� '��Џ��e@8�%U����3h�NZ�{[#�,T�j�yj�=j��{R#�'�4��K	��M�_�l��LW���u35���<�ֶ��_�Wq�D6��b�Q�)�P������b�� 9�N�,�;S[��X�.��y��$�J�0҃f�6��2����9�i��I�ʧ���2���^�y ��e!	Ǔ[��vw���Pق�����u��'��"�ҔJ]9�O�=�N��;60{�G���%���%�.�9]�̎r�I�'T�y����E���<��Z����s���w7g�{���H%-���Yȭ�z~�x0wG5"�Gq�얷}$��+�s\8G��³����qZr��m�f�k�J~Rc�XdTW���5���2sݣ�G$�Kb'dgg�\��1��Gt�$�d����H��Ǯ{W���lm�>��s���Q�'NZdR|4p��������Q� O ���A+�h�ﭻ}v��u{TG$+c�Q�;U����~����z}0�����I�q�MWӚ��D��>��&׽F�*�!}QJ)�3��>��I8��+�HL��I�Р���F�Z�(X�r�2�,�޴Z�7%+�h�q��C.<��@?��ws���q¤V����ހ�E��T�75/�e���Q�`�G~;r/j�P
Ƙ%DK��f�z�;�yȵi�"2P�n���KC"<�I�i:��T!�����[	�����Ȕ�#�I(D��Ũ-L�9���j��,Dh��Y�%B�9���N�:/�o�1�;�%��4_��Ga�V6�����'j ���o���>�V�Q9��A;|����kCS�V��_�zP�f��S�KTA�&�8{��-\wR�U���^NB< ��рrZ��`7�Sc�1�$g~de�HSZ��8�4K�����:;[!�E*	�9���w�m�����J`�Ժ<m\���T@�bkk|=�6�%R�^h_��y}�eAô3�r������(��J�$��A/=��
��"���v�C��S@W�߰��|&=?AW��e���捰�c�Ze�B�A�����ΠD��r��{rcB��Xw�Y��Ƽ1O��ۖc:�6 �,�C�TuI�u4;8����^w���ܦ8^~�C���P�����p�39�a��L?"�>_�mVt�`�\/�<&��`h��˱�k�m�	dƷ!Yu4Cjg���x��G���c,?�KJB���s(�O���G��BE8U���,������,?z�_�H �����<��S�e4eA	����q�T�%�(ё-�T�p���r��z��=�J4M��|&8�݀ �\�}IA��)Ґ)zC��*��u߲ �1Y�Yb�8�[ J�:�@�5ح�ߧ��`���bR�l	�g�(!�
ʂ-iN�Q���M{uk �MQ�#mLH�v%'Y�l�{i�� W�^O�̰~:� ��pg�%�-�D!���m�]ޜ�_k!X��g5�8�I�R�0؇",��ʼ�/c�����o(x��5m۾rм\'�=��jCD��B��g���}��*o�Ы�����<f=@X�\t�CQh.D��|���y~{2�IE�+ �Qx��+W읡;F<)���=��P)��_�7J�����5'�	�[Q�p����4���@nקN�歑;~Bf�i,f���mY'�	G���D��R4����WL�sd�E���B��ӜO�!w��e�C��'�2)�C�	����n��z[�~�g���hx��U�z4n�@�� ����J�T��,�1?�)i1��T��է1#���|F������G:rjQA����0e�/v��ޘ�7���G�3ȭU����]�"�<)V6�8�f�*HX5�U��)S���E,���&��F8��{��N���1z�`��M:+�!�Z�N>��m�kxը�	mu~3�N�p7�t�`��i���	5��!)���,�0r�;�`���V��w��8/Z�ӹ{��R�?\;�P��K<-�'Y�Hi�;�T�No�c�W~�s]�+��_�6�X�J{�J.�F��Zr��!Q��茒$��8IbKQ`����~&�)�9��QÅ�*˄�,�Қ	} ���t�X�B����b��C_p�4���)A���w�"�^��fT�r ,��<t�7.���$�a3��P�v;��"�/��{i�o��\Ѳ��G���x'�+I���:n���
=���sc�ftwC������&:��7#�U��dNJ�z�g+.��s�҈�ց��6���O��q+�A�)]0eu�	�q&���PEj�e��YA��0��������v��#��X`�yA+����JQo3F\��!��]b�)��	��J+)H�GF���Ocqtt4w��D&@q�k$o�>`m2�&E�5�Zw���<)����*1�-2��ҞE�����{
89�"��lTB�Ʃ��M��O�1�l�i�E��=�,2�4�+HE0y�����o�⇂e"��g��L}��%��/�e���>�	0ʬR2�Huz�F�F,Ә)WT��a������
��b��݀%�Z[*?��(��"�d*�����;C�VyX�o>��c�*H7�
��Ī�l�?�u��������/D�'!Q��A}P�:���=�4]�p�9�*E��}��لh�%>�ګ��_�J8n�2n��(�:������BS��O���­�!8�oXKu��1P0#50�D��2`LV����K���!d~�c:r�B�Rܳ����¬'��ZB��*>�9[d9RADa#�H^ZD�޺�{��J-�1��������+F�$E���q.��`�t/��3k�F�f�����Q�fE���O`�ܺ���$R:6��g?0��}T" + �]w�Y��k�/�"��ʻ�Cj^%�f��n���{Q�p�dDQ��0؂���ĳ��E挩�QoY+B��_ǣ+$+��tEd{?�x"s�$)���?�1PcSƦJ�Z��(�����sH��]m^T�4�c�m���B�u��Z'�ia 2�8��Ji?�(۽�Kj��Q�WE�@t;gF>�=J�%�ж��OA���� ?ᄂU�ۯ���`p<���H����B�����a���e�0}y�1Q;�F�ߨ���v}Y��<��g5���T6z��9����eԊ��s��.&|I�Q.���)���v�E���O�~��I�Z8%~"�?�3u�jt�<R�԰ P�2�9/ͮ�LoP�Ty��Cb<��~��>f�J.�@H+�8#@��E��W�x�5���=��+�өq���r�M�g#'���	!Ȇ�:0dk���hr77�0Ĭ���]y��ŉ�ư ��C��3Ii�]]��o 氍8��n�ym���.ևL�o�ڥ��8#^��].���.����{�z$KTJ=[/�L�Z�� {�� �K$_ڴUn&����Pmn�띺��z��CPX��Z�������RD�%+ �R2����T�줳Aj�U,ٳwz���f�x����3RyF]=��%R�p����j��fn����>1�(���R?������ZT�e����1;0~��q�/�u$�|�)��W������Ug�g�9��'�$ۯ*=�q��=pu��*$��d0�|�`Y�s�C���+�_-|�T�v��#z)�j�|�P>��髌��O�PGx��kK\��,����7. BDP�B�"�63�T
�A�]ˀ�ۧ�̣��JH�����%�����̢~�o��tp�FSg;��/H�SI��ږ�&��ʴ}��CNUE1{yOPU��M�������������(�e�2:���77��,Gߪz�-HS��������ǀ��H{�/>�I�_�u����eF �  �X�q͋C�k'?�񟠞Gx`Z3����)�Z����><ts��,��Vd�PÞ��b�k�br�'�Uem��i��L�]I�&�a'!R-!;raM'9p��kލ]��/Z�S�Ϫ��}t��\�Od�c�.+L�$j!���P�l����Co4�����c�� U� �`�+�EX��}`~/�����-tĉ� �Lp���.w�)���=�w
�7nu��J=��}���((�$ �J�xy��6�oheV�����T3������3J��W��-����{l3�%���@Z������\q��a���z�	�|3?R�k�w�e�ꠇ�fI�pT�h�}��н,(!��^����W�F��AJ�J��<������u�5�X����bp������~�f�?�#��H�-S�K�Q�aI�b��$ovd�4��;���&�H����x��^p�Q�%�������/�Zi;���9�G�|H�&�0GQ^���;�����]�3��͵�,Pa���r��Po||(氖�x�[��/�F?�}�WS�P�g�HJ��y+����F�6�;o?"�# [W_�`����x�v��ۤ�׷��?��Pwc�}��e�T��݅��;
?��2Zy8��,�:��#�`�/���|p��\�pӫ��$o��đ��/��\���&�otmK���a3�ȼ�ʐ�A���a��9~����[�~J�{Pp�K_x�zi�_���� ����s*�͏���&��w�b���l��k���9q��F��+�K�C�8�H� !��ά��7,�8�w;�u��!�;��:r;5��{��f�Q=�w:'U&VI=!�uĩ4�N*���%�~��J PAI���Ҕ���,
��o9&E�%��^��!������f���:�����F0��7�m�O�p;�%%�n5Oq�A��@�0��x[i������nAC;�\n[��U��:���	���`�����t�%('UŚ:�����spx����/�����i�T+fT���M[ši��4�!:�����-���n�U�y;�KK[l�3L�4K��J�%'����)jZ�5�����5�;"�K9ey�QU� pL�h�5ط�V�f��|�`b��u�;�EJ"�J�A�\��b�e�E]��ùc�C�"c8�P�Ē���as��4�{�3*�Ț�j��Nk3I���o����JN�W��34d;: AP����ڴ��?u�ڪ���u�XW�_.8��-/��2B�֊�a�S�WS���cߛ^���'�?������t	�D$WV��OE�5͗��ĴF[����Q��AA��Q����O�} �i<�b�r� �PS0,>�G����qO�\<��J�����&�e�� YP� f²���:[\��]	`?��u�����v     