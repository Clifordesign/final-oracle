create table malade(
	no_malade int(3) primary key,
	nom varchar2(15),
	prenom varchar2(15),
	adresse varchar2(15),
	age int(3),
	contre_indication varchar2(15),
	date_entree(date),
	no_chambre int(3),
	no_batiment int (3),
	constraint fk_malade  foreign key (no_chambre) references chambre(no_chambre),
	constraint fk_malade2  foreign key (no_batiment) references chambre(no_batiment)
);

create table Plat(
	nom varchar(15)
);

create table repas(
	date_repas(date),
	type_repas varchar2(15),
	no_malade int(3),
	constraint fk_malade3 foreign key (no_malade) references malade(no_malade)
);

create table batiment(
	no_batiment int(3) primary key
);

create table unite_fonctionnel(
	no_unite int(3) primary key,
	nom_unite varchar2(15)
);

create table chambre(
	no_chambre int(3 primary key,
	nb-list int(3),
	no_batiment int(3),
	no_unite int(3),
	constraint fk_chambre foreign key (no_unite) references unite(no_unite)
);

create table medecin(
	no_medecin int(3) primary key,
	nom_infirmiere varchar2(15),
	no_unite
	constraint fk_medecin foreign key (no_unite) references unite(no_unite)
);

create table infirmiere(
	nom_infirmiere varchar2(15),
	no_unite int (5)
	constraint fk_infirmiere foreign key (no_unite) references unite(no_unite)
);

create table visite(
	date_visite date,
	commentaire varchar2(15),
	no_malade int(3),
	no_medecin int (3)
	constraint fk_visite foreign key (no_malde) references malade(no_malde),
	constraint fk_visite2 foreign key (no_medecin) references medecin(no_medecin)
);

create table analyse(
	nom varchar2(15),
	date_heure_prelevement date,
	date_heure_expedition date,
	date_heure_resultat date,
	resultat varchar2(15),
	date_visite date,
	no_malade int(3),
	nom_infirmiere int(3),
	no_unite int (3),
	constraint fk_analyse foreign key (date_visite) references visite(date_visite),
	constraint fk_analyse2 foreign key (no_malade) references malade(no_malade),
	constraint fk_analyse3 foreign key (nom_infirmiere) references infirmiere(nom_infirmiere),
	constraint fk_analyse4 foreign key (no_unite) references unite(no_unite)
);

create table acte_intervention(
	heure_date date,
	commentaire varchar2(15),
	no_malade int(3),
	no_infirmiere int (3),
);

create table ordonnace(
	no_ordonnace int(3) primary key,
	date_heure_transmission date,
	date_heure_reception date,
	date_visite date,
	no_malade int(3),
	constraint fk_ordonnace foreign key (date_visite) references visite(date_visite),
	constraint fk_ordonnace2 foreign key (no_malade) references malade(no_malade)
);

create table medicament(
	reference_medicament varchar2(15),
	inventaire_medicament int(5)
);

create table contre_indication(
	
);