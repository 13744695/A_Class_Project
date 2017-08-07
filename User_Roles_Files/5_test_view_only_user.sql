-----to be run as guest user------
-- first batch of commands all return 'insufficient privileges' OR 'table or view does not exist' errors as expected

CREATE SYNONYM supplier FOR dt.supplier;

INSERT INTO supplier(id, name)
VALUES(dt.supplier_id_seq.NEXTVAL, 'Chris');
INSERT INTO dt.supplier(id, name)
VALUES(dt.supplier_id_seq.NEXTVAL, 'Rachel Supplies');
INSERT INTO dt.supplier(id, name)
VALUES(dt.supplier_id_seq.NEXTVAL, 'Darren Supplies');


-- following commands work as guest user has select prilieges

SELECT * FROM dt.supplier;