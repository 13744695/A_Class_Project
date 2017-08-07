--------------------------------------------------------------------------------
/*
_________________

TABLE OF CONTENTS
_________________

Many insert statements to insert rows into tables using procedures some of which are overloaded, from the project package_dt
1 * update sql statement used to demonstrate use of triggers - both print_action and item_log triggers

*/
--------------------------------------------------------------------------------



BEGIN

DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------');
DBMS_OUTPUT.PUT_LINE('Inserts into supplier table confirmed below');
DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------');
--using overloaded procedure - insert into supplier table using the following params 
--VALUES(supplier_id_seq.NEXTVAL, p_name, p_address, p_phone1, p_email1);
    package_dt.add_supplier('Dave Supplies', 'Monaco', 2237977, 'dave@davesupplies.mon');
--using overloaded procedure - insert into supplier table using the following params 
--VALUES(supplier_id_seq.NEXTVAL, p_name, p_address, p_phone1, p_phone2, p_email1, p_email2);
    package_dt.add_supplier('Rachel Supplies', 'The Far East', 2234567, 2234566, 'rachel@rachelsupplies.fe', 'info@rachelssupplies.fe');   
--using overloaded procedure - insert into supplier table using the following params 
--VALUES(p_name, p_address, p_phone1, p_phone2, p_phone3, p_email1, p_email2, p_email3);
    package_dt.add_supplier('Chris Supplies', 'The Philapines', 1234567, 1234566, 1234568, 'chris@chrissupplies.ph', 'info@chrissupplies.ph', 'Accounts@chrissupplies.ph');

DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------');
DBMS_OUTPUT.PUT_LINE('Inserts into category table confirmed below');
DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------');
--using add_category procedure to insert new categories in table
--VALUES (category_id_seq.NEXTVAL, p_name);
    package_dt.add_category('Americana');
    package_dt.add_category('Seasonal');
    package_dt.add_category('Jurassica');
    package_dt.add_category('Sports');
    package_dt.add_category('Animals');
    package_dt.add_category('Musicians');

DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------');
DBMS_OUTPUT.PUT_LINE('Inserts into item table confirmed below');
DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------');
-- using overloaded procedure -insert into item table using the following params 
-- VALUES(item_id_seq.NEXTVAL, p_supp_id, p_cat_id, p_name, p_desc1, p_desc2, p_sale_price, p_purch_price);    
    package_dt.add_item(1, 1, 'chevy sofa', 'An American flag themed sofa thats sure to bring a smile','indoor and outdoor use', 1000, 700);
    package_dt.add_item(1, 1, 'Marilyn Monroe', 'Actress sitting in wall decor bumper car','indoor and outdoor use', 1200, 700);
    package_dt.add_item(3, 6, 'Like Elvis', 'Rock and Roll Singer','indoor and outdoor use - life size', 1000, 670);
    package_dt.add_item(1, 4, 'Baseball Player', 'American Baseball Player', 1800, 1000);
    package_dt.add_item(1, 4, 'Wrestler', 'An American Wrestler', 1800, 1000);
    package_dt.add_item(2, 2, 'Christmas Boot', 'large', 200, 120);
    package_dt.add_item(2, 2, 'Christmas Santa ',' 5ft', 1200, 800);
    package_dt.add_item(2, 2, 'Christmas Reindeer ',' 4ft', 800, 500);
    package_dt.add_item(1, 3, 'Dinosaur', '20ft Dinosaur', 'Suited to outdoor use, ideal for gold course', 9000, 7000);
    package_dt.add_item(3, 5, 'Black White Cow','Black and white cow - counter top size', 500, 350);
 
 
DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------');
DBMS_OUTPUT.PUT_LINE('Inserts into dimensions table confirmed below');
DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------');
-- using procedure -insert into dimensions table using the following params 
-- VALUES (p_item_id, p_size_h, p_size_w, p_size_l, p_size_gen, p_weight);
    package_dt.add_dimensions(1, 60, 70, 300, 'extra large', 200);
    package_dt.add_dimensions(2, 180, 30, 30, 'life size', 150);
    package_dt.add_dimensions(4, 180, 60, 60, 'extra large', 200);
    package_dt.add_dimensions(5, 180, 70, 60, 'extra large', 200);
    package_dt.add_dimensions(6, 60, 70, 70, 'medium', 90);
    package_dt.add_dimensions(8, 90, 45, 90, 'life size', 180);
 

DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------');
DBMS_OUTPUT.PUT_LINE('Inserts into availability table confirmed below');
DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------');
-- using procedure -insert into dimensions table using the following params 
--  VALUES (p_item_id, p_qty, p_due_date_uk, p_due_date_ire);
    package_dt.add_availability_info(1, 6);
    package_dt.add_availability_info(2, 18);
    package_dt.add_availability_info(3, 0, TO_DATE('05-JULY-2018','DD-MON-YYYY'),TO_DATE('05-AUGUST-2017','DD-MON-YYYY') );
    package_dt.add_availability_info(4, 8);
    package_dt.add_availability_info(5, 10);
    package_dt.add_availability_info(6, 6);
    package_dt.add_availability_info(7, 0, TO_DATE('05-OCTOBER-2017','DD-MON-YYYY'),TO_DATE('10-OCTOBER-2017','DD-MON-YYYY'));
    package_dt.add_availability_info(8, 9);
    package_dt.add_availability_info(9, 0, TO_DATE('19-OCTOBER-2017','DD-MON-YYYY'),TO_DATE('21-OCTOBER-2017','DD-MON-YYYY'));
    package_dt.add_availability_info(10, 0, TO_DATE('28-NOVEMBER-2017','DD-MON-YYYY'),TO_DATE('30-NOVEMBER-2017','DD-MON-YYYY'));
 
 
 
 
 
END;
/
 
 
--Update item.sale_price:

UPDATE item
SET sale_price = sale_price + 50.0
WHERE cat_id = 2; 