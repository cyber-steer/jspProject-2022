SHOW DATABASEs;

SELECT NOW();

CREATE DATABASE jspdb;

GRANT ALL PRIVILEGES ON jspdb.* TO jsp@localhost IDENTIFIED BY '1111' WITH GRANT OPTION;

flush PRIVILEGES;