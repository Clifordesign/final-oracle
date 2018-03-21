CREATE TABLE Fournisseur(
	IdFournisseur varchar2(15) primary key,
	NomFournisseur varchar2(15),
	PrenomFournisseur varchar2(15),
	PhoneFournisseur varchar(8),
	AgeFournisseur number(3)
    );
    
insert into Fournisseur values (01,'JULES','Wilfrid',47395748,40);
insert into Fournisseur values (02,'LAZARD','Wilguy',33354263,20);
insert into Fournisseur values (03,'ODNE','Nicolson',47395748,13);
insert into Fournisseur values (04,'JULES','Wilfrid',47395748,40);
insert into Fournisseur values (05,'FREE','Frida',48646285,40);

SELECT * FROM fournisseur;
    
CREATE TABLE Categorie;(
    IdCategorie number(5) primary key,
    NomCategorie varchar2(15) check
    (NomCategorie in ('Boissons','Condiments','laitiers','Viandes','poissons','Pâtes','céréales','Desserts','fruits','légumes')),
    NomFournisseur varchar2(15)
    );
    
insert into Categorie values (10,'Viandes',01);
insert into Categorie values (2,'Poisson',02);
insert into Categorie values (12,'céréales',03);
insert into Categorie values (13,'Boissons',04);

SELECT * FROM categorie;

CREATE TABLE Produit;(
	IdProduit number(5) primary key,
	NomProduit varchar2(15),
	DateExpiration  Date,
    IdCategorie number(5),
    StockSecurite varchar2(15),
    constraint fk_Produit foreign key (IdCategorie) references Categorie(IdCategorie)
    );
    
    insert into Produit values(30,'MAIS',10,100);
    insert into Produit values(31,'BANANE',(TO_DATE('12/3/2019','MM/DD/YYYY')),12,113);
    insert into Produit values(32,'ORANGE',(TO_DATE('11/05/2099','MM/DD/YYYY')),13,113);
    
    SELECT * FROM PRODUIT;
    
    CREATE TABLE Client(
	IdClient number(5) primary key,
	NomClient varchar2(15),
	PrenomClient varchar2(15),
	DateNais Date,
	VilleClient varchar2(15),
	PhoneClient VARCHAR2(8)
   );
   
    insert into Client values(40,'Diderot','Jeans',(to_date('1986/08/12 18:18:18','YYYY-MM-DD HH24:MI:SS')),'cap-haitien',38675458);
    insert into Client values(41,'Josue','Jeans',(to_date('1996/08/26 12:18:08','YYYY-MM-DD HH24:MI:SS')),'Limbe',38675456);
                                                
    
    SELECT * FROM client;

   
