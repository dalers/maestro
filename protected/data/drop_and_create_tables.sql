-- drop and re-create maestro tables (except migration)
--
-- > mysql -uroot -p --local-infile=1 --show-warnings --verbose < /path/to/drop_and_create_tables.sql
--
-- THIS FILE MUST MATCH MIGRATION!! (i.e. re-create if migration edited)
--
-- To create with phpMyAdmin: Export > Custom:
--		All tables EXCEPT migration
--		Save output to file
--		Format: SQL
--		Disable foreign key checks
--		Dump table: structure
--		Add statements: Add DROP TABLE, CREATE TABLE options: IF NOT EXISTS, AUTO_INCREMENT
--

use maestro;

-- TODO add script once schema is finalized
