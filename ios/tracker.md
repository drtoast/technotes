# See

http://petewarden.github.com/iPhoneTracker

# Extract location db

```
cd ~/Library/Application\ Support/MobileSync/Backup/
ls
cd a06d81b09d647a59537851485332f1bcd3c8c718
python ~/code/technotes/ios/iphonebackup.py | grep consolidated
```

-rw-r--r-- 00000000 00000000 40251392 1303347800 1303347800 1277859750 (4096c9ec676f2847dc283405900e284a7c815836)RootDomain::Library/Caches/locationd/consolidated.db

```
cp 4096c9ec676f2847dc283405900e284a7c815836 ~/Desktop/consolidated.db
```

# Browse db in Sqlite3

    sqlite3 consolidated.db
    
    sqlite> .tables
    sqlite> .schema CellLocation;
    sqlite> select Timestamp, Latitude, Longitude, Confidence from CellLocation order by Timestamp desc limit 1000;
    sqlite> .quit

# Export data

    sqlite3 consolidated.db
    
    sqlite> .output location.txt
    sqlite> select * from CellLocation;
    sqlite> .quit
    
# Schema

* MCC INTEGER,
* MNC INTEGER,
* LAC INTEGER,
* CI INTEGER,
* Timestamp FLOAT, // seconds since 1 Jan 2001
* Latitude FLOAT, 
* Longitude FLOAT, 
* HorizontalAccuracy FLOAT, // 50-300
* Altitude FLOAT, 
* VerticalAccuracy FLOAT, 
* Speed FLOAT, 
* Course FLOAT, 
* Confidence INTEGER, // 0, 50, 60, 65, 68, or 70