CREATE TABLE Departement(
    IdDepartement number(2) primary key,
    NomDepartement varchar2(15) check (NomDepartement in('ACCOUNTING', 'OPERATIONS', 'RESEARCH', 'SALES')),
    localDepartement varchar2(10)
   );
       
    insert into Departement values (30, 'SALES','Nord');
    insert into Departement values (10, 'ACCOUNTING','sud');
    insert into Departement values (50, 'RESEARCH','est');
    insert into Departement values (52, 'OPERATIONS','ouest');
    insert into Departement values (55, 'RESEARCH','Centre');
    
    SELECT * FROM departement;
       
    	CREATE TABLE Employe(
		IdEmploye number(4) primary key,
		NomEmploye varchar2(10),
		Fonction varchar2(9)check (Fonction in('CLERK', 'SALESMAN', 'PRESIDENT', 'MANAGER', 'ANALYST')),
		CodeSuperieur number(4),
		DateEmbauche Date,
		Salaire number(7,2),
		Commission number(7,2),
		IdDepartement number(15),
		Adresse varchar2(10),
		constraint fk_Employe foreign key (IdDepartement) references Departement(IdDepartement)
		);
        
                                           
    insert into Employe values (60,'Alce','CLERK',111,(TO_DATE('01/01/1981','MM/DD/YYYY')),15000,200,50,'Vertiere');
	insert into Employe values (61,'Black','SALESMAN',113,(TO_DATE('01-01-1988','MM-DD-YYYY')),5000,'202',10,'Champin');
	insert into Employe values (63,'Kenn','PRESIDENT',112,(TO_DATE('01-11-1988','MM-DD-YYYY')),500,'208',10,'charrier');
	insert into Employe values (64,'Nico','SALESMAN',114,(TO_DATE('08-11-1988','MM-DD-YYYY')),800,'209',30,'bell-air');
	insert into Employe values (66,'Nini','SALESMAN',115,(TO_DATE('01-11-1981','MM-DD-YYYY')),15300,'229',30,'bell-Ance');
	insert into Employe values (67,'Nina','ANALYST',215,(TO_DATE('05-11-1981','MM-DD-YYYY')),25300,'221',50,'Madeline');
	insert into Employe values (68,'Cleck','MANAGER',216,(TO_DATE('05-11-1970','MM-DD-YYYY')),2300,'225',52,'ppls');
	insert into Employe values (69,'Adlin','CLERK',218,(TO_DATE('05-12-1981','MM-DD-YYYY')),1300,'226',10,'Arcule');
	insert into Employe values (70,'ALLEN','ANALYST',219,(TO_DATE('05-12-1980','MM-DD-YYYY')),3000,'227',10,'NOVION');
	insert into Employe values (72,'MARTIN','PRESIDENT',220,(TO_DATE('05-12-1940','MM-DD-YYYY')),3080,'228',10,'HINCHE');
	insert into Employe values (71,'Alix','ANALYST',224,(TO_DATE('03-02-1949','MM-DD-YYYY')),280,'268',52,'Limbe');
	insert into Employe values (73,'Cliford','ANALYST',227,(TO_DATE('03-02-1999','MM-DD-YYYY')),30290,'2890',50,'Milot');
    
    SELECT * FROM employe;
    
    CREATE TABLE Commande(
   	IdCommande number(5)primary key,
   	DateCommande Date,
   	DateLivraison Date,
   	IdClient number(5),
   	IdEmploye number(5),
   	constraint fk_Commande foreign key (IdClient) references Client(IdClient),
   	constraint fk_Commande2 foreign key (IdEmploye) references Employe (IdEmploye)
    );
    
        insert into Commande values (80,(TO_DATE('12-06-2017','DD-MM-YYYY')),TO_DATE('09-05-2017','DD-MM-YYYY'),40,68);
		insert into Commande values (81,TO_DATE('06-03-2018','DD-MM-YYYY'),TO_DATE('29-03-2018','DD-MM-YYYY'),40,60);
		insert into Commande values (82,TO_DATE('06-03-2018','DD-MM-YYYY'),TO_DATE('30-03-2018','DD-MM-YYYY'),41,61);
        
        SELECT * FROM commande;
    
        
    CREATE TABLE DetailCommande(
	IdCommande number(5),
	IdProduit number(5),
	Quantite number(5),
	PrixUnitaire number(5),
	constraint pk_DetailCommande primary key(IdCommande,IdProduit),
	constraint fk_DetailCommande2 foreign key (IdCommande) references Commande(IdCommande),
	constraint fk_DetailCommande3 foreign key (IdProduit) references Produit(IdProduit)
    );
    
	insert into DetailCommande values (80,30,6,50);	
	insert into DetailCommande values (81,31,8,100);
	insert into DetailCommande values (82,32,3,150);
    
    SELECT * FROM DetailCommande;
    
    --COMMENTAIRES

comment on table fournisseur
    is 'la table des fournisseurs'; 
    
    comment on table categorie
    is 'la table des categories';
    
comment on table produit
    is 'la table des produits';
    
comment on table client
    is 'la table des clients';
    
comment on table departement
    is 'la table des departements';
    
