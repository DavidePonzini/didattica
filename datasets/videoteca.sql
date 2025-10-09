--creazione schema videoteca 

CREATE schema videoteca;
set search_path to videoteca;
set datestyle to 'DMY';

CREATE TABLE Film
       (titolo   VARCHAR(30),
        regista  VARCHAR(20), 
        anno     DECIMAL(4) NOT NULL,
        genere   CHAR(12) NOT NULL,
        valutaz  NUMERIC(3,2),
        PRIMARY KEY (titolo,regista));
        
CREATE TABLE Cliente
       (codCli    DECIMAL(4) PRIMARY KEY,
        nome      VARCHAR(20) NOT NULL,
        cognome   VARCHAR(20) NOT NULL,
        telefono  CHAR(12) UNIQUE NOT NULL,
        dataN     DATE NOT NULL,
        residenza VARCHAR(30) NOT NULL);     

CREATE TABLE  Video
       (colloc  DECIMAL(4) PRIMARY KEY,
        titolo  VARCHAR(30) NOT NULL,
        regista VARCHAR(20) NOT NULL,
        tipo  CHAR NOT NULL DEFAULT 'd'  CHECK (tipo IN ('d','v','b')),
        CONSTRAINT FKey FOREIGN KEY (titolo,regista) REFERENCES Film 
                                     ON DELETE RESTRICT);
                                     
CREATE TABLE Noleggio
       (colloc   DECIMAL(4) REFERENCES Video 
                            ON DELETE CASCADE ON UPDATE CASCADE,
        dataNol  DATE DEFAULT CURRENT_DATE, 
        codCli   DECIMAL(4) NOT NULL REFERENCES Cliente 
                            ON DELETE CASCADE ON UPDATE CASCADE,
        dataRest DATE, 
        PRIMARY KEY (colloc,dataNol), 
        UNIQUE (colloc,dataRest), 
        CHECK (dataNol <= dataRest));


insert into Film values
('underground','emir kusturica',1995,'drammatico',3.20),
('edward mani di forbice','tim burton',1990,'fantastico',3.60),
('nightmare before christmas','tim burton',1993,'animazione',4.00),
('ed wood','tim burton', 1994, 'drammatico',4.00),
('mars attacks','tim burton',1996,'fantascienza',3.00),
('il mistero di sleepy hollow','tim burton',1999,'horror',3.50),
('big fish','tim burton',2003,'fantastico',3.10),
('la sposa cadavere','tim burton',2005,'animazione',3.50),
('la fabbrica di cioccolato','tim burton',2005,'fantastico',4.00),
('io non ho paura','gabriele salvatores',2003,'drammatico',3.50),
('nirvana','gabriele salvatores',1997,'fantascienza', 3.00),
('mediterraneo','gabriele salvatores',1991,'commedia',3.80),
('pulp fiction','quentin tarantino',1994, 'thriller',3.50),
('le iene','quentin tarantino',1992,'thriller',4.00);




insert into Video values
(1111,'underground','emir kusturica','v'),
(1112,'underground','emir kusturica','d'),
(1113,'big fish','tim burton','v'),
(1114,'big fish','tim burton','d'),
(1115,'edward mani di forbice','tim burton','d'),
(1116,'nightmare before christmas','tim burton','v'),
(1117,'nightmare before christmas','tim burton','d'),
(1118,'ed wood','tim burton','d'),
(1119,'mars attacks','tim burton','d'),
(1120,'il mistero di sleepy hollow','tim burton','d'),
(1121,'la sposa cadavere','tim burton','d'),
(1122,'la fabbrica di cioccolato','tim burton','d'),
(1123,'la fabbrica di cioccolato','tim burton','d'),
(1124,'io non ho paura','gabriele salvatores','d'),
(1125,'nirvana','gabriele salvatores','d'),
(1126,'mediterraneo','gabriele salvatores','d'),
(1127,'pulp fiction','quentin tarantino','v'),
(1128,'pulp fiction','quentin tarantino','d'),
(1129,'le iene','quentin tarantino','d');



insert into Cliente values
(6610,'anna','rossi','01055664433','05-10-1979','via scribanti 16 16131 genova'),
(6635,'paola','bianchi','0104647992','12-04-1976','via dodecaneso 35 16146 genova'),
(6642,'marco','verdi','3336745383','16-10-1972','via lagustena 35 16131 genova');

insert into Noleggio values
(1111,'01-03-2006',6635,'02-03-2006'),
(1115,'01-03-2006',6635,'02-03-2006'),
(1117,'02-03-2006',6635,'06-03-2006'),
(1118,'02-03-2006',6635,'06-03-2006'),
(1111,'04-03-2006',6642,'05-03-2006'),
(1119,'08-03-2006',6635,'10-03-2006'),
(1120,'08-03-2006',6635,'10-03-2006'),
(1116,'08-03-2006',6642,'09-03-2006'),
(1118,'10-03-2006',6642,'11-03-2006'),
(1121,'15-03-2006',6635,'18-03-2006'),
(1122,'15-03-2006',6635,'18-03-2006'),
(1113,'15-03-2006',6635,'18-03-2006'),
(1129,'15-03-2006',6635,'20-03-2006'),
(1119,'15-03-2006',6642,'16-03-2006'),
(1126,'15-03-2006',6610,'16-03-2006'),
(1112,'16-03-2006',6610,'18-03-2006'),
(1114,'16-03-2006',6610,'17-03-2006'),
(1128,'18-03-2006',6642,'20-03-2006'),
(1124,'20-03-2006',6610,'21-03-2006'),
(1115,'20-03-2006',6610,'21-03-2006'),
(1124,'21-03-2006',6642,'22-03-2006'),
(1116,'21-03-2006',6610,NULL),
(1117,'21-03-2006',6610,NULL),
(1127,'22-03-2006',6635,NULL),
(1125,'22-03-2006',6635,NULL),
(1122,'22-03-2006',6642,NULL),
(1113,'22-03-2006',6642,NULL);
  