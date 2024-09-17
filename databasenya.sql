PGDMP      9    
            |            taskwd    16.4    16.4 E               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    taskwd    DATABASE     �   CREATE DATABASE taskwd WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE taskwd;
                postgres    false            �            1259    25044 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    postgres    false            �            1259    25043    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          postgres    false    216            	           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          postgres    false    215            �            1259    25076    personal_access_tokens    TABLE     �  CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 *   DROP TABLE public.personal_access_tokens;
       public         heap    postgres    false            �            1259    25075    personal_access_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.personal_access_tokens_id_seq;
       public          postgres    false    222            
           0    0    personal_access_tokens_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;
          public          postgres    false    221            �            1259    25088    produks    TABLE     \  CREATE TABLE public.produks (
    id bigint NOT NULL,
    kode_barang character varying(255) NOT NULL,
    nama_produk character varying(255) NOT NULL,
    jenis_barang character varying(255) NOT NULL,
    harga_produk character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.produks;
       public         heap    postgres    false            �            1259    25087    produks_id_seq    SEQUENCE     w   CREATE SEQUENCE public.produks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.produks_id_seq;
       public          postgres    false    224                       0    0    produks_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.produks_id_seq OWNED BY public.produks.id;
          public          postgres    false    223            �            1259    25113    retur_pembelians    TABLE     o  CREATE TABLE public.retur_pembelians (
    id bigint NOT NULL,
    nota_retur_pembelian character varying(255) NOT NULL,
    retur_id bigint NOT NULL,
    alasan_retur text NOT NULL,
    tindakan character varying(255) DEFAULT 'Dikembalikan'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 $   DROP TABLE public.retur_pembelians;
       public         heap    postgres    false            �            1259    25112    retur_pembelians_id_seq    SEQUENCE     �   CREATE SEQUENCE public.retur_pembelians_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.retur_pembelians_id_seq;
       public          postgres    false    228                       0    0    retur_pembelians_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.retur_pembelians_id_seq OWNED BY public.retur_pembelians.id;
          public          postgres    false    227            �            1259    25097    returs    TABLE     �  CREATE TABLE public.returs (
    id bigint NOT NULL,
    produks_id bigint NOT NULL,
    supplier character varying(255) NOT NULL,
    no_hp_supplier character varying(255) NOT NULL,
    alamat_supplier character varying(255) NOT NULL,
    tgl_masuk_gudang date NOT NULL,
    jumlah_barang integer NOT NULL,
    kondisi_barang character varying(255) DEFAULT 'Baik'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT returs_kondisi_barang_check CHECK (((kondisi_barang)::text = ANY ((ARRAY['Baik'::character varying, 'Rusak'::character varying, 'Rusak(Sudah Diproses)'::character varying])::text[])))
);
    DROP TABLE public.returs;
       public         heap    postgres    false            �            1259    25096    returs_id_seq    SEQUENCE     v   CREATE SEQUENCE public.returs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.returs_id_seq;
       public          postgres    false    226                       0    0    returs_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.returs_id_seq OWNED BY public.returs.id;
          public          postgres    false    225            �            1259    25051    roles    TABLE     �   CREATE TABLE public.roles (
    id bigint NOT NULL,
    nama_role character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    25050    roles_id_seq    SEQUENCE     u   CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    218                       0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    217            �            1259    25128    stocks    TABLE     B  CREATE TABLE public.stocks (
    id bigint NOT NULL,
    produk_id bigint NOT NULL,
    retur_id bigint,
    stok integer NOT NULL,
    stok_masuk integer NOT NULL,
    stok_keluar integer NOT NULL,
    tanggal date NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.stocks;
       public         heap    postgres    false            �            1259    25127    stocks_id_seq    SEQUENCE     v   CREATE SEQUENCE public.stocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.stocks_id_seq;
       public          postgres    false    230                       0    0    stocks_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.stocks_id_seq OWNED BY public.stocks.id;
          public          postgres    false    229            �            1259    25058    users    TABLE     g  CREATE TABLE public.users (
    id bigint NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    id_role bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    25057    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    220                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    219            =           2604    25047    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            @           2604    25079    personal_access_tokens id    DEFAULT     �   ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);
 H   ALTER TABLE public.personal_access_tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            A           2604    25091 
   produks id    DEFAULT     h   ALTER TABLE ONLY public.produks ALTER COLUMN id SET DEFAULT nextval('public.produks_id_seq'::regclass);
 9   ALTER TABLE public.produks ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            D           2604    25116    retur_pembelians id    DEFAULT     z   ALTER TABLE ONLY public.retur_pembelians ALTER COLUMN id SET DEFAULT nextval('public.retur_pembelians_id_seq'::regclass);
 B   ALTER TABLE public.retur_pembelians ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    228    228            B           2604    25100 	   returs id    DEFAULT     f   ALTER TABLE ONLY public.returs ALTER COLUMN id SET DEFAULT nextval('public.returs_id_seq'::regclass);
 8   ALTER TABLE public.returs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            >           2604    25054    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            F           2604    25131 	   stocks id    DEFAULT     f   ALTER TABLE ONLY public.stocks ALTER COLUMN id SET DEFAULT nextval('public.stocks_id_seq'::regclass);
 8   ALTER TABLE public.stocks ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229    230            ?           2604    25061    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            �          0    25044 
   migrations 
   TABLE DATA           :   COPY public.migrations (id, migration, batch) FROM stdin;
    public          postgres    false    216   lT       �          0    25076    personal_access_tokens 
   TABLE DATA           �   COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
    public          postgres    false    222   U       �          0    25088    produks 
   TABLE DATA           s   COPY public.produks (id, kode_barang, nama_produk, jenis_barang, harga_produk, created_at, updated_at) FROM stdin;
    public          postgres    false    224   6U                  0    25113    retur_pembelians 
   TABLE DATA           ~   COPY public.retur_pembelians (id, nota_retur_pembelian, retur_id, alasan_retur, tindakan, created_at, updated_at) FROM stdin;
    public          postgres    false    228   �U       �          0    25097    returs 
   TABLE DATA           �   COPY public.returs (id, produks_id, supplier, no_hp_supplier, alamat_supplier, tgl_masuk_gudang, jumlah_barang, kondisi_barang, created_at, updated_at) FROM stdin;
    public          postgres    false    226   V       �          0    25051    roles 
   TABLE DATA           F   COPY public.roles (id, nama_role, created_at, updated_at) FROM stdin;
    public          postgres    false    218   �V                 0    25128    stocks 
   TABLE DATA           y   COPY public.stocks (id, produk_id, retur_id, stok, stok_masuk, stok_keluar, tanggal, created_at, updated_at) FROM stdin;
    public          postgres    false    230   �V       �          0    25058    users 
   TABLE DATA           k   COPY public.users (id, username, email, password, id_role, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    220   1W                  0    0    migrations_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.migrations_id_seq', 7, true);
          public          postgres    false    215                       0    0    personal_access_tokens_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);
          public          postgres    false    221                       0    0    produks_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.produks_id_seq', 2, true);
          public          postgres    false    223                       0    0    retur_pembelians_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.retur_pembelians_id_seq', 1, true);
          public          postgres    false    227                       0    0    returs_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.returs_id_seq', 2, true);
          public          postgres    false    225                       0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 3, true);
          public          postgres    false    217                       0    0    stocks_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.stocks_id_seq', 2, true);
          public          postgres    false    229                       0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 3, true);
          public          postgres    false    219            I           2606    25049    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public            postgres    false    216            S           2606    25083 2   personal_access_tokens personal_access_tokens_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_pkey;
       public            postgres    false    222            U           2606    25086 :   personal_access_tokens personal_access_tokens_token_unique 
   CONSTRAINT     v   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);
 d   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_token_unique;
       public            postgres    false    222            X           2606    25095    produks produks_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.produks
    ADD CONSTRAINT produks_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.produks DROP CONSTRAINT produks_pkey;
       public            postgres    false    224            \           2606    25121 &   retur_pembelians retur_pembelians_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.retur_pembelians
    ADD CONSTRAINT retur_pembelians_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.retur_pembelians DROP CONSTRAINT retur_pembelians_pkey;
       public            postgres    false    228            Z           2606    25106    returs returs_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.returs
    ADD CONSTRAINT returs_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.returs DROP CONSTRAINT returs_pkey;
       public            postgres    false    226            K           2606    25056    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    218            ^           2606    25133    stocks stocks_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stocks_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.stocks DROP CONSTRAINT stocks_pkey;
       public            postgres    false    230            M           2606    25074    users users_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
       public            postgres    false    220            O           2606    25065    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    220            Q           2606    25072    users users_username_unique 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_unique UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_unique;
       public            postgres    false    220            V           1259    25084 8   personal_access_tokens_tokenable_type_tokenable_id_index    INDEX     �   CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);
 L   DROP INDEX public.personal_access_tokens_tokenable_type_tokenable_id_index;
       public            postgres    false    222    222            a           2606    25122 2   retur_pembelians retur_pembelians_retur_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.retur_pembelians
    ADD CONSTRAINT retur_pembelians_retur_id_foreign FOREIGN KEY (retur_id) REFERENCES public.returs(id);
 \   ALTER TABLE ONLY public.retur_pembelians DROP CONSTRAINT retur_pembelians_retur_id_foreign;
       public          postgres    false    228    4698    226            `           2606    25107     returs returs_produks_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.returs
    ADD CONSTRAINT returs_produks_id_foreign FOREIGN KEY (produks_id) REFERENCES public.produks(id);
 J   ALTER TABLE ONLY public.returs DROP CONSTRAINT returs_produks_id_foreign;
       public          postgres    false    4696    226    224            b           2606    25134    stocks stocks_produk_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stocks_produk_id_foreign FOREIGN KEY (produk_id) REFERENCES public.produks(id);
 I   ALTER TABLE ONLY public.stocks DROP CONSTRAINT stocks_produk_id_foreign;
       public          postgres    false    230    224    4696            c           2606    25139    stocks stocks_retur_id_foreign    FK CONSTRAINT        ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stocks_retur_id_foreign FOREIGN KEY (retur_id) REFERENCES public.returs(id);
 H   ALTER TABLE ONLY public.stocks DROP CONSTRAINT stocks_retur_id_foreign;
       public          postgres    false    226    4698    230            _           2606    25066    users users_id_role_foreign    FK CONSTRAINT     z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_id_role_foreign FOREIGN KEY (id_role) REFERENCES public.roles(id);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_id_role_foreign;
       public          postgres    false    220    4683    218            �   �   x�U�A� ��u9L3���.M&Hg�H��G�����o���ɢ���b�L�-�o��@4�@�	�w�=sjp8�|(��~���r�s�I\ykK#Kݵhm�2�׾6j+=�&3b�I\�.gl���D}oׅL������}��+�~GVb�      �      x������ � �      �   a   x�3��500�N�KI�Q.O���/W�s�Qpw���s�p��X��+X�Xc�2�k��X#���0�2��&����� �)�          N   x�3���6273657��4�4�tJ,J�KWHNLN,�t��N�MJ���N��4202�5��54W04�25�20�&����� ܲ|      �   �   x�m�1�0����+2*��]�d'���rPјb%�����
���K@�ǩ v��ێ��g(2 #7[t��E8H��Vz�ޘ%S��|�$E^��>I����r���U?����NS��u� Ϯ6��QםR�f1�      �   8   x�3�tL�����".#N�����<�Ҕļt��1L4 5/=�(37�>F��� ���         ?   x�3�4BS2�4202�5��54Gb*X�Xc�2�A�fS|����M��q��qqq �1�      �   �   x�e�Ko�@ ���;8/�"n]1���
�@���.�,OA��7m�1����� @�Wk����%����$#UN�Z2��n:/[�'C�̦%�Z��v�b�A��ԕ�� ������b�̽�:���if~g�x�8w�w5�ǆ:T���5r�8�܉i��S9�����h�9V�w\пKO��o�&s������j����b��LX=�Y}n빾*]�-�=��$��AbP     