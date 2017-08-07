-- SETTING UP DB FOR DOUBLE TAKE
set autocommit on
set define off

@drop_tables.sql
@create_tables.sql
@create_view.sql
@create_sequences.sql
@package_spec.sql
@package_body.sql
@create_trigger.sql
@insert_item.sql
@select_stmts.sql
@cursors.sql
/*
@create_dt_triggers.sql
@insert_data.sql
@select_statements.sql
*/

--SELECT * FROM USER_ERRORS;