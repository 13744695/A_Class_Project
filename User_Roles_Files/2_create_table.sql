-- tables & sequences are created here by dt


-- Item Category table
CREATE TABLE category
(
    id    number(10)      CONSTRAINT category_id_pk PRIMARY KEY,   
    name  varchar2(40)    CONSTRAINT category_name_nn NOT NULL
);

-- for suppliers table
CREATE TABLE supplier
(
    id         number(10)      CONSTRAINT supplier_id_pk PRIMARY KEY,  
    name       varchar2(50)    CONSTRAINT supplier_name_nn NOT NULL,
    address    varchar2(100),
    phone1     number(10),
    phone2     number(10),
    phone3     number(10),
    email1     varchar2(70),
    email2     varchar2(70),
    email3    varchar2(70)
);

-- for stock item details table
CREATE TABLE item
(
    id             number(10)   CONSTRAINT item_id_pk PRIMARY KEY,        
    supp_id        number(10)   CONSTRAINT item_supp_id_fk REFERENCES supplier(id),
    cat_id      number(10)   CONSTRAINT item_cat_id_fk REFERENCES category(id),
    name           varchar2(60) CONSTRAINT item_name_nn NOT NULL,
    desc1          varchar2(1000),
    desc2          varchar2(1000),
    sale_price     number(10),      -- not always known
    purch_price    number(10)       -- not always known  
);

--for dimensions table
CREATE TABLE dimensions
(
    id          number(10) CONSTRAINT dimensions_id_pk PRIMARY KEY,
    item_id     number(10) CONSTRAINT dimensions_item_id_fk REFERENCES item(id),
    size_h      number(10),
    size_w      number(10),
    size_l      number(10)
);


create sequence supplier_id_seq nocache;
