# Create an admin user for all dbs

use mysql;
GRANT ALL PRIVILEGES ON *.* TO 'someuser'@'%' IDENTIFIED BY 'somepassword' WITH GRANT OPTION;
flush privileges;

# Create an admin user for one db
mysql -u root
use mysql;
GRANT ALL PRIVILEGES ON wfx.* TO 'wfx'@'%' IDENTIFIED BY 'wfx';
