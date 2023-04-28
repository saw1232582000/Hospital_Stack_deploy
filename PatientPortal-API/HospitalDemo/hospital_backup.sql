PGDMP     +                    {            hospital_api    15.2    15.2 T    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16398    hospital_api    DATABASE     �   CREATE DATABASE hospital_api WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE hospital_api;
                postgres    false                        3079    16404 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            �           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            �           1247    16585    gender_enum    TYPE     E   CREATE TYPE public.gender_enum AS ENUM (
    'male',
    'female'
);
    DROP TYPE public.gender_enum;
       public          postgres    false            x           1247    16535    printed_or_drafted_enum    TYPE     U   CREATE TYPE public.printed_or_drafted_enum AS ENUM (
    'printed',
    'drafted'
);
 *   DROP TYPE public.printed_or_drafted_enum;
       public          postgres    false            r           1247    16523 	   type_enum    TYPE     E   CREATE TYPE public.type_enum AS ENUM (
    'issue',
    'receive'
);
    DROP TYPE public.type_enum;
       public          postgres    false            �            1259    16727    RefreshToken    TABLE     �   CREATE TABLE public."RefreshToken" (
    "Token_id" character varying NOT NULL,
    "userName" character varying,
    refresh_token character varying,
    "isActive" boolean
);
 "   DROP TABLE public."RefreshToken";
       public         heap    postgres    false            �            1259    16734    User    TABLE     �   CREATE TABLE public."User" (
    id integer NOT NULL,
    username character varying,
    password character varying,
    role character varying
);
    DROP TABLE public."User";
       public         heap    postgres    false            �            1259    16487 	   UserLogin    TABLE     �   CREATE TABLE public."UserLogin" (
    "Id" uuid NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    role text NOT NULL
);
    DROP TABLE public."UserLogin";
       public         heap    postgres    false            �            1259    16475    __EFMigrationsHistory    TABLE     �   CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);
 +   DROP TABLE public."__EFMigrationsHistory";
       public         heap    postgres    false            �            1259    16685    alembic_version    TABLE     T   CREATE TABLE public.alembic_version (
    version_num character varying NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         heap    postgres    false            �            1259    16577    bill    TABLE     �  CREATE TABLE public.bill (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    patient_id integer,
    patient_name character varying NOT NULL,
    patient_phone character varying NOT NULL,
    total_amount integer NOT NULL,
    created_user_id integer,
    updated_user_id integer,
    printed_or_drafted character varying,
    patient_address character varying NOT NULL,
    is_cancelled boolean NOT NULL
);
    DROP TABLE public.bill;
       public         heap    postgres    false            �            1259    16613    billitem    TABLE     �  CREATE TABLE public.billitem (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    sales_service_item_id integer,
    name character varying NOT NULL,
    quantity integer NOT NULL,
    uom character varying,
    price integer NOT NULL,
    subtotal integer NOT NULL,
    remark character varying,
    created_user_id integer,
    updated_user_id integer,
    bill_id integer
);
    DROP TABLE public.billitem;
       public         heap    postgres    false            �            1259    16508    category    TABLE       CREATE TABLE public.category (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    name character varying NOT NULL,
    description character varying,
    created_user_id integer,
    updated_user_id integer
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    16630    closingbilldetail    TABLE       CREATE TABLE public.closingbilldetail (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    daily_closing_id integer,
    bill_id integer,
    amount integer,
    created_user_id integer,
    updated_user_id integer
);
 %   DROP TABLE public.closingbilldetail;
       public         heap    postgres    false            �            1259    16645    closingdepositdetail    TABLE        CREATE TABLE public.closingdepositdetail (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    daily_closing_id integer,
    deposit_id integer,
    amount integer,
    created_user_id integer,
    updated_user_id integer
);
 (   DROP TABLE public.closingdepositdetail;
       public         heap    postgres    false            �            1259    16558    dailyclosing    TABLE     �  CREATE TABLE public.dailyclosing (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    opening_balance integer NOT NULL,
    deposit_total integer NOT NULL,
    bill_total integer NOT NULL,
    grand_total integer NOT NULL,
    actual_amount integer NOT NULL,
    adjusted_amount integer NOT NULL,
    adjusted_reason character varying NOT NULL,
    created_user_id integer,
    updated_user_id integer
);
     DROP TABLE public.dailyclosing;
       public         heap    postgres    false            �            1259    16601    deposit    TABLE     ?  CREATE TABLE public.deposit (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    patient_id integer,
    amount integer NOT NULL,
    created_user_id integer,
    updated_user_id integer,
    remark character varying,
    is_cancelled boolean NOT NULL
);
    DROP TABLE public.deposit;
       public         heap    postgres    false            �            1259    16670    depositused    TABLE     F  CREATE TABLE public.depositused (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    deposit_id integer,
    payment_id integer,
    created_user_id integer,
    updated_user_id integer,
    unpaid_amount integer NOT NULL,
    deposit_amount integer NOT NULL
);
    DROP TABLE public.depositused;
       public         heap    postgres    false            �            1259    16515    inventoryitem    TABLE     �  CREATE TABLE public.inventoryitem (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    name character varying NOT NULL,
    balance integer NOT NULL,
    unit character varying NOT NULL,
    purchasing_price integer NOT NULL,
    sales_service_item_id integer,
    expiry_date date,
    batch character varying NOT NULL,
    created_user_id integer,
    updated_user_id integer,
    is_active boolean NOT NULL
);
 !   DROP TABLE public.inventoryitem;
       public         heap    postgres    false            �            1259    16565    inventorytransaction    TABLE     �  CREATE TABLE public.inventorytransaction (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    inventory_item_id integer,
    inventory_item_name character varying NOT NULL,
    transaction_type_name character varying NOT NULL,
    quantity integer NOT NULL,
    unit character varying NOT NULL,
    purchasing_price integer NOT NULL,
    selling_price integer NOT NULL,
    note character varying,
    created_user_id integer,
    updated_user_id integer,
    opening_balance integer NOT NULL,
    closing_balance integer NOT NULL,
    transaction_type character varying NOT NULL
);
 (   DROP TABLE public.inventorytransaction;
       public         heap    postgres    false            �            1259    16589    patient    TABLE     �  CREATE TABLE public.patient (
    id integer NOT NULL,
    name character varying NOT NULL,
    gender character varying,
    date_of_birth date,
    age integer NOT NULL,
    address character varying NOT NULL,
    contact_details character varying NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    created_user_id integer,
    updated_user_id integer
);
    DROP TABLE public.patient;
       public         heap    postgres    false            �            1259    16660    payment    TABLE     �  CREATE TABLE public.payment (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    bill_id integer,
    total_amount integer NOT NULL,
    total_deposit_amount integer NOT NULL,
    collected_amount integer NOT NULL,
    created_user_id integer,
    updated_user_id integer,
    unpaid_amount integer NOT NULL,
    is_outstanding boolean
);
    DROP TABLE public.payment;
       public         heap    postgres    false            �            1259    16539    salesserviceitem    TABLE     E  CREATE TABLE public.salesserviceitem (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    name character varying,
    price integer,
    uom_id integer,
    category_id integer,
    created_user_id integer,
    updated_user_id integer,
    is_active boolean
);
 $   DROP TABLE public.salesserviceitem;
       public         heap    postgres    false            �            1259    16527    transactiontype    TABLE       CREATE TABLE public.transactiontype (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    name character varying NOT NULL,
    type character varying NOT NULL,
    created_user_id integer,
    updated_user_id integer
);
 #   DROP TABLE public.transactiontype;
       public         heap    postgres    false            �            1259    16501    uom    TABLE       CREATE TABLE public.uom (
    id integer NOT NULL,
    created_time timestamp with time zone,
    updated_time timestamp with time zone,
    name character varying NOT NULL,
    description character varying,
    created_user_id integer,
    updated_user_id integer
);
    DROP TABLE public.uom;
       public         heap    postgres    false            �          0    16727    RefreshToken 
   TABLE DATA           [   COPY public."RefreshToken" ("Token_id", "userName", refresh_token, "isActive") FROM stdin;
    public          postgres    false    233   �w       �          0    16734    User 
   TABLE DATA           >   COPY public."User" (id, username, password, role) FROM stdin;
    public          postgres    false    234   +x       �          0    16487 	   UserLogin 
   TABLE DATA           E   COPY public."UserLogin" ("Id", username, password, role) FROM stdin;
    public          postgres    false    216   ux       �          0    16475    __EFMigrationsHistory 
   TABLE DATA           R   COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
    public          postgres    false    215   �x       �          0    16685    alembic_version 
   TABLE DATA           6   COPY public.alembic_version (version_num) FROM stdin;
    public          postgres    false    232   Ly       �          0    16577    bill 
   TABLE DATA           �   COPY public.bill (id, created_time, updated_time, patient_id, patient_name, patient_phone, total_amount, created_user_id, updated_user_id, printed_or_drafted, patient_address, is_cancelled) FROM stdin;
    public          postgres    false    224   iy       �          0    16613    billitem 
   TABLE DATA           �   COPY public.billitem (id, created_time, updated_time, sales_service_item_id, name, quantity, uom, price, subtotal, remark, created_user_id, updated_user_id, bill_id) FROM stdin;
    public          postgres    false    227   �z       �          0    16508    category 
   TABLE DATA           w   COPY public.category (id, created_time, updated_time, name, description, created_user_id, updated_user_id) FROM stdin;
    public          postgres    false    218   U{       �          0    16630    closingbilldetail 
   TABLE DATA           �   COPY public.closingbilldetail (id, created_time, updated_time, daily_closing_id, bill_id, amount, created_user_id, updated_user_id) FROM stdin;
    public          postgres    false    228   !|       �          0    16645    closingdepositdetail 
   TABLE DATA           �   COPY public.closingdepositdetail (id, created_time, updated_time, daily_closing_id, deposit_id, amount, created_user_id, updated_user_id) FROM stdin;
    public          postgres    false    229   u|       �          0    16558    dailyclosing 
   TABLE DATA           �   COPY public.dailyclosing (id, created_time, updated_time, opening_balance, deposit_total, bill_total, grand_total, actual_amount, adjusted_amount, adjusted_reason, created_user_id, updated_user_id) FROM stdin;
    public          postgres    false    222   �|       �          0    16601    deposit 
   TABLE DATA           �   COPY public.deposit (id, created_time, updated_time, patient_id, amount, created_user_id, updated_user_id, remark, is_cancelled) FROM stdin;
    public          postgres    false    226   /}       �          0    16670    depositused 
   TABLE DATA           �   COPY public.depositused (id, created_time, updated_time, deposit_id, payment_id, created_user_id, updated_user_id, unpaid_amount, deposit_amount) FROM stdin;
    public          postgres    false    231   ~       �          0    16515    inventoryitem 
   TABLE DATA           �   COPY public.inventoryitem (id, created_time, updated_time, name, balance, unit, purchasing_price, sales_service_item_id, expiry_date, batch, created_user_id, updated_user_id, is_active) FROM stdin;
    public          postgres    false    219   j~       �          0    16565    inventorytransaction 
   TABLE DATA             COPY public.inventorytransaction (id, created_time, updated_time, inventory_item_id, inventory_item_name, transaction_type_name, quantity, unit, purchasing_price, selling_price, note, created_user_id, updated_user_id, opening_balance, closing_balance, transaction_type) FROM stdin;
    public          postgres    false    223   �       �          0    16589    patient 
   TABLE DATA           �   COPY public.patient (id, name, gender, date_of_birth, age, address, contact_details, created_time, updated_time, created_user_id, updated_user_id) FROM stdin;
    public          postgres    false    225   D�       �          0    16660    payment 
   TABLE DATA           �   COPY public.payment (id, created_time, updated_time, bill_id, total_amount, total_deposit_amount, collected_amount, created_user_id, updated_user_id, unpaid_amount, is_outstanding) FROM stdin;
    public          postgres    false    230   T�       �          0    16539    salesserviceitem 
   TABLE DATA           �   COPY public.salesserviceitem (id, created_time, updated_time, name, price, uom_id, category_id, created_user_id, updated_user_id, is_active) FROM stdin;
    public          postgres    false    221   ��       �          0    16527    transactiontype 
   TABLE DATA           w   COPY public.transactiontype (id, created_time, updated_time, name, type, created_user_id, updated_user_id) FROM stdin;
    public          postgres    false    220   H�       �          0    16501    uom 
   TABLE DATA           r   COPY public.uom (id, created_time, updated_time, name, description, created_user_id, updated_user_id) FROM stdin;
    public          postgres    false    217   ܃       �           2606    16493    UserLogin PK_UserLogin 
   CONSTRAINT     Z   ALTER TABLE ONLY public."UserLogin"
    ADD CONSTRAINT "PK_UserLogin" PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY public."UserLogin" DROP CONSTRAINT "PK_UserLogin";
       public            postgres    false    216            �           2606    16479 .   __EFMigrationsHistory PK___EFMigrationsHistory 
   CONSTRAINT     {   ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");
 \   ALTER TABLE ONLY public."__EFMigrationsHistory" DROP CONSTRAINT "PK___EFMigrationsHistory";
       public            postgres    false    215            �           2606    16733    RefreshToken RefreshToken_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."RefreshToken"
    ADD CONSTRAINT "RefreshToken_pkey" PRIMARY KEY ("Token_id");
 L   ALTER TABLE ONLY public."RefreshToken" DROP CONSTRAINT "RefreshToken_pkey";
       public            postgres    false    233            �           2606    16740    User User_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    234            �           2606    16691 $   alembic_version alembic_version_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkey PRIMARY KEY (version_num);
 N   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkey;
       public            postgres    false    232            �           2606    16583    bill bill_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.bill DROP CONSTRAINT bill_pkey;
       public            postgres    false    224            �           2606    16619    billitem billitem_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.billitem
    ADD CONSTRAINT billitem_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.billitem DROP CONSTRAINT billitem_pkey;
       public            postgres    false    227            �           2606    16514    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    218            �           2606    16634 (   closingbilldetail closingbilldetail_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.closingbilldetail
    ADD CONSTRAINT closingbilldetail_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.closingbilldetail DROP CONSTRAINT closingbilldetail_pkey;
       public            postgres    false    228            �           2606    16649 .   closingdepositdetail closingdepositdetail_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.closingdepositdetail
    ADD CONSTRAINT closingdepositdetail_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.closingdepositdetail DROP CONSTRAINT closingdepositdetail_pkey;
       public            postgres    false    229            �           2606    16564    dailyclosing dailyclosing_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.dailyclosing
    ADD CONSTRAINT dailyclosing_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.dailyclosing DROP CONSTRAINT dailyclosing_pkey;
       public            postgres    false    222            �           2606    16607    deposit deposit_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.deposit
    ADD CONSTRAINT deposit_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.deposit DROP CONSTRAINT deposit_pkey;
       public            postgres    false    226            �           2606    16674    depositused depositused_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.depositused
    ADD CONSTRAINT depositused_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.depositused DROP CONSTRAINT depositused_pkey;
       public            postgres    false    231            �           2606    16521     inventoryitem inventoryitem_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.inventoryitem
    ADD CONSTRAINT inventoryitem_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.inventoryitem DROP CONSTRAINT inventoryitem_pkey;
       public            postgres    false    219            �           2606    16571 .   inventorytransaction inventorytransaction_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.inventorytransaction
    ADD CONSTRAINT inventorytransaction_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.inventorytransaction DROP CONSTRAINT inventorytransaction_pkey;
       public            postgres    false    223            �           2606    16595    patient patient_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.patient DROP CONSTRAINT patient_pkey;
       public            postgres    false    225            �           2606    16664    payment payment_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_pkey;
       public            postgres    false    230            �           2606    16545 &   salesserviceitem salesserviceitem_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.salesserviceitem
    ADD CONSTRAINT salesserviceitem_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.salesserviceitem DROP CONSTRAINT salesserviceitem_pkey;
       public            postgres    false    221            �           2606    16533 $   transactiontype transactiontype_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.transactiontype
    ADD CONSTRAINT transactiontype_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.transactiontype DROP CONSTRAINT transactiontype_pkey;
       public            postgres    false    220            �           2606    16507    uom uom_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.uom
    ADD CONSTRAINT uom_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.uom DROP CONSTRAINT uom_pkey;
       public            postgres    false    217            �           1259    16552 %   fki_salesserviceitem_category_id_fkey    INDEX     i   CREATE INDEX fki_salesserviceitem_category_id_fkey ON public.salesserviceitem USING btree (category_id);
 9   DROP INDEX public.fki_salesserviceitem_category_id_fkey;
       public            postgres    false    221            �           2606    16596    bill bill_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patient(id) NOT VALID;
 C   ALTER TABLE ONLY public.bill DROP CONSTRAINT bill_patient_id_fkey;
       public          postgres    false    225    224    3290            �           2606    16620    billitem billitem_bill_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.billitem
    ADD CONSTRAINT billitem_bill_id_fkey FOREIGN KEY (bill_id) REFERENCES public.bill(id) NOT VALID;
 H   ALTER TABLE ONLY public.billitem DROP CONSTRAINT billitem_bill_id_fkey;
       public          postgres    false    224    3288    227            �           2606    16625 ,   billitem billitem_sales_service_item_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.billitem
    ADD CONSTRAINT billitem_sales_service_item_id_fkey FOREIGN KEY (sales_service_item_id) REFERENCES public.salesserviceitem(id) NOT VALID;
 V   ALTER TABLE ONLY public.billitem DROP CONSTRAINT billitem_sales_service_item_id_fkey;
       public          postgres    false    221    3282    227            �           2606    16635 0   closingbilldetail closingbilldetail_bill_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.closingbilldetail
    ADD CONSTRAINT closingbilldetail_bill_id_fkey FOREIGN KEY (bill_id) REFERENCES public.bill(id) NOT VALID;
 Z   ALTER TABLE ONLY public.closingbilldetail DROP CONSTRAINT closingbilldetail_bill_id_fkey;
       public          postgres    false    228    224    3288            �           2606    16640 9   closingbilldetail closingbilldetail_daily_closing_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.closingbilldetail
    ADD CONSTRAINT closingbilldetail_daily_closing_id_fkey FOREIGN KEY (daily_closing_id) REFERENCES public.dailyclosing(id) NOT VALID;
 c   ALTER TABLE ONLY public.closingbilldetail DROP CONSTRAINT closingbilldetail_daily_closing_id_fkey;
       public          postgres    false    222    228    3284            �           2606    16650 ?   closingdepositdetail closingdepositdetail_daily_closing_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.closingdepositdetail
    ADD CONSTRAINT closingdepositdetail_daily_closing_id_fkey FOREIGN KEY (daily_closing_id) REFERENCES public.dailyclosing(id) NOT VALID;
 i   ALTER TABLE ONLY public.closingdepositdetail DROP CONSTRAINT closingdepositdetail_daily_closing_id_fkey;
       public          postgres    false    222    229    3284            �           2606    16655 9   closingdepositdetail closingdepositdetail_deposit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.closingdepositdetail
    ADD CONSTRAINT closingdepositdetail_deposit_id_fkey FOREIGN KEY (deposit_id) REFERENCES public.deposit(id) NOT VALID;
 c   ALTER TABLE ONLY public.closingdepositdetail DROP CONSTRAINT closingdepositdetail_deposit_id_fkey;
       public          postgres    false    3292    229    226            �           2606    16608    deposit deposit_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.deposit
    ADD CONSTRAINT deposit_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patient(id) NOT VALID;
 I   ALTER TABLE ONLY public.deposit DROP CONSTRAINT deposit_patient_id_fkey;
       public          postgres    false    225    3290    226            �           2606    16675 '   depositused depositused_deposit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.depositused
    ADD CONSTRAINT depositused_deposit_id_fkey FOREIGN KEY (deposit_id) REFERENCES public.deposit(id) NOT VALID;
 Q   ALTER TABLE ONLY public.depositused DROP CONSTRAINT depositused_deposit_id_fkey;
       public          postgres    false    3292    226    231            �           2606    16680 '   depositused depositused_payment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.depositused
    ADD CONSTRAINT depositused_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES public.payment(id) NOT VALID;
 Q   ALTER TABLE ONLY public.depositused DROP CONSTRAINT depositused_payment_id_fkey;
       public          postgres    false    231    230    3300            �           2606    16572 @   inventorytransaction inventorytransaction_inventory_item_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransaction
    ADD CONSTRAINT inventorytransaction_inventory_item_id_fkey FOREIGN KEY (inventory_item_id) REFERENCES public.inventoryitem(id) NOT VALID;
 j   ALTER TABLE ONLY public.inventorytransaction DROP CONSTRAINT inventorytransaction_inventory_item_id_fkey;
       public          postgres    false    3277    223    219            �           2606    16665    payment payment_bill_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_bill_id_fkey FOREIGN KEY (bill_id) REFERENCES public.bill(id) NOT VALID;
 F   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_bill_id_fkey;
       public          postgres    false    230    224    3288            �           2606    16547 2   salesserviceitem salesserviceitem_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.salesserviceitem
    ADD CONSTRAINT salesserviceitem_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id) NOT VALID;
 \   ALTER TABLE ONLY public.salesserviceitem DROP CONSTRAINT salesserviceitem_category_id_fkey;
       public          postgres    false    221    3275    218            �           2606    16553 -   salesserviceitem salesserviceitem_uom_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.salesserviceitem
    ADD CONSTRAINT salesserviceitem_uom_id_fkey FOREIGN KEY (uom_id) REFERENCES public.uom(id) NOT VALID;
 W   ALTER TABLE ONLY public.salesserviceitem DROP CONSTRAINT salesserviceitem_uom_id_fkey;
       public          postgres    false    221    217    3273            �   �   x�3�421�41���,N,�t�u	���(�
󰴨L����
I��r4/r�Վ���p+1�p�(2��,�24�05�0653�,����/K��
L61),�q��2	K/�N6L�
�.r��ps	�N����� �=&A      �   :   x�3�,N,�442615�LL����2�,���4����U\R�X�_� �C�c���� ��      �   B   x�3NK�0M33�5574�5153�M2NK�5J�43N33KLK4�,N,�442�r&��f�q��qqq ª�      �   u   x���K
�0 е����$ƺv[�u'�AB:�|H�^��^<��1�EKy���\׭�,A����˦�@�c���l���f$���i�}�I�s��1KI�Z�g.7�񧻃1f�p/      �      x������ � �      �   l  x���Kn�0�9�*�x~�����-IZ%�(U�}��6�$B ,���y��APH�J	>2Gb�-��`#M�kK�C��z;n7�q_W��lZT]�l�
���2}A,��\�l"�� x����]4A{��Ժ[)$N�i <k����Z�TͺmN��K5W�D1QH��yʹq@�^�����>T��%h�R�i���޶��#N=��^}���zW}n�{�K3��j�j[}'��KC�i�H�8L�Q��U�՗Z��V�/�ˋF2:�2ٺ{�9���E|��0#�V��9%�(+ο��<���F`V�|_�a���w�i`Na��b�L��Em�#4����`��;ش���J���UE�����      �   `   x�E�;
�0D��)��0�OBrAA;���*df�Ǽ̉,db��%d��-��~����H�]�l�%�ڹ.u[?xW������D���s7v�6      �   �   x�m�1n�0��Y:�����(�<K� r�,q��Co_75��-���GJ�4 d�XC�E�U}A��-�4 [��%r��܂�i������ђƬ����f�Q��e��:4r�[1�T"*$�G��&�*�Ҷ���O���*O�������'~�āOX_������?� L�:�>=���m�������K�      �   D   x�uʹ�0�X�����t��������������,x�gWu؍<�ߐ�+����LU}=I�      �   B   x�uʱ� �ڞ"}z�m̒��H
Z�+O#��
TW��V)��їp1wh�� �
�����S?      �   X   x�]�!�0PݝO������,��p��`�z�B��R��6Ћ��6��{�03��Vy!�Jf�����uL!m%�� ��f      �   �   x����J�0��u��KÙ�Lg&��F��BT�����ܴi����C���x)2WP%�^���q7(�Sa�о�������b���I�PU�f��ܸ���s���ח���[�U�fkU��f�UO�>� 
z}��K��Z)7�8�����	ϝs��)Ȭ ;\~�;=�D'�ׄ��������1�|�Ox�q,�������cN)� �"��      �   C   x�uʱ�0�X�����y�-�Z��2w����h�q�RW#O�
�����h�I{���4��      �   ,  x����N� ���)�7����Y\�ܘ.��Z�_z[��mbY@�a��3#h��8G��W�$��	�2��3jU��DA�,��q;~a��#�{^0@[����ˌ\	*Z"��2{�3�gQ����Jw/��z]�_l1z�*��-?���R�%�(�K����c���T���(���f-�6�?�,c�\�n�K��tOK�3l��9H���tH'+��/@w9CJ�Ҧ,�2�O�W_?o���嫷�;���f�1@���m��RY�����n�Z�i���u�m;c��=�9M��&V�1      �   �   x�u��
�@��٧�]vI2I�Y<n��V|}��Ed ��G>�RVDFTkD�Yf���q�6���v &--�Be!`oP��+�(��� ��E�i��=���_���m�B��R�Uf�in�y�y��-�\�9�^T1f      �      x�u�M��0���ާ��?Yj���"� U٨�085�L��i;���^Y���^�&2��r蛭;�}� Z��б������;$nAZ�8�d�<G	$���s7v*V�<H�.�[I�np�~�j?!r�W K�f�Cʔ<0r�E� ��vQ�h1�;���}wtW`��Rg�
(�1#�$���Hыp�X����0���%S��g9?�v����l<h0d��sG��nMأF�h	��~����-����,M�AہxM�����$_3ۅb�b�xl}_�������I��i���$fPぽ^зX0�K����s���R�b�K����q&�!�����
y�0r�#0mDP��#�[9�˾��J>oe��O�af��%��0�.G����֫�cVo�⿎cNO'���E�2�B���[�X�� 9A��!����|�L#C�1������>�����D]���V��HDq��q���� �M�W�ܴ=SP| �q�33������/�	�      �   H   x�u�A
�0��+�K�f7�ط���E����Q��A���1US�<k�X��a�7(�2*^c�J��Ww��U9      �   �   x�uα
�0������椓���ҵC�N��S\(%�&��Ct
e�%������f�o(�,����y<^rG�#G,�kʤ�a�[��˩��E���ko�@ AF���iW榤�2K+V��qN{��*~�1��f6�      �   �   x�u�=�0�99Ev��'�����])p~*�J���{�]-D34�%�a:���5�l�b�[�'nC| TJ��{�aY����N@Ժ�_щ�lGQ�}�����vR�b�T͞��@'�o�ì__^)���/2q      �   �   x�}��j�0���)r/��ȇ�;�=��K���P]v�������J!���23�,J�d�
���E�?��M��io��e�������r9ư7wI�av= �	�
E�e������a�"ָ���ڒNƅk��s�s`��+:��ڞ�����X�8��8���M�0~u7�GoV��0!����3�g}�\��
㟭���~��ӥ��7�{ ���tO>ԇxͰK������U`bޝ1�||T     