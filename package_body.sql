/*
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
 TABLE OF CONTENTS:
    -- 3 procedures named add_supplier -OVERLOADED to take either 1,2 or 3 of each of phone numbers & emails. 
    -- 1 procedure named add_category 
    -- 2 procedures named add_item -OVERLOADED to take all parameters or all except an optional second description. 
    -- 1 procedure names add_dimensions
    -- 2 procedures named add_availability_info - OVERLOADED to take 2 or 4 parameters. (with or without due dates)
    -- function to show margin on items. Calculates the difference between selling and purchase price 
    -- function to teturn number of items that belong to a particular category.
    
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
*/

CREATE OR REPLACE PACKAGE BODY package_dt IS

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Add suppliers~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--




--insert new supplier into supplier table w 1 phone num & 1 email

    PROCEDURE add_supplier (
        p_name      supplier.name%TYPE,
        p_address   supplier.address%TYPE,
        p_phone1    supplier.phone1%TYPE,
        p_email1    supplier.email1%TYPE
    )
        IS
    BEGIN
        INSERT INTO supplier (id, name, address, phone1, email1) 
        VALUES (supplier_id_seq.NEXTVAL, p_name, p_address, p_phone1, p_email1);

        dbms_output.put_line('Inserted ' || SQL%rowcount || ' supplier      using 4 param version of OVERLOADED add_supplier procedure');
    END add_supplier;





--insert new supplier into supplier table w 2 phone num & 2 email

    PROCEDURE add_supplier (
        p_name      supplier.name%TYPE,
        p_address   supplier.address%TYPE,
        p_phone1    supplier.phone1%TYPE,
        p_phone2    supplier.phone2%TYPE,
        p_email1    supplier.email1%TYPE,
        p_email2    supplier.email2%TYPE
    )
        IS
    BEGIN
        INSERT INTO supplier (id, name, address, phone1, phone2, email1, email2) 
        VALUES (supplier_id_seq.NEXTVAL, p_name, p_address, p_phone1, p_phone2, p_email1, p_email2);

        dbms_output.put_line('Inserted ' || SQL%rowcount || ' supplier      using 6 param version of OVERLOADED add_supplier procedure');
    END add_supplier;






--insert new supplier into supplier table  w 3 phone num & 3 email

    PROCEDURE add_supplier (
        p_name      supplier.name%TYPE,
        p_address   supplier.address%TYPE,
        p_phone1    supplier.phone1%TYPE,
        p_phone2    supplier.phone2%TYPE,
        p_phone3    supplier.phone3%TYPE,
        p_email1    supplier.email1%TYPE,
        p_email2    supplier.email2%TYPE,
        p_email3    supplier.email3%TYPE
    )
        IS
    BEGIN
        INSERT INTO supplier (id, name, address, phone1, phone2, phone3, email1, email2, email3) 
        VALUES (supplier_id_seq.NEXTVAL, p_name, p_address, p_phone1, p_phone2, p_phone3, p_email1, p_email2, p_email3);

        dbms_output.put_line('Inserted ' || SQL%rowcount || ' supplier      using 8 param version of OVERLOADED add_supplier procedure');
    END add_supplier;





--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~add categories~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--




--procedure to add item categories to category table

    PROCEDURE add_category (
        p_name    category.name%type
    )
        IS
    BEGIN
        INSERT INTO category (id, name)
        VALUES (category_id_seq.NEXTVAL, p_name);
        
        dbms_output.put_line('Inserted ' || SQL%rowcount || ' category');
    END add_category;
        



--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~add items~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--




-- input item into item table when all parametres are in use

    PROCEDURE add_item (
        p_supp_id       item.supp_id%TYPE,
        p_cat_id        item.cat_id%TYPE,
        p_name          item.name%TYPE,
        p_desc1         item.desc1%TYPE,
        p_desc2         item.desc2%TYPE,
        p_sale_price    item.sale_price%TYPE,
        p_purch_price   item.purch_price%TYPE
    )
        IS
    BEGIN
        INSERT INTO item (id, supp_id, cat_id, name, desc1, desc2, sale_price, purch_price) 
        VALUES (item_id_seq.NEXTVAL, p_supp_id, p_cat_id, p_name, p_desc1, p_desc2, p_sale_price, p_purch_price);

        dbms_output.put_line('Inserted ' || SQL%rowcount || ' item row      using 7 param version of OVERLOADED add_item procedure');
    END add_item;
 
 
 
  
