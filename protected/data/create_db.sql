-- create maestro db
-- usage:
-- > mysql -uroot -p --show-warnings --verbose < ./create_db.sql
--

CREATE USER 'maestro'@'localhost' IDENTIFIED BY 'stratemeyer';

GRANT USAGE ON * . * TO 'maestro'@'localhost' IDENTIFIED BY 'stratemeyer' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0 ;

CREATE DATABASE IF NOT EXISTS `maestro` ;

GRANT ALL PRIVILEGES ON `maestro` . * TO 'maestro'@'localhost';
