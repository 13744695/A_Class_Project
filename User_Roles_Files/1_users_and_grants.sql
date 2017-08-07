------------------------------As System user (in my case XE)------------------------------

--Created a new user dba named 'dt' 
--then a new connection using the following grant privileges
--Connection name, user name and password are all dt
CREATE USER dt IDENTIFIED BY dt;

GRANT CREATE TABLE TO dt;
GRANT CREATE SESSION TO dt;
GRANT CREATE VIEW TO dt;
GRANT CREATE ANY TRIGGER TO dt;
GRANT CREATE ANY PROCEDURE TO dt;
GRANT CREATE SEQUENCE TO dt;
GRANT CREATE SYNONYM TO dt;
GRANT ALL PRIVILEGES TO dt;
GRANT CREATE SESSION TO dt;

GRANT CREATE USER TO dt;
GRANT CREATE ROLE TO dt; 
GRANT ALL PRIVILEGES TO dt;

SELECT * FROM DBA_USERS WHERE USERNAME = 'dt';            -- confirms user 'dt' was created.
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE = 'dt';        -- shows all user privileges granted to 'dt' system user
SELECT * FROM DBA_TAB_PRIVS WHERE GRANTEE = 'dt';        -- shows all user privileges granted to 'dt table user
SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTEE = 'dt';       -- shows all user privileges granted to 'dt' roles user (eg: dt has role of MANAGER1 & VIEW_ONLY at time of commenting)


alter user dt identified by dt account unlock;  


