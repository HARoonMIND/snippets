CREATE USER 'hydrus'@'localhost' IDENTIFIED BY 'TBGAdmin@123456!';

CREATE USER 'hydrus'@'%' IDENTIFIED BY 'jerrypassword';

GRANT ALL PRIVILEGES ON *.* to hydrus@localhost IDENTIFIED BY 'TBGAdmin@123456!' WITH GRANT OPTION;

GRANT ALL PRIVILEGES ON *.* to hydrus@'%' IDENTIFIED BY 'TBGAdmin@123456!' WITH GRANT OPTION;

FLUSH PRIVILEGES;

EXIT;




zcat Backup-sportscorner-Table-401-600.sql.gz | mysql -u 'root' -p sportscorner