comment on table employe
    is 'la table des employes';
    
comment on table commande
    is 'la table de commande';
    
comment on table detailcommande
    is 'la table des details des commande';
    
    select * from employe;
    
    -- REPONSE 1
    
    SELECT idemploye, nomemploye FROM employe WHERE dateembauche BETWEEN TO_DATE('1981-01-01', 'YYYY-MM-DD')
                    AND TO_DATE('1981-12-31', 'YYYY-MM-DD');
                    
-- 134
SELECT fonction, salaire FROM employe ORDER BY fonction HAVING salaire=
(SELECT AVG salaire) FROM employe ORDER BY fonction);

--22
SELECT iddepartement FROM employe WHERE salaire =
(SELECT MAX(salaire) FROM employe GROUP BY iddepartement);
                    
--9
SELECT * FROM employe WHERE fonction = (SELECT fonction FROM employe WHERE 
iddepartement.departement = iddepartement.employe WHERE nomemploye = 'martin');

--2
SELECT * FROM employe WHERE;

--6
SELECT nomemploye FROM employe WHERE
dateembauche = (SELECT MIN(dateembauche) FROM employe);

--7
SELECT * FROM employe WHERE 
salaire > (SELECT AVG(salaire) FROM employe);

--10
--22
select iddepartement, count(*) "Nombre employe"from employe
group by iddepartement;

select nomemploye, iddepartement, salaire from employe 
   where (salaire, iddepartement) in 
     (select MIN(salaire), iddepartement from employe group by iddepartement); 
     
     --18
     select iddepartement from employe 
group by iddepartement 
having count(*) > (select count(*) from employe where iddepartement=10);

--22
select nomemploye, salaire from employe
   where salaire = 
     (select max(salaire) from employe where
     iddepartement=30); 
     
     select nomemploye, salaire from employe
   where salaire = 
     (select max(salaire) from employe);
     
     select iddepartement from departement
where iddepartement not in
  (select iddepartement from employe
   where salaire > 10000);
   
   --2
SELECT * from employe;
FROM (;
SELECT departement MAX(fonction) FROM employe;

select iddepartement from departement where
(select max(fonction) from employe where
fonction = 'pilote');

--3
SELECT * FROM employe  WHERE
fonction = 'SALESMAN' OR fonction = 'ANALYST' WHERE
(SELECT dateembauche BETWEEN TO_DATE('01-01-1981', 'DD-MM-YYYY') AND TO_DATE('31-12-1981', 'DD-MM-YYYY'));
AND salaire > 12000;

--4
SELECT * FROM employe
WHERE   fonction = 'SALESMAN' AND
salaire > (SELECT MIN(salaire) FROM employe WHERE fonction = 'CLERK');

--5
SELECT COUNT(*) FROM employe GROUP BY TO_CHAR(dateembauche,'YYYY');

--8
SELECT nomemploye, salaire FROM employe WHERE salaire >
(SELECT salaire FROM employe WHERE  nomemploye = 'ALLEN');

--9
SELECT * FROM employe WHERE fonction =
(SELECT fonction FROM employe WHERE nomemploye = 'MARTIN')
AND iddepartement = (SELECT iddepartement FROM employe WHERE nomemploye = 'MARTIN');

--12
SELECT iddepartement FROM departement WHERE
(SELECT AVG(salaire) from employe) > (SELECT AVG(salaire) FROM employe WHERE iddepartement = 30);

SELECT fonction FROM employe WHERE ;

(SELECT AVG(salaire) FROM employe WHERE ;
(SELECT fonction, salaire FROM employe WHERE fonction IS );


--25

SELECT nomemploye, codesuperieur as nomchef FROM employe;

select * from departement where iddepartement not in (select iddepartement from Employe);

SELECT fonction, AVG(Salaire) "salaire moyenne"
             FROM Employe
            GROUP BY fonction;






select avg(salaire) from employe;



SELECT * FROM employe;
