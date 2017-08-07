--------------------------------------------------------------------------------
/*      

----create a view to show information joined taken from item and dimensions tables 

_________________

TABLE OF CONTENTS
_________________

CREATE VIEW item_name_and_size

*/
--------------------------------------------------------------------------------


--DROP VIEW item_name_and_size; 
CREATE VIEW item_name_and_size AS
  SELECT item.id, item.name, item.supp_id, dimensions.size_h, dimensions.size_l, dimensions.size_w
  FROM item
  INNER JOIN dimensions
  ON item.id = dimensions.item_id
  WHERE item.supp_id = 2;
  
  

