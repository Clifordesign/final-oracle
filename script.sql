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
        
                                            (TO_DATE('11/05/2099','MM/DD/YYYY'));
    insert into Employe values (60,'Alce','Chef',111,'(TO_DATE('01/01/1981','MM/DD/YYYY'))',15000,200,50,'Vertiere');
	insert into Employe values (61,'Black','pilote',113,01-01-1988,5000,'202',10,'Champin');
	insert into Employe values (63,'Kenn','pilote',112,01-11-1988,500,'208',10,'charrier');
	insert into Employe values (64,'Nico','pilote',114,08-11-1988,800,'209',30,'bell-air');
	insert into Employe values (66,'Nini','SALESMAN',115,01-11-1981,15300,'229',30,'bell-Ance');
	insert into Employe values (67,'Nina','ANALYST',215,05-11-1981,25300,'221',50,'Madeline');
	insert into Employe values (68,'Cleck','Manager',216,05-11-1970,2300,'225',52,'ppls');
	insert into Employe values (69,'Adlin','Chanteur',218,05-12-1981,1300,'226',10,'Arcule');
	insert into Employe values (70,'ALLEN','ARTISTE',219,05-12-1980,3000,'227',10,'NOVION');
	insert into Employe values (72,'MARTIN','pilote',220,05-12-1940,3080,'228',10,'HINCHE');
	insert into Employe values (71,'Alix','Ouvrier',224,03-02-1949,280,'268',52,'Limbe');
	insert into Employe values (73,'Cliford','Employe',227,03-02-1999,30290,'2890',50,'Milot');
    
    CREATE TABLE Commande(
   	IdCommande number(5)primary key,
   	DateCommande Date,
   	DateLivraison Date,
   	IdClient number(5),
   	IdEmploye number(5),
   	constraint fk_Commande foreign key (IdClient) references Client(IdClient),
   	constraint fk_Commande2 foreign key (IdEmploye) references Employe (IdEmploye)
    );
    
--    CREATE TABLE DetailCommande(
--	IdCommande number(5),
--	IdProduit number(5),
--	Quantite number(5),
--	PrixUnitaire number(5),
--	constraint pk_DetailCommande primary key (IdCommande, IdProduit),
--	--constraint fk_DetailCommande foreign key (IdCommande) references Commande(IdProduit),
--    constraint fk_DetailCommande2 foreign key (IdProduit) references Produit(IdProduit)
--    );
--    
    CREATE TABLE DetailCommande(
	IdCommande number(5),
	IdProduit number(5),
	Quantite number(5),
	PrixUnitaire number(5),
	constraint pk_DetailCommande primary key(IdCommande,IdProduit),
	constraint fk_DetailCommande2 foreign key (IdCommande) references Commande(IdCommande),
	constraint fk_DetailCommande3 foreign key (IdProduit) references Produit(IdProduit)

	);
    
--    drop table produit;
--    drop table departement;
--    drop table employe;
--    drop table client;
--    drop table detailcommande;
--    drop table commande;
--    drop table fournisseur;
--    drop table categorie;

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
    
    select * from hr.employees;
    
    -- INSERTION DES DONNEES--


 

    INSERT INTO produit (idproduit, nomproduit, dateexpiration,idcategorie, stocksecurite) VALUES (30,'MAIS','2018/12/13',2,100);


        
        select * from produit;
        
            
            	insert into Employe values (60,'Alce','Chef',111,01-01-1981,15000,'200',50,'Vertiere');
	insert into Employe values (61,'Black','pilote',113,01-01-1988,5000,'202',10,'Champin');
	insert into Employe values (63,'Kenn','pilote',112,01-11-1988,500,'208',10,'charrier');
	insert into Employe values (64,'Nico','pilote',114,08-11-1988,800,'209',30,'bell-air');
	insert into Employe values (66,'Nini','SALESMAN',115,01-11-1981,15300,'229',30,'bell-Ance');
	insert into Employe values (67,'Nina','ANALYST',215,05-11-1981,25300,'221',50,'Madeline');
	insert into Employe values (68,'Cleck','Manager',216,05-11-1970,2300,'225',52,'ppls');
	insert into Employe values (69,'Adlin','Chanteur',218,'1981-05-12',1300,'226',10,'Arcule');
	insert into Employe values (70,'ALLEN','ARTISTE',219,05-12-1980,3000,'227',10,'NOVION');
	insert into Employe values (72,'MARTIN','pilote',220,05-12-1940,3080,'228',10,'HINCHE');
	insert into Employe values (71,'Alix','Ouvrier',224,03-02-1949,280,'268',52,'Limbe');
	insert into Employe values (73,'Cliford','Employe',227,03-02-1999,30290,'2890',50,'Milot');
    
    		insert into Commande values (80,12-06-2017,09-05-2017,42,68);
		insert into Commande values (81,'2018/06/03',29-03-2018,40,60);
		insert into Commande values (82,06-03-2018,30-03-2018,41,61);
        
        	insert into DetailCommande values (80,30,6,50);	
	insert into DetailCommande values (81,31,8,100);
	insert into DetailCommande values (82,32,3,150);
    
    

