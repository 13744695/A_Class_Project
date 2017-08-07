-- cursor to loop through table and print to screen items from category code 2


SET SERVEROUTPUT ON
DECLARE
    CURSOR show_category_contents is
        select id, name, desc1, sale_price from item
        where cat_id = 2;
    item_id item.id%type;                       -- assign value to variables and to type as per column of source table.
    item_name item.name%type;
    item_desc1 item.desc1%type;
    item_price item.sale_price%type;

BEGIN
    OPEN show_category_contents;
        
        DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------');
        DBMS_OUTPUT.PUT_LINE('show_category_contents Cursor was called and has returned the following values for category 2');
        DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------');
    LOOP
        FETCH show_category_contents into item_id, item_name, item_desc1, item_price;
        exit when show_category_contents%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(item_id||  '          '  || item_name||  '          '  || item_desc1||  '          '  || item_price);
    END LOOP;
    CLOSE show_category_contents;
END;
/

