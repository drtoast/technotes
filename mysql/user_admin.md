# create user

privileges: ALTER,CREATE,DROP,INDEX,FILE,PROCESS,RELOAD,SHUTDOWN,ALL

    GRANT ALL PRIVILEGES ON *.* TO 'someuser'@'%' IDENTIFIED BY 'somepassword' WITH GRANT OPTION;
    FLUSH PRIVILEGES;
    
# change privileges

grant update privileges for the "notes" column of "orders" table of "smp" database

    GRANT UPDATE (notes) ON smp.orders TO someuser@'%';
    FLUSH PRIVILEGES;

# remove privileges

    REVOKE UPDATE,DELETE ON smp.* FROM someuser@'%';
    FLUSH PRIVILEGES;
         
# change password

    SET PASSWORD FOR username=PASSWORD('new_password');
    FLUSH PRIVILEGES;
    
# delete user

    DELETE FROM user WHERE user = 'someusername' AND host = 'somehostname';
    FLUSH PRIVILEGES;
