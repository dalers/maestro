-- create user and db, and load stored procedures
--
-- > mysql -uroot -p --show-warnings --verbose < ./create_db.sql
--
-- DATABASE USER AND PASSWORD IN PLAIN TEXT
--

-- create user if necessary
-- if user already exists, uncomment DROP USER and comment CREATE USER
--   if user does not exist, DROP USER will fail and script will be aborted. If
--   user does exist, CREATE USER will fail and script will be aborted (MySQL
--   5.6.5+ supports "DROP USER IF EXISTS...").
-- DROP USER 'maestro'@'localhost' ;
-- CREATE USER 'maestro'@'localhost' IDENTIFIED BY 'stratemeyer';
-- GRANT USAGE ON * . * TO 'maestro'@'localhost' IDENTIFIED BY 'stratemeyer' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0 ;

--
-- create database (drop existing first)
--

DROP SCHEMA IF EXISTS `maestro` ;
CREATE SCHEMA IF NOT EXISTS `maestro` DEFAULT CHARACTER SET latin1 ;
-- GRANT ALL PRIVILEGES ON `maestro` . * TO 'maestro'@'localhost';

USE `maestro` ;

--
-- load suggest_location stored procedure (used to find unassigned sub-locations for a given location)
--

DROP PROCEDURE IF EXISTS suggest_location ;

DELIMITER $$
CREATE PROCEDURE suggest_location(location_id INT)
BEGIN

DECLARE min INT DEFAULT 0; /* for min sub-location at desired location, read from db */
DECLARE max INT DEFAULT 0; /* for max sub-location at desired location, read from db  */

DECLARE v_finished INT DEFAULT 0;
DECLARE loc_name VARCHAR(100) DEFAULT '';
DECLARE i INT DEFAULT 0; /* outer loop index: min..max for given location */
DECLARE p INT DEFAULT 0; /* inner loop index: row of select from pn_pv for given location */

/* create cursor for stepping through PvPn rows that have specified location (i.e. filtered by PvPn.PNUser9 field) */
DECLARE cur CURSOR FOR SELECT CONVERT(PNUser10, UNSIGNED) FROM tbl_pv_pn WHERE PNUser9 = (SELECT name FROM tbl_stock_location WHERE id = location_id) ORDER BY 1 ASC;
/* create handle to get noticed when no more data in cursor */
DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1;

/* get location min & max from database to use for looping */
SELECT sublocation_min, sublocation_max INTO min, max FROM tbl_stock_location WHERE id = location_id;
SET i=min;

/* use temporary table for storing "not used" numbers */
DROP TABLE IF EXISTS output;
CREATE TEMPORARY TABLE output (bin_no INT);

/* fetch first row */
OPEN cur;
FETCH cur INTO p;

/* loop from location min to location max */
num_loop: LOOP

/* validate value of min from db */
/* TODO - shouldn't this be done outside loop?!? (just after getting min,max from db) */
IF min < 0 OR max < 0 OR min >= max THEN
  LEAVE num_loop;
END IF;

/* take next row from cursor into variable p (cast as integer value of PvPn.PNUser10) */
/* if (i != p) insert sub-location in (temporary) output table and move cursor to next row (otherwise is used sub-location, skip) */
IF i <> p THEN /* TODO can this be "<" only? (because array of used bin numbers is sorted?) */
  INSERT INTO output SELECT i;
ELSE 
  IF v_finished = 0 THEN
    FETCH cur INTO p;
  END IF;
END IF;

SET i=i+1;
IF i = max THEN /* TODO can condition be only "i > max"?!? (otherwise last location won't ever be considered available?) */
  LEAVE num_loop;
END IF;

END LOOP num_loop;

CLOSE cur;

SELECT * FROM output;
DROP TABLE output;

END $$
DELIMITER ;

--
-- END
--
