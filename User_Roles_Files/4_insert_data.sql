------as mgr user insert data------
CREATE SYNONYM supplier FOR dt.supplier;

INSERT INTO supplier(id, name)                  -- synonym works - shown by success of this command.
VALUES(dt.supplier_id_seq.NEXTVAL, 'Chris');	-- sequence called from remote user area.
INSERT INTO dt.supplier(id, name)				-- table called from remote user area here.
VALUES(dt.supplier_id_seq.NEXTVAL, 'Rachel Supplies');
INSERT INTO dt.supplier(id, name)
VALUES(dt.supplier_id_seq.NEXTVAL, 'Darren Supplies');

SELECT * FROM USER_ERRORS;