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

create synonym patient 
   for malade;

create table Plat(
	nom varchar(15)
);

create synonym manger
	for plat;

create table repas(
	date_repas(date),
	type_repas varchar2(15),
	no_malade int(3),
	constraint fk_malade3 foreign key (no_malade) references malade(no_malade)
);

create synonym nourriture
	for repas;

create table batiment(
	no_batiment int(3) primary key
);

create synonym maison
	for batiment;

create table unite_fonctionnel(
	no_unite int(3) primary key,
	nom_unite varchar2(15)
);

create synonym unite
	for unite_fonctionnel;

create table chambre(
	no_chambre int(3 primary key,
	nb-list int(3),
	no_batiment int(3),
	no_unite int(3),
	constraint fk_chambre foreign key (no_unite) references unite(no_unite)
);

create synonym appartement
	for chambre;

create table medecin(
	no_medecin int(3) primary key,
	nom_infirmiere varchar2(15),
	no_unite
	constraint fk_medecin foreign key (no_unite) references unite(no_unite)
);

create synonym docteur
	for medecin;

create table infirmiere(
	nom_infirmiere varchar2(15),
	no_unite int (5)
	constraint fk_infirmiere foreign key (no_unite) references unite(no_unite)
);

create synonym assistante
	for infirmiere;

create table visite(
	date_visite date,
	commentaire varchar2(15),
	no_malade int(3),
	no_medecin int (3)
	constraint fk_visite foreign key (no_malde) references malade(no_malde),
	constraint fk_visite2 foreign key (no_medecin) references medecin(no_medecin)
);

create synonym social
	for visite;

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

create synonym test
	for analyse;

create table acte_intervention(
	heure_date date,
	commentaire varchar2(15),
	no_malade int(3),
	no_infirmiere int (3),
);

create synonym operation
	for acte_intervention;

create table ordonnace(
	no_ordonnace int(3) primary key,
	date_heure_transmission date,
	date_heure_reception date,
	date_visite date,
	no_malade int(3),
	constraint fk_ordonnace foreign key (date_visite) references visite(date_visite),
	constraint fk_ordonnace2 foreign key (no_malade) references malade(no_malade)
);

create synonym prescription
	for ordonance;

create table medicament(
	reference_medicament varchar2(15) primary key,
	inventaire_medicament int(5)
);

create synonym remede
	for medicament;

create table contre_indication(
	nom varchar2(15),
	commentaire varchar2(15),
	reference_medicament varchar2(15),
	fk_contre_indication foreign key (reference_medicament) references medicament(reference_medicament)
);

create synonym inconvenant
	for contre_indication;

create table ne_pas_servir(
	no_malade int(3),
	nom varchar2(15),
	constraint fk_ne_pas_servir foreign key (no_malade) references malde (no_malade),
	constraint fk_ne_pas_servir2 foreign key (nom) references malade (nom)
);

create synonym danger
	for ne_pas_servir

create table compostion(

);

create synonym contenu
	for compostion;

create table intervention_prescrite(
	date_visite date,
	no_malade int(3),
	no_unite int(3),
	commentaire varchar2(15),
	date_heure_prevue date,
	date_heure_effective date,
	resultat varchar2(15)
	constraint fk_intervention_prescrite foreign key (date_visite) references visite (date_visite),
	constraint fk_interventionPrescrite2 foreign key (no_malade) references malade (no_malade),
	constraint fk_intervention_prescrite2 foreign key (no_unite) references unite(no_unite)
);

create synonym operation_prescrite
	for intervention_prescrite;

create table ligne_ordonance(
	
):