-- overloading procedure to accept items when only one description is provided

    PROCEDURE add_item (
        p_supp_id       item.supp_id%TYPE,
        p_cat_id        item.cat_id%TYPE,
        p_name          item.name%TYPE,
        p_desc1         item.desc1%TYPE,
        p_sale_price    item.sale_price%TYPE,
        p_purch_price   item.purch_price%TYPE
    )
        IS
    BEGIN
        INSERT INTO item (id, supp_id, cat_id, name, desc1, sale_price, purch_price) 
        VALUES (item_id_seq.NEXTVAL, p_supp_id, p_cat_id, p_name, p_desc1, p_sale_price, p_purch_price);

        dbms_output.put_line('Inserted ' || SQL%rowcount || ' item row     using 6 param version of OVERLOADED add_item procedure');
    END add_item;
  
  
  
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~add dimensions~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
 
 
 
 -- input dimensions for item into dimensions table
 
    PROCEDURE add_dimensions (
        p_item_id       dimensions.item_id%type,
        p_size_h        dimensions.size_h%type,
        p_size_w        dimensions.size_w%type,
        p_size_l        dimensions.size_l%type,
        p_size_gen      dimensions.size_gen%type,
        p_weight        dimensions.weight%type
    )
        IS
    BEGIN
        INSERT INTO dimensions (item_id, size_h, size_w, size_l, size_gen, weight)
        VALUES (p_item_id, p_size_h, p_size_w, p_size_l, p_size_gen, p_weight);
 
        dbms_output.put_line('Inserted ' || SQL%rowcount || ' dimensions row      using add_dimensions procedure');
    END add_dimensions;


  
    --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~add to availabity~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
 
 
 
 -- input availabilty for item into availability table
 
    PROCEDURE add_availability_info (
        p_item_id           availability.item_id%type,
        p_qty               availability.qty%type,
        p_due_date_uk       availability.due_date_uk%type,
        p_due_date_ire      availability.due_date_uk%type
    )
        IS
    BEGIN
        INSERT INTO availability (item_id, qty, due_date_uk, due_date_ire)
        VALUES (p_item_id, p_qty, p_due_date_uk, p_due_date_ire);
 
        dbms_output.put_line('Inserted ' || SQL%rowcount || ' availability row      using add_availability_info procedure');
    END add_availability_info;


  
 -- input availabilty for item into availability table
 
    PROCEDURE add_availability_info (
        p_item_id           availability.item_id%type,
        p_qty               availability.qty%type
    )
        IS
    BEGIN
        INSERT INTO availability (item_id, qty)
        VALUES (p_item_id, p_qty);
 
        dbms_output.put_line('Inserted ' || SQL%rowcount || ' availability row      using add_availability_info procedure');
    END add_availability_info;


----------------------------------------------------------------------------------------------------------------------------------
    FUNCTION item_count(p_cat_id NUMBER) RETURN NUMBER AS count_cat_items NUMBER(6) := 0;
    BEGIN
           DBMS_OUTPUT.PUT_LINE('item_count function was called');
           SELECT count(id)  INTO count_cat_items
           FROM   item i
           WHERE  i.cat_id = p_cat_id;
           RETURN (count_cat_items);
    END item_count;

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~function to return difference between two numbers~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-- 
-- for use in getting diff between cost and selling price.
   
    FUNCTION calc_diff(cost_price NUMBER, sale_price NUMBER) RETURN NUMBER AS margin NUMBER;
     
      BEGIN
        margin:=sale_price - cost_price;
        DBMS_OUTPUT.PUT_LINE('calc_diff function was called, the difference between the numbers given is:  '|| margin || '  in Euro');
        RETURN margin;
        
    END calc_diff;


END package_dt;
/