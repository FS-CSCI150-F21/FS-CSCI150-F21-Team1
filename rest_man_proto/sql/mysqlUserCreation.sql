-- statements for user creation and privileges granted are not included in automatic database exports
-- Therefore, this script will serve as user creation.

-- create user
CREATE USER IF NOT EXISTS 'rest_manager'@'localhost' IDENTIFIED BY 'iF2ONNbmcCTcdjrd';

-- grant privileges to newly created user.  
-- this statement likely to fail if not ran from root.
GRANT ALL ON rest_info.* to 'rest_manager'@'localhost';
