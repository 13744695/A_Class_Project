--------------------------------------------------------------------------------
/*
_________________

TABLE OF CONTENTS
_________________
SELECT package_dt.item_count            -- testin item_count function using cat_id input
SELECT package_dt.calc_diff             -- testing calc_diff function using number inputs
SELECT package_dt.calc_diff             -- testing calc_diff function using 'item' table inputs
SELECT * FROM item_log;                 -- show any updates made to the item table sale-price items are reflected in the item_log table
SELECT * FROM item_name_and_size;       -- shows contents of 'view' where name is chosen from item table and sizes are chosen from dimensions table                   

*/
--------------------------------------------------------------------------------
  
        SELECT package_dt.item_count(2) FROM DUAL;

-- testing calc_diff function

        SELECT package_dt.calc_diff(15,22) FROM DUAL;   

-- testing calc_diff function using 'item' table inputs.

        SELECT package_dt.calc_diff(                   
            (SELECT purch_price FROM item WHERE id = 1),
            (SELECT sale_price FROM item WHERE id = 1)
        )
        FROM DUAL;


  
-- show any updates made to the item table sale-price items are reflected in the item_log table
        SELECT * FROM item_log;
        
        SELECT * FROM item_name_and_size;

/*
describe availability;
describe category;
describe dimensions;
describe item;
describe item_log;
describe supplier;

*/
