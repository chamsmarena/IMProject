//v1

create view listeactualite as select 
ca.TYPE_CATEG_ACTU AS TYPE_CATEG_ACTU,
ca.TITRE_CATEG_ACTU AS TITRE_CATEG_ACTU,
ad0.CODE_A0 AS CODE_A0,
ad0.CAPTION_A0 AS CAPTION_A0,
ad0.COORD_X_A0 AS COORD_X_A0,
ad0.COORD_Y_A0 AS COORD_Y_A0,
ad1.CODE_A1 AS CODE_A1,
ad1.CAPTION_A1 AS CAPTION_A1,
ad1.COORD_X_A1 AS COORD_X_A1,
ad1.COORD_Y_A1 AS COORD_Y_A1,
a.TITRE_ACTUALITE AS TITRE_ACTUALITE,
a.DETAIL_ACTUALITE AS DETAIL_ACTUALITE,
a.DATE_ACTUALITE AS DATE_ACTUALITE,
a.ID_LANGUE,
a.VALEUR AS VALEUR,
ad0.ID_A0,
ca.ID_CATEG_ACTU
from actualite a 
join categorie_actualite ca on ca.ID_CATEG_ACTU = a.ID_CATEG_ACTU
 join admin_1 ad1 on ad1.ID_A1 = a.ID_A1
 join admin_0 ad0 on ad0.ID_A0 = ad1.ID_A0
 
 
 /* v2 20/04/2017 */
create view listeactualite as select 
ca.TYPE_CATEG_ACTU AS TYPE_CATEG_ACTU,
ca.TITRE_CATEG_ACTU AS TITRE_CATEG_ACTU,
ad0.CODE_A0 AS CODE_A0,
ad0.CAPTION_A0 AS CAPTION_A0,
ad0.COORD_X_A0 AS COORD_X_A0,
ad0.COORD_Y_A0 AS COORD_Y_A0,
ad1.CODE_A1 AS CODE_A1,
ad1.CAPTION_A1 AS CAPTION_A1,
ad1.COORD_X_A1 AS COORD_X_A1,
ad1.COORD_Y_A1 AS COORD_Y_A1,
a.TITRE_ACTUALITE AS TITRE_ACTUALITE,
a.DETAIL_ACTUALITE AS DETAIL_ACTUALITE,
a.DATE_ACTUALITE AS DATE_ACTUALITE,
a.ID_LANGUE,
'0' AS VALEUR,
ad0.ID_A0,
ca.ID_CATEG_ACTU,
m.CODE_MENACE,
m.TITRE_MENACE
from actualite a 
join categorie_actualite ca on ca.ID_CATEG_ACTU = a.ID_CATEG_ACTU
join menaces m on m.ID_MENACE = a.ID_MENACE
 join admin_1 ad1 on ad1.ID_A1 = a.ID_A1
 join admin_0 ad0 on ad0.ID_A0 = ad1.ID_A0
 
 
  /* v3 27/04/2017 */
create view listeactualite as select 
ca.TYPE_CATEG_ACTU AS TYPE_CATEG_ACTU,
ca.TITRE_CATEG_ACTU AS TITRE_CATEG_ACTU,
ad0.CODE_A0 AS CODE_A0,
ad0.CAPTION_A0 AS CAPTION_A0,
ad0.COORD_X_A0 AS COORD_X_A0,
ad0.COORD_Y_A0 AS COORD_Y_A0,
ad1.CODE_A1 AS CODE_A1,
ad1.CAPTION_A1 AS CAPTION_A1,
ad1.COORD_X_A1 AS COORD_X_A1,
ad1.COORD_Y_A1 AS COORD_Y_A1,
a.TITRE_ACTUALITE AS TITRE_ACTUALITE,
a.DETAIL_ACTUALITE AS DETAIL_ACTUALITE,
a.DATE_ACTUALITE AS DATE_ACTUALITE,
a.ID_LANGUE,
'0' AS VALEUR,
ad0.ID_A0,
ca.ID_CATEG_ACTU,
m.CODE_MENACE,
m.TITRE_MENACE,
t.ID_TAG,
t.CODE_TAG,
t.LIBELLE_TAG,
a.ID_ACTUALITE
from actualite a 
join categorie_actualite ca on ca.ID_CATEG_ACTU = a.ID_CATEG_ACTU
join menaces m on m.ID_MENACE = a.ID_MENACE
 join admin_1 ad1 on ad1.ID_A1 = a.ID_A1
 join admin_0 ad0 on ad0.ID_A0 = ad1.ID_A0
 join r_actualite_avoir_tag aat on aat.ID_ACTUALITE = a.ID_ACTUALITE
 join tag t on t.ID_TAG = aat.ID_TAG
 
 
 
   /* v4 05/05/2017 */
