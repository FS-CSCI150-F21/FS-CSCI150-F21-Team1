-- statements for user creation and privileges granted are not included in automatic database exports
-- Will be backed-up here in case anyone forgets to append them to the latest export

-- create user
CREATE USER IF NOT EXISTS 'rest_manager'@'localhost' IDENTIFIED BY 'iF2ONNbmcCTcdjrd';

-- grant privileges to newly created user.  
-- this statement likely to fail if not ran from root.
GRANT ALL ON rest_info.* to 'rest_manager'@'localhost';
