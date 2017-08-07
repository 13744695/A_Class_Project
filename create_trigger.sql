--------------------------------------------------------------------------------
/*
_________________

TABLE OF CONTENTS
_________________

2 * Triggers

CREATE OR REPLACE TRIGGER print_action
------Tigger using case statement to print text based of type of action performed on item table------

DROP TABLE item_log & CREATE TABLE item_log 
CREATE OR REPLACE TRIGGER log_sale_price_update
------Trigger to log to table item_log instances of updates to sale price on item table------
*/
--------------------------------------------------------------------------------



CREATE OR REPLACE TRIGGER print_action
  BEFORE
    INSERT OR
    UPDATE OR
    DELETE
  ON item
BEGIN
  CASE
    WHEN INSERTING THEN
      DBMS_OUTPUT.PUT_LINE('~~~~~~~print_action Trigger says:   Inserting item ... ...');
    WHEN UPDATING THEN
      DBMS_OUTPUT.PUT_LINE('~~~~~~~print_action Trigger says:   Updating item ... ...');
    WHEN DELETING THEN
      DBMS_OUTPUT.PUT_LINE('~~~~~~~print_action Trigger says:   Deleting item ... ...');
  END CASE;
END;
/






------Trigger to log to log to table item_log instances of updates to sale price on item table------

DROP TABLE item_log;
CREATE TABLE item_log (
  item_id           NUMBER,
  log_date          DATE,
  old_sale_price    NUMBER,
  new_sale_price    NUMBER,
  action            VARCHAR2(30));
 
--Create trigger that inserts row in log table after item is updated:

CREATE OR REPLACE TRIGGER log_sale_price_update
  AFTER UPDATE OF sale_price ON item
  FOR EACH ROW
BEGIN
  INSERT INTO item_log (item_id, log_date, old_sale_price, new_sale_price, action)
  VALUES (:NEW.id, SYSDATE, :OLD.sale_price, :NEW.sale_price, '  New Saleprice (From trigger)');
END;
/


 