create view listeactualite as select 
ca.TYPE_CATEG_ACTU AS TYPE_CATEG_ACTU,
ca.TITRE_CATEG_ACTU AS TITRE_CATEG_ACTU,
ad0.CODE_A0 AS CODE_A0,
ad0.CAPTION_A0 AS CAPTION_A0,
ad0.COORD_X_A0 AS COORD_X_A0,
ad0.COORD_Y_A0 AS COORD_Y_A0,
ad1.CODE_A1 AS CODE_A1,
ad1.CAPTION_A1 AS CAPTION_A1,
ad1.COORD_X_A1 AS COORD_X_A1,
ad1.COORD_Y_A1 AS COORD_Y_A1,
a.TITRE_ACTUALITE AS TITRE_ACTUALITE,
a.DETAIL_ACTUALITE AS DETAIL_ACTUALITE,
a.DATE_ACTUALITE AS DATE_ACTUALITE,
a.ID_LANGUE,
'0' AS VALEUR,
ad0.ID_A0,
ca.ID_CATEG_ACTU,
m.CODE_MENACE,
m.TITRE_MENACE,
t.ID_TAG,
t.CODE_TAG,
t.LIBELLE_TAG,
a.ID_ACTUALITE,
l.LIBELLE_LIEU,
ad0Lieu.CAPTION_A0 AS CAPTION_A0Lieu,
ad0Lieu.COORD_X_A0 AS COORD_X_A0Lieu,
ad0Lieu.COORD_Y_A0 AS COORD_Y_A0Lieu,
ad1Lieu.CODE_A1 AS CODE_A1Lieu,
ad1Lieu.CAPTION_A1 AS CAPTION_A1Lieu,
ad1Lieu.COORD_X_A1 AS COORD_X_A1Lieu,
ad1Lieu.COORD_Y_A1 AS COORD_Y_A1Lieu
from actualite a 
join categorie_actualite ca on ca.ID_CATEG_ACTU = a.ID_CATEG_ACTU
join menaces m on m.ID_MENACE = a.ID_MENACE
join admin_1 ad1 on ad1.ID_A1 = a.ID_A1
join admin_0 ad0 on ad0.ID_A0 = ad1.ID_A0
join r_actualite_avoir_tag aat on aat.ID_ACTUALITE = a.ID_ACTUALITE
join tag t on t.ID_TAG = aat.ID_TAG
left join lieu l on l.ID_LIEU=a.ID_LIEU
left join admin_1 ad1Lieu on ad1Lieu.ID_A1 = l.ID_A1
left join admin_0 ad0Lieu on ad1Lieu.ID_A0 = ad0Lieu.ID_A0

Create view Localisation as 
SELECT l.ID_LIEU,l.LIBELLE_LIEU,a1.ID_A1,a1.CAPTION_A1,a0.ID_A0,a0.CAPTION_A0,a0.CODE_A0 FROM lieu l
inner join admin_1 a1 on a1.ID_A1 = l.ID_A1
inner join admin_0 a0 on a0.ID_A0 = a1.ID_A0

create view Capitales as 
SELECT a0.ID_A0,a0.CODE_A0,a1.ID_A1,a1.CAPTION_A1 FROM admin_0 a0
inner join admin_1 a1 on a1.ID_A0 = a0.ID_A0
where a1.EST_CAPITALE = true