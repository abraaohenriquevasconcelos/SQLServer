USE [dbname]
go

CREATE TABLE tab1(
	col1 int not null

)

go

CREATE TABLE tab2(
	col2 int not null

)
go

INSERT INTO tab1 VALUES(10)
INSERT INTO tab1 VALUES(20)
INSERT INTO tab1 VALUES(30)
INSERT INTO tab1 VALUES(40)
INSERT INTO tab1 VALUES(50)

INSERT INTO tab2 VALUES(40)
INSERT INTO tab2 VALUES(50)

INSERT INTO tab2 VALUES(60)
INSERT INTO tab2 VALUES(70)
INSERT INTO tab2 VALUES(80)
INSERT INTO tab2 VALUES(90)
INSERT INTO tab2 VALUES(100)

go

SELECT * FROM tab1

go

SELECT * FROM tab2

go

SELECT * FROM tab1 LEFT JOIN tab2 ON tab1.col1 = tab2.col2

go

SELECT * FROM tab1 LEFT OUTER JOIN tab2 ON tab1.col1 = tab2.col2 --com ou sem OUTER dá no mesmo

GO

SELECT * FROM tab1 RIGHT  JOIN tab2 ON tab1.col1 = tab2.col2 

go

SELECT * FROM tab1 RIGHT OUTER JOIN tab2 ON tab1.col1 = tab2.col2 --com ou sem OUTER dá no mesmo