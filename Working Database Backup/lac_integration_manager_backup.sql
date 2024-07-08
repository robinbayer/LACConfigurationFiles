PGDMP      ;                |           lac_integration_manager %   14.12 (Ubuntu 14.12-0ubuntu0.22.04.1)    16.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16385    lac_integration_manager    DATABASE     �   CREATE DATABASE lac_integration_manager WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
 '   DROP DATABASE lac_integration_manager;
                postgres    false                        2615    16402    integration    SCHEMA        CREATE SCHEMA integration;
    DROP SCHEMA integration;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false                       0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4                        2615    16401 	   utilities    SCHEMA        CREATE SCHEMA utilities;
    DROP SCHEMA utilities;
                postgres    false            �            1259    16422    membership_level    TABLE     �   CREATE TABLE integration.membership_level (
    membership_level_code integer NOT NULL,
    description character varying(50) NOT NULL,
    active boolean NOT NULL
);
 )   DROP TABLE integration.membership_level;
       integration         heap    postgres    false    7                       0    0    TABLE membership_level    ACL     [   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE integration.membership_level TO lacprocessuser;
          integration          postgres    false    215            �            1259    16437    membership_status    TABLE     �   CREATE TABLE integration.membership_status (
    membership_status_code integer NOT NULL,
    description character varying(50) NOT NULL
);
 *   DROP TABLE integration.membership_status;
       integration         heap    postgres    false    7                       0    0    TABLE membership_status    ACL     \   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE integration.membership_status TO lacprocessuser;
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
       integration         heap    postgres    false    7                       0    0    TABLE website_user    ACL     W   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE integration.website_user TO lacprocessuser;
          integration          postgres    false    214            �            1259    16409 )   website_user_website_user_internal_id_seq    SEQUENCE     	  ALTER TABLE integration.website_user ALTER COLUMN website_user_internal_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME integration.website_user_website_user_internal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            integration          postgres    false    7    214            �            1259    16404    prior_member    TABLE     p  CREATE TABLE utilities.prior_member (
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
    work_queue_id integer
);
 #   DROP TABLE utilities.prior_member;
    	   utilities         heap    postgres    false    6                       0    0    TABLE prior_member    ACL     U   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE utilities.prior_member TO lacprocessuser;
       	   utilities          postgres    false    212            �            1259    16403 )   prior_member_prior_member_internal_id_seq    SEQUENCE       ALTER TABLE utilities.prior_member ALTER COLUMN prior_member_internal_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME utilities.prior_member_prior_member_internal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
         	   utilities          postgres    false    6    212                      0    16422    membership_level 
   TABLE DATA           [   COPY integration.membership_level (membership_level_code, description, active) FROM stdin;
    integration          postgres    false    215   a%                 0    16437    membership_status 
   TABLE DATA           U   COPY integration.membership_status (membership_status_code, description) FROM stdin;
    integration          postgres    false    216   &       
          0    16410    website_user 
   TABLE DATA           �   COPY integration.website_user (website_user_internal_id, website_user_external_id, login_name, reference_name, wp_user_id, sf_id, record_added_date_time, record_last_updated_date_time) FROM stdin;
    integration          postgres    false    214   .&                 0    16404    prior_member 
   TABLE DATA              COPY utilities.prior_member (prior_member_internal_id, first_name, last_name, account_name, lac_membership_start_date, lac_membership_end_date, salesforce_id, lac_membership_level, record_processing_status_code, membership_level_code, superseded_salesforce_id, work_queue_id) FROM stdin;
 	   utilities          postgres    false    212   K&                  0    0 )   website_user_website_user_internal_id_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('integration.website_user_website_user_internal_id_seq', 1, false);
          integration          postgres    false    213                       0    0 )   prior_member_prior_member_internal_id_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('utilities.prior_member_prior_member_internal_id_seq', 602, true);
       	   utilities          postgres    false    211            y           2606    16426 &   membership_level membership_level_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY integration.membership_level
    ADD CONSTRAINT membership_level_pkey PRIMARY KEY (membership_level_code);
 U   ALTER TABLE ONLY integration.membership_level DROP CONSTRAINT membership_level_pkey;
       integration            postgres    false    215            {           2606    16441 (   membership_status membership_status_pkey 
   CONSTRAINT        ALTER TABLE ONLY integration.membership_status
    ADD CONSTRAINT membership_status_pkey PRIMARY KEY (membership_status_code);
 W   ALTER TABLE ONLY integration.membership_status DROP CONSTRAINT membership_status_pkey;
       integration            postgres    false    216            w           2606    16414    website_user website_user_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY integration.website_user
    ADD CONSTRAINT website_user_pkey PRIMARY KEY (website_user_internal_id);
 M   ALTER TABLE ONLY integration.website_user DROP CONSTRAINT website_user_pkey;
       integration            postgres    false    214            u           2606    16408    prior_member prior_member_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY utilities.prior_member
    ADD CONSTRAINT prior_member_pkey PRIMARY KEY (prior_member_internal_id);
 K   ALTER TABLE ONLY utilities.prior_member DROP CONSTRAINT prior_member_pkey;
    	   utilities            postgres    false    212            �           826    16418    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA integration GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES TO lacprocessuser;
          integration          postgres    false    7            �           826    16417    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     ~   ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA utilities GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES TO lacprocessuser;
       	   utilities          postgres    false    6               �   x�e�1�0���+n�f�D��Q�� �����ä-iZ�7�vP����Sp��ۀ׺`
���*��3�����'7�d2�{8z2�{59�"�����r�.�ۆ}4u5�����j��� w��ՏS��Nn������4�A8�v����x��B��RC>            x������ � �      
      x������ � �            x��}[s�H��s���a��g�	$�Λ�o��C�ێ��@T%�]�ן�eJ����U1�ĴRN�;?�e�/���d͎��'���]���9��j�dg��8t���΂U$f�7az]��՛��f�^���ԧ7���om�W�kM���Ε��8���O�'w��^�+�#F3wQ��Qg���^1�/�u���݆�t����A�����V��յO��] яno����� i�s>w;�=i1?ԝ��x����i8:'��c�9˃�ɜ9�'����^Z�k���# 3u��F:�����\�d��q֞����t��*��8����E�5s�i�a0����]�Գv���	�S&�JCp�j�q߹Ƀ�d��ք]�hE� ik�G�y\��i��.�'���4]����NC�����N#:�V�� \~��d�Z��n�C��V�~N̜��f=1���؟zb�����v ?����2#f���؏��I,Z�]�U��/�{�/u�~�A}�0~��F^Q_,���"�����Gv
{��]��|�Vӱ=��v*d��͡}���7�������Q'���S�v�DU�P���񁞼%y�����?}��L�]��$kv�UO��3u���w���䟨���\�b������h5
�(n������ܵ��ywH�����!��UH^h}�o�.�����w� ��ͣ4��C�b�L����S�i)�_K��S��9�;ǹ Y�+<����4��oĸ�S*���}��v�^��N7�8("�t�]o��0P�-�L����]�i�����F��x��`I[���p5�ұ��y���/g_e�6�fw���hj���>g�X,Գv ��n�;}V:���'����s� d��,���X*�-������N���\��`���a<��4�?77��0��;#Mvʉ�'��^�M�������1������ތ�
G_@�_8j1�O���H�v�[u~�E�)�s�<X+eՌ���3��k�D|趦Y�n���IS���B_=���:�N&��é�{���$��h~z�;N��z�E��X��^�Hr�zk���w�.S#e��@�QN �:��;�E�ȗ�I8dĔhFxR ��[h�@ww9�XC�}�B���{���q��=�
��̘o��5�����7t��K���D_�v0é�B&��#�Z����~/m�>2`�.����;F.l�5�~�c����8�ܫ��<�N�;K�h�s���dl�f���پQ���2�i�p���;�m.H.�>t�������3Uw1������O|i�L�ŧ��p%�ĄIK����2���U���� ?hl�҂� ��W�D���]����F꙽p9��-o�w�,�+V�}�q�|���ځ����z����m����D��V^P6N8���N�d�&�Z�4����'M��qq�p�^.]_�*�@�/V>w��:��b[���91s���j�I�:u=��e��"�_T8Ƴ�6O��O�j���x.]W~ `v<We�("���5���OQ��1G�v���s�j��;Hj!�����NW�BR���ʼ������;�-��>��{�|��٤+�%�g���qV-n,�N���Kѧ��;������.�;�36�\�^���o�r���H�a�8��Y�jM;��v��.��}�<G�/��/{q�wi���5;<O$�#��hӗ/r�1��q�𼓏�iZ���v��gU�us��
'p��@��<�6�|�f=��0�ٸ���/���qo��N>]��Q��؉Z����w4Z���v���O�E�W*��S��s���뗝|������S���]�o�ޠm·/*)8�ũ�q:����}�tǋ�B��H�'�ŉϹ�Lk�?r�3�A��cG;�C>�HZn��#{� Y���;��\@�[A�,x�����7�z�:E)��Td��z备���W���j
T��M�Ny��goh��)Y.sH�̹�����g!2Z�%�t���8���{�"�����N>��a�+�'�'&�0E��v��/Z�O����`X�C��
��,������ҷ�>�?��B�٥�l5	�KZ�9��x�9��䳶��LmM:Qs��v���eI��LZ^�9�E#�%���\Q�p�qS�8�@�;��tt�0#�'v�d�L�&x�����wQ�x�z��"i�I��Ȑ' �߽� ���vD��ɋ"��cQH��ۼ��ܒ�O����ޠ���·���GNR�j��j�HL����1S��`���P��/��g�ı]��O$�"X�ybUWA ���0�X�=��e�
h���k���0�֗9ii�VZ��*�G�(��]ڽ\ʡ���\�y���޽V>tWq߻���/��@���HKX�[>�	�jv����	�����8G����Y��ǎ�	���I���b���Мu;�0�F2� $.?n�fCKQC�S�û��g�|jh�ɔ����(�M�@��x�l�RHK_���q�q�rA2�C��P=յ�NQ��9V^N�lI�@�%�N(T���C�}��Й��]r��tF��4n�����z���T��0�1�3�˩ɴء�}(0��z7nk����zI����I�2�\/�ɻ>6���l�Z�|7���0Rm���m�iN^��rW:99�E��$/�,�^Nv
cb�`LڷGZ���Z]?�P�:�pp���zRA|س�mT���>�B��;���|N�'8̓�N��7`{48r�Al�$V���|<OW�Л�/u6���o��C��l ��u(<��sU���K�-u������3��\�5;ޒ�g�V;��
�1�FNBb��luF���PD�+�|#�)]���w-��C
�sA�&3��w��Ӝ״e��4��f1�Wo��	���x&-�вD�4�t��g�]����~���/��h��`!�1<�T[;��_�ۻU��O�i�/9���*I4jӜ�����5�];�-U���+7w�j���dK�	�<���j�>�uvB@مR����HZ �N?��\�V��Ǔ�^�)����C�q	����4����b:>��璜���￩�r̈[(��I���8�2�����sl(ָ�z:y���5��Ĳ��m1��8���(?cww��%0��:Z�%.})���) ��iI|����F�E?<�v��|#I�\�c	q��q��[�H��c����M�@�J�y����t��C���Ҽ��=�W맀L���OV21�Tv2ELN�So^�n?ω����~�@l6��5;]��NU#�X}�틞�[O���A�Ɇ�ʎ�Ꚍ5!7�Ɓ�&-lR�%�_S��ϩ�Nht8��P�DG%�������Mu���I3�����ZC�cW�{��m^�&U��9͛������l�l���j A��V�6�&ϰ�$/X�����/��Tuз��f���?�� ͌���Xx"n�+���G���ͳ����A�&3�\6�b9�	_��c7J��A��Z|�+ji���V�<��{�?T��@!7�8��/�$�n�Z�x�E��9�@z�O��y��`�D���@j�qzB���v戤A�|/wq}���Cā�	��t��IK����+�Q��\���t�@HJ�HLv���[�B\~��	]��evz��xt�<5��9�!x�6kw���#l��҉ς9��0;�F�D����]���!�b�V;�{
|�<�L<�}{��>ǥ�S>A�&'�\>d6������8�[s��"��f�ܷĩ5X��Ώ�L�Ƕ����=��(E_�q��z#&��h�N��ݯ�s���n���� ���{�?PMl,���
��/����M����&@c���+�Ƃ�Tv�Z����R���^�E��x���t[��¯�.� 5��ڀ�FT�I[;�Y��gg���b+5��J���C>���H̛C�!z<Y'��e|,f'���ˁ��e�xV�3m4�::�8X2.���e�SW�uy�R]Y��!"�Eu)���B��s4Z,�2�2'�w�=��'��(%���X��+�?�<ܑ	    �s���:�i�Kװ6�g�E�:I�@�yk�Ĭ��tǑ�}j�������M�9�QD�L:l���*f����cQ�i���b�z�P�6v��* i���*�����r���Y;�;���~���s��Ɏ�	M�E�Tv'��E����Iu��#�*��w��dmà��(qI�a#0	��aD0�~U�I��.Z9-��V(n���RQ�Ez4�G�F�O���vmu��0$��KMS8-C���#Ƚ�
�H�qt�:�2)m�բ���i��v��D���K!C����H� �	v55d�@����Մ.�C��=�y.x�Mλ�k�K� ��T&�����$od��gd"��Ŏ�2甫j6l��T.�V]��U��� �S�nG���|ɢy�t�K���w���Ky0�M�����|�`�ȕu�0&���ab?=$��B��
�;�D��)?���sM"(�d�n�=�R�&���-�_��r1-#�Z��-x-���b���an�� �*Z�����&���P�$�gێ��?/�K�s\�&�IU��l��#Z��3���d��9iS��w�L2Ǐ��!f=�Ք�D��7��$��6�l��	�5�=^	r�j����I7� �H�tn$��3�}9H|�-�����8�ą��Ȑ�J��)#����4�Y�fE���7� �:ғ���ha>O�f�Y�8����V���Vf���Q&�O^����.�Z���}�����0:Υb�4�ԇj`�(�����0B�J�)�������_
+,ʕ�Sɗ��á`��[���)�u�X�:�2+�O�p�B,�HS�%�N��qdz Mo���k�u]�����|E�߾�ZK�h��j$ـ�`�^I"/)��s��-dRCf�J]l��N+˂k�b�l�G w����(q�s�#	U�?��V�<D���N!Y6�$4�"7�Mt��p|MsR2�ƦG�4����:�P���f�γU~x! \1}��}�}S)�D�Hûhu�8�٦�$���F���MOT�1m��>mض��K�˙���r�.�uڶ��+C~���:�����t�?�c�H]�t�?�O�厦�g���&#-eՅ%��f�7U���s �ӎ�T�6/P���RƐ�_)l�5g�3рԀ�Ý«��0n����х9�;Q6?W�N^����e�;�!���O��ܕq^ZB�=�����4��^����)ݭSO�z���'���|�Zq���|�L��'�A�o�L�e*��tQ��9���bR�T�:
 lv�����3.��E6$��IjU�<��Tx�h��|l�	��W3mnս?E.2�i�LH�+BZ��P6�!����(C��;�U��of�Xx9ͅ���ڍ��w�$�"HWm~d��;��|�1��`����9N�A�G%��'7�&K,6�� ��T�^%� �4�q�W�|��Ct�3h�ܨ`0>��j�c��5�..�R�/�QH� ׇ�h�&�$��
/_�S���ʖ�v�`�o&�M������N48�{�r�v����C�_m�kd��qM!t�U�T1�dپJ�
��Ra�$��U+�z����ub]©�ý��0njI?A�
�����v+}K/�g!��۸B���,z�zz�I����
;���h�����1�I`:��wy�ʹ�S`;�譚M���a/��Ҽ��T1
Qr3��>VF�	����V$.�b�m僁Zur_Vk�6��xR.��И�#.4�M���g�*�� �`� *r?4�LF���
���φ�����}��P��sAI� �A>H-6P��nE�Ν,T(���dC)���֋n]v�. ����2V)� `���T��4��km	J��0� K�/_55�����f��3X�2�W��`��Hv�'�ѫ�2����w>������P��#���UrMkD�r�FP�o��)�[������i�?G�0����HV7 ����z�o~@i�0�ٞ��I�IU}��;KB��e�6C05&.��ޣ0���ϯ����;|�J_�l��팸H�#��?�p��K\+�Q�����X�(=0��+k[�q�.��ʂX���"N�[i��Qk��Q��We"B^���#R�Ɉ/WC�g���!�U1M�O�鬎?=PY�H<�x@��|�'u���@r��d�;�6����V.10P�N]M���Z:b�#Q�p4� xp+dln5�} 2�"��ۑZC��r�����ϵ�7>�3�s���K�0�g~�E$[]dދKܿ(]"i���
��_��3٩�œ+H��[Բ�M�'�Z��\-(�C�
��	�Yg'�����j��h�&��U�R�N�m�"�eg���$��p"0���U@7aL�+`^4[�[��j_4�$�Yr�i1���ѭ~H��j^�MѴ�	ZѶj��Y�ә���;�X�n�9�t:�pN/ߘ`�|�Ё� �\���ټ�J{�J�,c� �|zo���<�S���kٵ�|^���gوT�L��������I�&�[O][#n�OT�&�5��'яUV��v�������@��x�\�P:/�9Z^B��E��T&���F<�|��x�T%%�܈����Kg�l;�+�g��3��Q��e��A^�Y,�O����&�"Z�����JZT��X�9O��8 0d��L�$w{��@b�X9Y�"�h`��D���V�Ǝ+K�bI4"�k�^�^����`,�S=P��^����m�FR��|}�4�H'�]�4�&pl������mZ2��B���b��'^�@L`�b���//m��XV��L(�:�Y#<�:�\G0��J�] ��F���	@6��ռL�`�N_�� g0gR�4��b4;�\� 1�I��\��#�=��ʞ�nR�2t���uv�mU� 0�IR��% ёm�#�g�����$n��J�:0�0�'"�o�h�*E� �	vn� 	�Np�)��'j;�/O:��Gk[	ɏ���LVv(Y�CŶ�[��7�) o��7 �ǎc� `1U�*.\UF�*���_^M<�Ь���j(z�|��^��x ��3��\���i0��
Q�f3VӕX0$��,��ņkO��S�g�@vaMo��1������&�wkC�]��dm.�U ���\����&r��&� �!�+d.Ӽ��7��9��Ը�0o`�^���)��퟊[��˛~�K�5�~BA�r(š'k����\���*���C����)��41���q3וh4����S95� �Hʭ�*ժE |-v��D�Y-MYU�Wa�Y.�2ڛt��+�@�Z�c,� t���jع���*��Ы�#@5�`)3X�0���
�8=8F��c�"M��
�ںi�/ri.[-T�
*��i�����y����[���f�`�?!&qիh����cj*7�y0��8nk�]�ݴ�R����|^_&�[��L���,�$+�L.�DN�O���*�X��ck��8G�/7b��x&E����]m�k�S��JO�������B�b��HU�����]T��6cV��Pk�u��n�Az�)������&���x�tV�Z�@G�Z,�9���!b5�Ovʗ��r�@a��;�Ęz�s�ʂLi�{��'>Э��
:y�=���G���	���T��j"�f廏�US�U-��V������G�m��c|��8�NO�'���E�z`4��m`"o)B��&�`#t<��ح�'�4��$]���l�2t��G��R�m�^���o�QZj�1�7���Y4[۔����p��I����9t �~����� "+d��J�U�Z@ՠu{rI�X��V�.�0>��8�����n���t��L����Ln�8Z�+d�̹���'
�sy	��u����`VH�A��U%�$ ��J,�`��BUC����9�:Z�}P�R����y!��_M�a3fA0�eo0��ƃe(��Sm���92���ta���{�K7Z�q��5�р� 4:;��h��೸!��v�#(�_>ϟ��Q�����.@�x͉�겻�;��ᥱ���=(��S���S    ���9в�^k(�֞��A��#��n��+T���+u��FwX=#��j7,"�n�a��'���-��l��Ah�=��T�v���T=k�g�Y�?���9��@���;�
�Ճ_���}�>c`\��˴x�ǎ'$�MK,���j��x�2��]�&�TC
��6,�Y�������2��]�ZT>�8�w���wV�8ُ�ĿU��;�!G�n<:��g\(����J�7����_f�>��d7�퟈8v��u��O���R#$v���F��i�!]�6��Dk���m�Ѹub��N #�K����}��v���uD��i����tW-TIߍ�E��d�2}Y �ɮ�C�/���Ma��y&kk���[��<-$l/(�~�w�9΀b�;$�����#�����T��9��h��v\+�0��Gn�d2�g��^����)m�E˺j��rDsy\\C>e�A�5f�H�3�"v�H]�+��T{]?(�+'8�tV���4H��]���f/y!��S��?(��7:�W0��Ѩ�i�D�h&<P�"|�b8���)��$P{꩘cW����<E�z`��+�f���	j��ۇ���@��l(��B�����|�W0s�m��I-��1ٙ[$�J:+kGF�%/q�Y�I���?��^q���#~��G�ϵ#�e��ؕB��7�=+K���W1�2\�֕�RG.��ݏ�8�|U�bP��U`t>�,r������� �fӈ������H��>���H[���f�G��1��V�;V���w%���"��*?�)�Q�����Q=�z*7|J��zJ�}�5g<��x�j��U�C�V�V��M��ƚ	*Sz�b$�SfMq=�C��hيS�0g�`�b������U���k"�H5����fJ�~j<z��"��9�Լ�uT]Wj�D��"Uv-u�]
$���r���J��#$C�T0i#���{g��Y�37������+`��QЌZC���TW��BLք��R�r(������8H���ur���+{4�!|i�$�����H9�vJ(��Q,w�7W?�_�Q��eƆH=e�[,D�y�ҿ�f2�_X-S^<�*Up���ft��Q�Ue���] �	op�����seK���"��-y�v��E$�YR���"��l포Q��ז=q�����ҟ���/��TQ�x�@�[��na�t&)c�f��h�����"�QU�vÐ���Q��c^I*`��;ho_��q@�F��Y8� �Ҏ���ʂ�(�ҝ�N�ܹ�nsOd6���>�I�t�8�+9��臩��k=�S71������3�	@;؊6�IZ��C���� u%��T��^��	}Js��CKQX����<����v�v(ē��<>s�F�D{ �?�L 4 B�9��`�M��p5������;�u-1yH���k�s����o�a0�?���f3�
3̷ۿ.`׹�o��'�._M�z�d�6[�w^����ە�\�ה�4��x��i�a��k�^�·���oԔ�/���>��\�N���|�ؼ(�*e^���T$y!دL[��l�-_�v�qK�Yo�$�c����Q��.E;�/��GK�Ddw-�~7�����x��04%p9�\�1L^��X�D}����ף=�����S���"iT��V�ލ��u�����-*�M��Qɡ'�p];�t,�a��/�>�����y�=���mDi�SQ�z(w��%����?�X��l�R� ��̈#[��HWʿW	fXV�_z�̃��(�pXJ�8_������Ɵ�ɞ9�gl$3�RvB��8ӗ�'uM�g�� �<���fD����O*��SH���R#wJ�G��S�{A����߫�H�lu6{H�!���M��ݙ��³�4e ՚��˗�a�ݾҹ�G�F�.���(�H�sv�cN�\�ʣ�w���`x�x���P�c��I����B%7>������ط�� �d�3�X�0��&q������av���@,���a�Ħ�Y�£_d��bt[պQa�=Y�Rv�w&s��Z���lMS�^~�b�}�Cuܠ�UA7X�Zd·�1�r��c���2�^�o�R�8(�O~5Xe�AL+�&����ځ�*<�w#{�;[Ǻ�����v ;~kg�Tʇ�@b�U�y����4�"�'�I%4nb(��\��_�Yx�q;k�ي#O1�т#�f�Z;�W�Ƴ�p`��2�Eۄ�+S��D$�+�W&��!N2�NMK������R?ikC���	��-:��׾&��zC�1��������Bq�˳�03XDuԥ��Rx�6t���3��F���<o�_��1��~\������N��&�;�#x��E9�xm��^ �2�^�0�� �|�R5���HɉNك�c��g.�r��(
��x,��O�H�|v?C��|T�]��d�4��,�����'fs�"ße��/�,l1���i��8��/�R�f������f��F�Q(��:~|��=y|)�g�~�u&�3!}�Z>0rj¦=~���sQZ:�|䉤Mt	E�^��wN2 4�Dt]��\n^�Rm�sS4~eπ�0]b򃀨e�=����`�+c��w���,��J�Q��B�ˮ��{�B���f�ȷ��.���� /2��P��.���Pߗ�8�d�K�9��|���r$ӫa���"c8�%��_+����7��RD�{&�F}��]��ŧ����}��
�|K+b��P�����e�ZV��f2�k�S�[����!�1���M�RD�X�p�gh�~��"1�<+�48����><����P�l<|ϼ)-po�pPA��$�=�r;����{�aB?��;GኸU��Н���.eO���,E��9�P�=6 <�4#��P@��k4�9Gկ��X�_|�y�����PL>N=u�y��`�=�M�gĐF���!�.�� �ao6�~x�zQ.K��&��k���`A��j�����<�K���à�5�kdD��Gq\'A8�Y.na�vx=�+ܚ��$r�`�� YDj��|Sx�i��.�� N���M�!�̝sĥo�z0Uy�����g+m2o��Oαd-]v��A0IZ�`�q!S�ە�}O,���Ŗ�"�4x��[Yt2���3	<����⦹���ă�%>�]�C�V�h��ۜd�1F��g�G�T�"-�pJq�@�:�$t��.��6t'�Ib�Zը�u���6�cN�`㬊kV{�a�T`4dVr�%�˴q��&�=�8{�&Q����������+��E%d�>�`$ywq|'�pR�����kgs�F�~vݥ��7/�	�׳��v�����4qe��C���`�a(�Wú�i	���_�K�_�����;(L������-M���k���-���x����t����&;\MJ��m�~�BB��2�Ak�R*�$e1�2QX��@T��cKR���*X�L�u���2I��_�pC9��������t�ĳ�ɔ�tʢf���`������#h�3>���IJ9T�2���|��=H��NM�'�r�ͬ��z�w���9�[��N����ٶũ��J9q��<[y|犻��2��A�/�+�s�T�¸0�Zf�e��͛�VPo�����ٙ��q]�7�Qv��������R��ѴTFC����R��Խ�cye��#þȺ~����;t�X�!����{������eA������R��JL�+ť�l�q/R����b)�bƕ�������d��Mi�t?h�egq���+�ؗ+iق�ZL�̟�}���h2������4��ؔa�3���4xH�
o�#��v����M�<��XN=qq���x�t�ܪ�N��?n^)ҋ�N�L/��6 �.Pˤ���T�z*��!O�?Բ�jW�ȭ8~����a��gl��2u����P���P�����Zf�ٙ0l�fq��s����]g�G%�����J��r��:�G���J-?�97�^�א��C�-�'�/7-1x��z� R  +�����p(*�J;��t/G�@��a>�xb��b����'��3�?o��"ȴ5߶ʭQY�m���`hޠ<�nM6|v��51��8~͐}�����s�1��X*���$�'�THO%��I)��\ CvR&��$�����Y-D���W}�o\����1�ɜ9�#��j�����������b(��ι�����E����4v/ ͟'�a����f�D�0۴��s[y;o���0�W�a'�T��$�al#���eo��[���D����kpX3DA>	`ɋt(�Z�����^g5�����.�_vTK?�v>��SAY�P Z`�
ӊ��ͥIwa7ّ�U-,{�ҭ)���_�wvVm  �9�&p�����-6�s����d]�v�����;r������� �`ܵ�v7 �8��E�I>�6/�������3��-����u �j%�g{��>{�md��$�<<�HMQ~�c���,6�E����k�o�P�J��M%���G�_J�5^��vs�%O��;���<_V�	�.����H��#�N��?Ylk��-�2�aėϢ\s�D�31�����߿����J��     