-- insert with column names (MySQL)
INSERT INTO artists
id=939, first='Malcolm', last='Arnold';

-- without column names
INSERT INTO schema_migrations VALUES('20130311191321');

-- with column names
INSERT INTO schema_migrations (version) VALUES('20130311191321');
