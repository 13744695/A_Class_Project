------------------------------As 'dt' admin user------------------------------

--as dt created users and roles as follows:
--for project ease of use only all users and passwords are the same.
--for some grants below, tables must first be created. 

CREATE USER sys_admin IDENTIFIED BY sys_admin;  -- creates user access for sys administrator with full admin rights. 
CREATE USER mgr IDENTIFIED BY mgr;              -- creates user access for manager with regular user rights. 
CREATE USER guest IDENTIFIED BY guest;          -- creates user access for guest with view only rights.

alter user sys_admin identified by sys_admin account unlock; 
alter user mgr identified by mgr account unlock; 
alter user guest identified by guest account unlock; 

CREATE ROLE manager1;
CREATE ROLE view_only;


GRANT CREATE TABLE, CREATE SESSION, CREATE VIEW TO manager1;

-------view_only privileges------               -- can only be run after tables are created in dt
GRANT SELECT ON item TO view_only;             
GRANT SELECT ON dimensions TO view_only;
GRANT SELECT ON category TO view_only;
GRANT SELECT ON supplier TO view_only;

-------manager1 privileges------                -- can only be run after tables are created in dt
GRANT select, insert, update, delete ON item TO manager1;
GRANT select, insert, update, delete ON dimensions TO manager1;
GRANT select, insert, update, delete ON category TO manager1;
GRANT select, insert, update, delete ON supplier TO manager1;
GRANT select, insert, update, delete ON supplier TO mgr;
grant select on supplier_id_seq to manager1;

GRANT CONNECT, CREATE SESSION TO view_only;
GRANT CONNECT, CREATE SESSION, CREATE SYNONYM TO manager1;

------roles assigned to users------             -- can only be run after item table is created in dt
GRANT view_only TO guest;
GRANT view_only TO mgr;
GRANT manager1 TO mgr;

SELECT * FROM USER_SYS_PRIVS;                   -- as this is run as dt user, it shows all system privileges for dt.


