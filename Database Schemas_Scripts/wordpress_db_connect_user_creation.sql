CREATE USER 'lacprocessuser'@'localhost' IDENTIFIED BY 'zamboni3#';

GRANT ALL PRIVILEGES ON *.* TO 'lacprocessuser'@'localhost' WITH GRANT OPTION;

CREATE USER 'lacprocessuser'@'%' IDENTIFIED BY 'zamboni3#';

GRANT ALL PRIVILEGES ON *.* TO 'lacprocessuser'@'%' WITH GRANT OPTION;

GRANT SELECT, INSERT, UPDATE, DELETE ON `wordpress`.* TO 'lacprocessuser'@'localhost'; ALTER USER 'lacprocessuser'@'localhost' ;
GRANT SELECT, INSERT, UPDATE, DELETE ON `wordpress`.* TO 'lacprocessuser'@'%'; ALTER USER 'lacprocessuser'@'%' ;

FLUSH PRIVILEGES;

