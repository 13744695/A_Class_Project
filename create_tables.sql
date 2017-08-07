--------------------------------------------------------------------------------
/*
_________________

TABLE OF CONTENTS
_________________

CREATE TABLE category
CREATE TABLE supplier
CREATE TABLE item
CREATE TABLE dimensions
CREATE TABLE availability
*/
--------------------------------------------------------------------------------

-- for item category table 
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

-- for stock items table
CREATE TABLE item
(
    id             number(10)   CONSTRAINT item_id_pk PRIMARY KEY,        
    supp_id        number(10)   CONSTRAINT item_supp_id_fk REFERENCES supplier(id),
    cat_id         number(10)   CONSTRAINT item_cat_id_nn NOT NULL CONSTRAINT item_cat_id_fk REFERENCES category(id),
    name           varchar2(60) CONSTRAINT item_name_nn NOT NULL,
    desc1          varchar2(1000),
    desc2          varchar2(1000),
    sale_price     number(10),      -- not always known
    purch_price    number(10)       -- not always known  
);


--for stock item dimensions table -- no primary key. Each dimension is directly related to one stock item only.
CREATE TABLE dimensions
(
    item_id     number(10) CONSTRAINT dimensions_item_id_fk REFERENCES item(id),
    size_h      number(10),
    size_w      number(10),
    size_l      number(10),
    size_gen    varchar2(40),
    weight      number(10)
);


--for availability table  -- no primary key. Each dimension is directly related to one stock item only.
CREATE TABLE availability
( 
    item_id         number(10) CONSTRAINT availability_item_id_fk REFERENCES item(id),
    qty             number(10) CONSTRAINT availability_qty_nn NOT NULL,
    due_date_UK     DATE,
    due_date_IRE    DATE
);


