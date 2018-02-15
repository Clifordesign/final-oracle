create table chambre(
	no_chambre int primary key,
	nb_list int,
	no_batiment int,
	no_unite INT,
    foreign key (no_unite) REFERENCES unite(no_unite)
);

create synonym appartement
	for chambre;
    
create table malade(
	no_malade int primary key,
	nom varchar2(15),
	prenom varchar2(15),
	adresse varchar2(15),
	age int,
	contre_indication varchar2(15),
	date_entree date,
	no_chambre int,
    foreign key (no_chambre) references chambre(no_chambre),
	no_batiment int,
    foreign key (no_batiment) references batiment(no_batiment)
);

select * from chambre;


drop table malade;

create synonym patient 
   for malade;
   
create table repas(
	date_repas date,
	type_repas varchar2(15),
	no_malade int references malade(no_malade)
);

create synonym nourriture
	for repas;
    
alter table medicament
	add primary key (reference_medicament);


create table contre_indication(
	nom varchar2(15),
	commentaire varchar2(15),
	reference_medicament varchar2(15) references medicament(reference_medicament)
);

create synonym remede
	for medicament;
    
    create table ne_pas_servir(
	no_malade int references malade(no_malade),
	nom varchar2(15) references medicament(reference_medicament)
	);
    
select * from medicament;

create table incompatibilite(
	reference_medicament varchar2(15),
	reference_medicament1 varchar2(15),
	raison_circonstance varchar2(15),
	constraint fk_incompatibilite foreign key (reference_medicament) references medicament(reference_medicament),
	constraint fk_incompatibilite2 foreign key (reference_medicament1) references medicament(reference_medicament)
);

create table medecin(
	no_medecin int primary key,
	nom_infirmiere varchar2(15),
	no_unite,
	constraint fk_medecin foreign key (no_unite) references unite(no_unite)
);

create synonym docteur
	for medecin;
    
create table infirmiere(
	nom_infirmiere varchar2(15) primary key,
	no_unite integer,
	constraint fk_infirmiere foreign key (no_unite) references unite(no_unite)
);

create synonym assistante
	for infirmiere;

create synonym contradictoire
	for incompatibilite;
    
create table visite(
	date_visite date,
	commentaire varchar2(15),
	no_malade int,
	no_medecin integer,
	constraint fk_visite foreign key (no_malade) references malade(no_malade),
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
	no_malade int,
	nom_infirmiere varchar2(15),
	no_unite integer,
	constraint fk_analyse foreign key (date_visite) references visite(date_visite),
	constraint fk_analyse2 foreign key (no_malade) references malade(no_malade),
	constraint fk_analyse3 foreign key (nom_infirmiere) references infirmiere(nom_infirmiere),
	constraint fk_analyse4 foreign key (no_unite) references unite(no_unite)
);

alter table visite
    add primary key(date_visite);
    
ALTER TABLE infirmiere
    add primary key (nom_infirmiere);

create synonym test
	for analyse;
    
    
ALTER TABLE Infirmiere
    ADD PRIMARY KEY (nom_infirmiere);
    
SELECT * FROM Infirmiere;

CREATE TABLE acte_integerervention(
	heure_date DATE,
	commentaire varchar2(15),
	no_malade INT REFERENCES malade(no_malade),
	nom_infirmiere varchar2(15),
	constraint fk_acte_intervention foreign key (nom_infirmiere) references infirmiere(nom_infirmiere)
    );
    
create synonym assistante
	for infirmiere;

create synonym operation
	for acte_integerervention;

create table ligne_ordonance(
	no_ordonnace int,
	reference_medicament int,
	posologie varchar2(15),
	refus_probleme varchar2(15) check (refus_probleme in ('accepter','refuser')),
	constraint fk_ligne_ordonance foreign key (no_ordonnace) references ordonnace(no_ordonnace),
	constraint fk_ligne_ordonnance foreign key (reference_medicament) references medicament(reference_medicament)
    );
    
create table ordonnance(
	no_ordonnance int primary key,
	date_heure_transmission date,
	date_heure_reception date,
	date_visite date,
	no_malade int,
	constraint fk_ordonnance foreign key (date_visite) references visite(date_visite),
	constraint fk_ordonnance2 foreign key (no_malade) references malade(no_malade)
);

create synonym ligne_prescriprion
	for ligne_ordonance;
    
create table ligne_ordonance(
	no_ordonnance int,
	reference_medicament varchar2(15),
	posologie varchar2(15),
	refus_probleme varchar2(15) check (refus_probleme in ('accepter','refuser')),
	constraint fk_ligne_ordonance foreign key (no_ordonnance) references ordonnance(no_ordonnance),
	constraint fk_ligne_ordonnance foreign key (reference_medicament) references medicament(reference_medicament)
    );

create synonym ligne
	for ligne_ordonance;


create synonym prescription
	for ordonance;
    
create table compostion(
    nom varchar2(15) references medicament(reference_medicament),
    no_malade int references malade(no_malade),
    no_unite int references unite(no_unite),
    commentaire varchar2(15),
    evue date,
    date_heure_effective date,
    resultat varchar2(15)
);

create table composition(
    nom varchar2(15) references medicament(nom_medicament),
    date_composotion date,
    type_repas varchar2(15) references repas(type_repas),
    no_malade int references malade(no_malade)
);

create synonym contenu
	for compostion;
    
create table intervention_prescrite(
    date_visite date references visite(date_visite),
    no_malade int references malade(no_malade),
    no_unite int references unite(no_unite),
    commentaire varchar2(15),
    date_heure_prevue date,
    date_heure_effective date,
    resulatat varchar2(15)
);

create synonym operation_prescrite
    for intervention_prescrite;
