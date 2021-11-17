
-- script to create "rest_info" database, and "rest_manager" user that accesses database from php backend.


-- create rest_info database if not already present
CREATE DATABASE IF NOT EXISTS rest_info;

-- create user
CREATE USER IF NOT EXISTS 'rest_manager'@'localhost' IDENTIFIED BY 'iF2ONNbmcCTcdjrd';

-- grant privileges to newly created user.  
-- this statement likely to fail if not ran from root.
GRANT ALL ON rest_info.* to 'rest_manager'@'localhost';

-- swap to this database
-- USE rest_info;
