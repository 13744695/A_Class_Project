CREATE OR REPLACE PACKAGE package_dt IS
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~add suppliers~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
    PROCEDURE add_supplier (
        p_name      supplier.name%TYPE,
        p_address   supplier.address%TYPE,
        p_phone1    supplier.phone1%TYPE,
        p_email1    supplier.email1%TYPE
    );
  
    PROCEDURE add_supplier (
        p_name      supplier.name%TYPE,
        p_address   supplier.address%TYPE,
        p_phone1    supplier.phone1%TYPE,
        p_phone2    supplier.phone2%TYPE,
        p_email1    supplier.email1%TYPE,
        p_email2    supplier.email2%TYPE
    );

    PROCEDURE add_supplier (
        p_name      supplier.name%TYPE,
        p_address   supplier.address%TYPE,
        p_phone1    supplier.phone1%TYPE,
        p_phone2    supplier.phone2%TYPE,
        p_phone3    supplier.phone3%TYPE,
        p_email1    supplier.email1%TYPE,
        p_email2    supplier.email2%TYPE,
        p_email3    supplier.email3%TYPE
    );
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~add categories~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
    PROCEDURE add_category (
        p_name    category.name%type
    );
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~add items~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
    PROCEDURE add_item (
        p_supp_id       item.supp_id%TYPE,
        p_cat_id        item.cat_id%TYPE,
        p_name          item.name%TYPE,
        p_desc1         item.desc1%TYPE,
        p_desc2         item.desc2%TYPE,
        p_sale_price    item.sale_price%TYPE,
        p_purch_price   item.purch_price%TYPE
    );

    PROCEDURE add_item (
        p_supp_id       item.supp_id%TYPE,
        p_cat_id        item.cat_id%TYPE,
        p_name          item.name%TYPE,
        p_desc1         item.desc1%TYPE,
        p_sale_price    item.sale_price%TYPE,
        p_purch_price   item.purch_price%TYPE
    );
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~add dimensions~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--

    PROCEDURE add_dimensions (
        p_item_id       dimensions.item_id%type,
        p_size_h        dimensions.size_h%type,
        p_size_w        dimensions.size_w%type,
        p_size_l        dimensions.size_l%type,
        p_size_gen      dimensions.size_gen%type,
        p_weight        dimensions.weight%type
    );
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~add availability info~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--

    PROCEDURE add_availability_info (
        p_item_id           availability.item_id%type,
        p_qty               availability.qty%type,
        p_due_date_uk       availability.due_date_uk%type,
        p_due_date_ire      availability.due_date_uk%type
    );
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~add availability info~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--

    PROCEDURE add_availability_info (
        p_item_id           availability.item_id%type,
        p_qty               availability.qty%type
    );

-------------------------------------------------------------------------------------

    FUNCTION item_count(p_cat_id NUMBER) RETURN NUMBER;
    


--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~function to return difference between two numbers~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-- 
-- for use is getting diff between cost and selling price.
    
    FUNCTION calc_diff(cost_price NUMBER, sale_price NUMBER) RETURN NUMBER;


END package_dt;
/