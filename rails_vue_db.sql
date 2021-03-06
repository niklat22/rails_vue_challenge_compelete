PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
INSERT INTO schema_migrations VALUES('20200204085206');
INSERT INTO schema_migrations VALUES('20200206043828');
INSERT INTO schema_migrations VALUES('20200206043917');
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO ar_internal_metadata VALUES('environment','development','2020-02-06 04:40:54.275679','2020-02-06 04:40:54.275679');
CREATE TABLE IF NOT EXISTS "projects_users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "project_id" integer, "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO projects_users VALUES(1,1,1,'2020-02-06 10:02:34.651068','2020-02-06 10:02:34.651068');
INSERT INTO projects_users VALUES(2,1,2,'2020-02-06 10:03:41.184674','2020-02-06 10:03:41.184674');
INSERT INTO projects_users VALUES(3,1,3,'2020-02-06 10:03:43.765102','2020-02-06 10:03:43.765102');
INSERT INTO projects_users VALUES(4,1,4,'2020-02-07 04:54:30.041687','2020-02-07 04:54:30.041687');
CREATE TABLE IF NOT EXISTS "projects" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "manager_id" integer, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO projects VALUES(1,'AWS',1,'2020-02-06 10:01:48.974894','2020-02-06 10:01:48.974894');
INSERT INTO projects VALUES(2,'EDS',1,'2020-02-06 10:01:56.353728','2020-02-06 10:01:56.353728');
INSERT INTO projects VALUES(3,'GVM',1,'2020-02-06 10:02:02.611303','2020-02-06 10:02:02.611303');
INSERT INTO projects VALUES(4,'GVM3',1,'2020-02-07 05:06:59.972724','2020-02-07 05:06:59.972724');
INSERT INTO projects VALUES(5,'WS',1,'2020-02-07 06:13:40.078704','2020-02-07 06:13:40.078704');
CREATE TABLE IF NOT EXISTS "users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO users VALUES(1,'Meriadoc Brandybuck','2020-02-06 10:00:35.990743','2020-02-06 10:00:35.990743');
INSERT INTO users VALUES(2,'Elrond','2020-02-06 10:00:35.996583','2020-02-06 10:00:35.996583');
INSERT INTO users VALUES(3,'Boromir','2020-02-06 10:00:36.002602','2020-02-06 10:00:36.002602');
INSERT INTO users VALUES(4,'Quickbeam','2020-02-06 10:00:36.006856','2020-02-06 10:00:36.006856');
INSERT INTO users VALUES(5,'Glorfindel','2020-02-06 10:00:36.011423','2020-02-06 10:00:36.011423');
INSERT INTO users VALUES(6,'Beregond','2020-02-06 10:00:36.018115','2020-02-06 10:00:36.018115');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('users',6);
INSERT INTO sqlite_sequence VALUES('projects',5);
INSERT INTO sqlite_sequence VALUES('projects_users',4);
CREATE INDEX "index_projects_users_on_project_id" ON "projects_users" ("project_id");
CREATE UNIQUE INDEX "index_projects_users_on_user_id" ON "projects_users" ("user_id");
CREATE INDEX "index_projects_on_manager_id" ON "projects" ("manager_id");
COMMIT;
