------------------------------------CORRECTION SQL_3 LANGAGE DE REQUETE DES DONNEES----------------------------------------
CREATE TABLE CodeLisible (
  id INTEGER PRIMARY KEY,
  Space TEXT NOT NULL
);
INSERT INTO CodeLisible VALUES (1, '--------------------Code lisible------------------');
--------- 1) Convertissez le diagramme de relation d'entité en modèle relationnel.
-- Creation de la  table Wine
CREATE TABLE Wine
(
    NumW INT PRIMARY KEY NOT NULL,
    category VARCHAR(100),
    yearW date,
    degree int
);
SELECT * FROM Wine;

-- Creation de la  table Producer
CREATE TABLE Producer
(
    NumP INT PRIMARY KEY NOT NULL,
    firstName VARCHAR(150),
    lastName VARCHAR(100),
    Region VARCHAR(50)
);
select * From Producer;
-- Creation de la  table harvest
CREATE TABLE harvest
(
	NumW INT NOT NULL,
    NumP INT NOT NULL,
    quantity INT,
	CONSTRAINT INT FOREIGN KEY (NumW) REFERENCES Wine(NumW),
	CONSTRAINT FK_harvest FOREIGN KEY (NumP) REFERENCES Producer(NumP)
);
select * from harvest ;
----------------3.	Insérez des données dans les tables de la base de données.
INSERT INTO Wine VALUES (1, 'Rouge', '2019', 13.5);
INSERT INTO Wine VALUES( 2, 'White', '2020', 12.0);
INSERT INTO Wine VALUES( 3, 'Rose', '2018', 11.52 );
INSERT INTO Wine VALUES(4, 'Rouge', '2021', 14.0);
INSERT INTO Wine VALUES (5, 'Sparkling', '2017', 10.5) ;
INSERT INTO Wine VALUES ( 6, 'White', '2019', 12.5);
INSERT INTO Wine VALUES ( 7, 'Rouge', '2022', 13.0);
INSERT INTO Wine VALUES (8, 'Rose', '2020', 11.0) ;
INSERT INTO Wine VALUES ( 9, 'Red', '2018', 12.0);
INSERT INTO Wine VALUES ( 10, 'Sparkling', '2019', 10.0);
INSERT INTO Wine VALUES (11, 'White', '2021', 11.5);
INSERT INTO Wine VALUES( 12, 'Rouge', '2022', 15.0) ;

---Insertion des données de la table Producer
INSERT INTO Producer VALUES (1, 'John', 'Smith', 'Sousse');
INSERT INTO Producer VALUES (2, 'Emma', 'Johnson', 'Tunis');
INSERT INTO Producer VALUES (3, 'Michael', 'Williams', 'Sfax');
INSERT INTO Producer VALUES (4, 'Emily', 'Brown', 'Sousse');
INSERT INTO Producer VALUES (5, 'James', 'Jones', 'Sousse');
INSERT INTO Producer VALUES ( 6, 'Sarah', 'Davis', 'Tunis');
INSERT INTO Producer VALUES (7, 'David', 'Miller', 'Sfax');
INSERT INTO Producer VALUES ( 8, 'Olivia', 'Wilson', 'Monastir');
INSERT INTO Producer VALUES ( 9, 'Daniel', 'Moore', 'Sousse');
INSERT INTO Producer VALUES ( 10, 'Sophia', 'Taylor', 'Tunis');
INSERT INTO Producer VALUES (11, 'Matthew', 'Anderson', 'Sfax');
INSERT INTO Producer VALUES (12, 'Amelia', 'Thomas', 'Sousse');
select * from Producer ;
 
 
 -----4.	Récupérez une liste de tous les producteurs.
 SELECT *
FROM Producer;
SELECT space FROM CodeLisible;

---5.	Récupérez une liste triée de producteurs par nom.
SELECT NumP, firstName,lastName
FROM Producer
ORDER BY lastName;
SELECT space FROM CodeLisible;
--------- 6) Récupérez la liste des producteurs de Sousse.

SELECT NumP,firstName, lastName, Region
FROM Producer
JOIN Wine
ON Producer.NumP = Wine.NumW
where Region = 'Sousse';
-------5) Calculer la quantité totale de vin produit portant le numéro 12.
----------- Je remplace le 12 par 1 c-a-d  la quantité totale de vin produit portant le numéro 1.

SELECT firstName, lastName, category, sum(quantity) 'la quantité totale'
FROM Producer
JOIN Wine
ON Producer.NumP = Wine.NumW
JOIN harvest
ON Wine.NumW = harvest.NumW
where Wine.NumW = 1;

-----DANS CETE EXERCICE ON A PAS DONN2E LES ENREGISTREMENT DE LA TABLE harvest 
--------- 8) Calculer la quantité de vin produit par catégorie.
SELECT firstName, lastName, category, sum(quantity) 'la quantité totale'
FROM Producer
JOIN Wine
ON Producer.NumP = Wine.NumW
JOIN harvest
ON Wine.NumW = harvest.NumW
Group BY category;


-----DANS CETE EXERCICE ON A PAS DONN2E LES ENREGISTREMENT DE LA TABLE harvest 

------9.	Retrouvez des producteurs de la région de Sousse qui ont récolté au moins un vin en quantités supérieures à 300 litres. Affichez leurs noms et prénoms, classés par ordre alphabétique.
SELECT firstName, lastName, category, quantity
FROM Producer
JOIN Wine
ON Producer.NumP = Wine.NumW
JOIN harvest
ON Wine.NumW = harvest.NumW
WHERE Region = 'Sousse' AND quantity > 300
ORDER BY firstName, lastName ASC;

------10.	Énumérez les numéros de vin d’un degré supérieur à 12, produits par le producteur numéro 24.
SELECT NumW, firstName, lastName, category,yearW, degree
FROM Wine
JOIN Producer
ON  Wine.NumW = Producer.NumP
WHERE degree > 12 AND NumP = 2 ;

----------Pour le reste des questions j'ai pas fait parcequ'on a pas donnée les enregistrement de la table Harvest






