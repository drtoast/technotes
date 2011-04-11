# dump from localhost to local file

    mysqldump dbname tablename -h hostname -u username -p --quick > filename.sql

# dump from remote host

    mysqldump cust customer_campaigns -h cat.colo3.sfc.sheetmusicplus.com -u bolero -p --quick