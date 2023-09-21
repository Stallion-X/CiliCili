CREATE DATABASE cilicili;
USE cilicili;

CREATE TABLE users (
uid BIGINT PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(32) NOT NULL UNIQUE,
pwd VARCHAR(200) NOT NULL,
nickname VARCHAR(32),
sex VARCHAR(2) NOT NULL,
email VARCHAR(30),
phone CHAR(11),
signature VARCHAR(200),
coins INT NOT NULL DEFAULT 0,
regtime DATETIME NOT NULL,
birth DATE,
roles INT NOT NULL DEFAULT 0,
islocked INT NOT NULL DEFAULT 0,
avatar VARCHAR(100) NOT NULL DEFAULT 'default.jpg',
deleted INT(2) DEFAULT 0,
CHECK(sex IN ('男','女','保密'))
);
CREATE TABLE video(
vid BIGINT PRIMARY KEY AUTO_INCREMENT,
vtitle VARCHAR(50) NOT NULL,
vpart INT NOT NULL,
vinfo VARCHAR(1000),
vowner BIGINT NOT NULL,
uptime DATETIME NOT NULL,
vviews BIGINT NOT NULL DEFAULT 0,
videofile VARCHAR(100) NOT NULL,
vlikes INT NOT NULL DEFAULT 0,
vcoins INT NOT NULL DEFAULT 0,
vcolnum INT NOT NULL DEFAULT 0,
vimage VARCHAR(100) NOT NULL DEFAULT 'default.jpg',
deleted INT(2) DEFAULT 0,
islocked INT NOT NULL DEFAULT 1,
FOREIGN KEY (vowner) REFERENCES users(uid)
ON DELETE CASCADE
ON UPDATE CASCADE
);
CREATE TABLE comments(
comid BIGINT PRIMARY KEY AUTO_INCREMENT,
comvid BIGINT NOT NULL,
comown BIGINT NOT NULL,
comcontent VARCHAR(1000) NOT NULL,
comtime DATETIME NOT NULL,
comlikes INT NOT NULL DEFAULT 0,
deleted INT(2) DEFAULT 0,
FOREIGN KEY (comvid) REFERENCES video(vid)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (comown) REFERENCES users(uid)
ON DELETE CASCADE
ON UPDATE CASCADE
);
CREATE TABLE commentreply(
rid BIGINT PRIMARY KEY AUTO_INCREMENT,
recomid BIGINT NOT NULL,
rown BIGINT NOT NULL,
replied BIGINT NOT NULL,
rcontent VARCHAR(1000) NOT NULL,
rtime DATETIME NOT NULL,
rlikes INT NOT NULL DEFAULT 0,
deleted INT(2) DEFAULT 0,
FOREIGN KEY (recomid) REFERENCES comments(comid)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (recomid) REFERENCES commentreply(rid)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (rown) REFERENCES users(uid)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (replied) REFERENCES users(uid)
ON DELETE CASCADE
ON UPDATE CASCADE
);
CREATE TABLE danmu(
did BIGINT PRIMARY KEY AUTO_INCREMENT,
dvid BIGINT NOT NULL,
duid BIGINT NOT NULL,
dcontent VARCHAR(255) NOT NULL,
dsize INT,
color INT,
dtime FLOAT(11,0),
dposition INT,
FOREIGN KEY (dvid) REFERENCES video(vid)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (duid) REFERENCES users(uid)
ON DELETE CASCADE
ON UPDATE CASCADE
);
CREATE TABLE collection(
colid BIGINT PRIMARY KEY AUTO_INCREMENT,
colu BIGINT NOT NULL,
colv BIGINT NOT NULL,
coltime DATETIME NOT NULL,
deleted INT(2) DEFAULT 0,
FOREIGN KEY (colu) REFERENCES users(uid)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (colv) REFERENCES video(vid)
ON DELETE CASCADE
ON UPDATE CASCADE
);
CREATE TABLE follow(
fid BIGINT PRIMARY KEY AUTO_INCREMENT,
follower BIGINT NOT NULL,
followed BIGINT NOT NULL,
followtime DATETIME NOT NULL,
deleted INT(2) DEFAULT 0,
FOREIGN KEY (follower) REFERENCES users(uid)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (followed) REFERENCES users(uid)
ON DELETE CASCADE
ON UPDATE CASCADE
);
INSERT INTO users(username,pwd,sex,regtime,roles) VALUES('admin','admin','男',NOW(),2);