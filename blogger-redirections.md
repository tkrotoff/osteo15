# Redirections depuis Blogger

## Documentation

- [Adding meta tags to individual Blogger posts](http://webapps.stackexchange.com/questions/18468)
- [Setting rel=canonical for an individual Blogger post](http://webapps.stackexchange.com/questions/45454)
- [301 Redirect Your Old Blogger Blog to New Address](http://salman-w.blogspot.fr/2013/04/301-redirect-old-blogger-blog-to-new-address.html)
- [Cross-Domain Canonical the New 301 Redirect? - Whiteboard Friday](https://www.youtube.com/watch?v=O8drPXudZZc)
- [SEO consequences of redirecting with META REFRESH](http://stackoverflow.com/questions/5392001)

## Template vide

```HTML
<b:if cond='data:blog.url == "..."'>
  <link rel="canonical" href="..."/>
  <meta http-equiv="refresh" content="0; url=..."/>
<b:else/>
  <b:if cond='data:blog.url == "..."'>
    <link rel="canonical" href="..."/>
    <meta http-equiv="refresh" content="0; url=..."/>
  </b:if>
</b:if>
```

## osteopatheparis15.blogspot.fr

Tous les articles sur une page : http://osteopatheparis15.blogspot.fr/search?max-results=1000

Pas de redirection spécifique pour :
- http://osteopatheparis15.blogspot.fr/2013/07/nouvelle-rubrique-sur-le-site.html
- http://osteopatheparis15.blogspot.fr/2013/07/nouvelle-fiche-sur-google-adresse.html
- http://osteopatheparis15.blogspot.fr/2014/08/bebe-osteopathe-paris.html
- http://osteopatheparis15.blogspot.fr/2014/08/consultation-dosteopathie-mois-daout.html
- http://osteopatheparis15.blogspot.fr/2014/07/osteopathe-paris-15-sur-google.html
- http://osteopatheparis15.blogspot.fr/p/accueil_2751.html

## Résultat

```HTML
<head>
  <!-- ... -->
  <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2013/11/mon-interview-sur-losteopathie-et-les.html"'>
    <link rel="canonical" href="https://osteo15.com/2013/11/22/Interview-sur-l'osteopathie-et-les-femmes-enceintes/"/>
    <meta http-equiv="refresh" content="0; url=https://osteo15.com/2013/11/22/Interview-sur-l'osteopathie-et-les-femmes-enceintes/"/>
  <b:else/>
    <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2013/12/emission-grippe-virus-microbes-la.html"'>
      <link rel="canonical" href="https://osteo15.com/2013/12/10/Emission-sur-la-grippe/"/>
      <meta http-equiv="refresh" content="0; url=https://osteo15.com/2013/12/10/Emission-sur-la-grippe/"/>
    <b:else/>
      <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/01/prise-en-charge-globale-du-patient-une.html"'>
        <link rel="canonical" href="https://osteo15.com/2014/01/27/Prise-en-charge-globale-du-patient/"/>
        <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/01/27/Prise-en-charge-globale-du-patient/"/>
      <b:else/>
        <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/02/le-voyage-psychique-de-la-femme-enceinte.html"'>
          <link rel="canonical" href="https://osteo15.com/2014/02/04/Le-voyage-psychique-de-la-femme-enceinte/"/>
          <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/02/04/Le-voyage-psychique-de-la-femme-enceinte/"/>
        <b:else/>
          <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/02/sports-dhiver-attention-aux.html"'>
            <link rel="canonical" href="https://osteo15.com/2014/02/06/Quelques-conseils-aux-skieurs/"/>
            <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/02/06/Quelques-conseils-aux-skieurs/"/>
          <b:else/>
            <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/02/le-pied-amortisseur.html"'>
              <link rel="canonical" href="https://osteo15.com/2014/02/10/Jogging-le-pied-amortisseur/"/>
              <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/02/10/Jogging-le-pied-amortisseur/"/>
            <b:else/>
              <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/02/les-etirements-focus-sur-ce-que-les.html"'>
                <link rel="canonical" href="https://osteo15.com/2014/02/11/Ce-que-les-etirements-permettent-et-ne-permettent-pas/"/>
                <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/02/11/Ce-que-les-etirements-permettent-et-ne-permettent-pas/"/>
              <b:else/>
                <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/02/osteopathie-en-entreprise-prevention-et.html"'>
                  <link rel="canonical" href="https://osteo15.com/2014/02/11/Prevention-et-gestion-des-troubles-musculosquelettiques-(TMS)/"/>
                  <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/02/11/Prevention-et-gestion-des-troubles-musculosquelettiques-(TMS)/"/>
                <b:else/>
                  <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/02/apres-la-naissance-comment-savoir-si.html"'>
                    <link rel="canonical" href="https://osteo15.com/2014/02/15/Comment-savoir-si-mon-bebe-a-besoin-de-consulter-un-osteopathe/"/>
                    <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/02/15/Comment-savoir-si-mon-bebe-a-besoin-de-consulter-un-osteopathe/"/>
                  <b:else/>
                    <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/02/medicaments-et-natalite-se-site-du-crat.html"'>
                      <link rel="canonical" href="https://osteo15.com/2014/02/17/Medicaments,-grossesse-et-allaitement/"/>
                      <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/02/17/Medicaments,-grossesse-et-allaitement/"/>
                    <b:else/>
                      <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/02/hypnose-paris-tabac-sante-et-therapie.html"'>
                        <link rel="canonical" href="https://osteo15.com/2014/02/19/Questions-reponses-sur-l'hypnose-avec-Delphine-Bourdet/"/>
                        <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/02/19/Questions-reponses-sur-l'hypnose-avec-Delphine-Bourdet/"/>
                      <b:else/>
                        <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/02/stress-et-tension-au-travail-pensez.html"'>
                          <link rel="canonical" href="https://osteo15.com/2014/02/21/Stress-et-tension-au-travail-pensez-a-l'osteopathie-!/"/>
                          <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/02/21/Stress-et-tension-au-travail-pensez-a-l'osteopathie-!/"/>
                        <b:else/>
                          <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/02/fabienne-krotoff-osteopathe-paris-15.html"'>
                            <link rel="canonical" href="https://osteo15.com/2014/02/23/Pourquoi-et-quand-consulter-un-osteopathe/"/>
                            <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/02/23/Pourquoi-et-quand-consulter-un-osteopathe/"/>
                          <b:else/>
                            <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/03/le-ventre-notre-deuxieme-cerveau.html"'>
                              <link rel="canonical" href="https://osteo15.com/2014/03/15/Le-ventre,-notre-deuxieme-cerveau/"/>
                              <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/03/15/Le-ventre,-notre-deuxieme-cerveau/"/>
                            <b:else/>
                              <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/03/sortie-de-maternite-les-recommandations.html"'>
                                <link rel="canonical" href="https://osteo15.com/2014/03/20/Recommandations-sur-la-sortie-de-maternite/"/>
                                <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/03/20/Recommandations-sur-la-sortie-de-maternite/"/>
                              <b:else/>
                                <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/03/cesarienne-la-has-vous-dit-pourquoi-et.html"'>
                                  <link rel="canonical" href="https://osteo15.com/2014/03/21/Ce-qu'il-faut-savoir-sur-la-cesarienne/"/>
                                  <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/03/21/Ce-qu'il-faut-savoir-sur-la-cesarienne/"/>
                                <b:else/>
                                  <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/03/introduction-la-micro-nutrition.html"'>
                                    <link rel="canonical" href="https://osteo15.com/2014/03/25/Introduction-a-la-micronutrition/"/>
                                    <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/03/25/Introduction-a-la-micronutrition/"/>
                                  <b:else/>
                                    <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/04/depistage-precoce-de-la-scoliose-video.html"'>
                                      <link rel="canonical" href="https://osteo15.com/2014/04/06/Video-sur-le-depistage-de-la-scoliose/"/>
                                      <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/04/06/Video-sur-le-depistage-de-la-scoliose/"/>
                                    <b:else/>
                                      <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/04/documentaire-gel-douche-peaux-sensibles.html"'>
                                        <link rel="canonical" href="https://osteo15.com/2014/04/15/Gel-douche,-peaux-sensibles-s'abstenir/"/>
                                        <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/04/15/Gel-douche,-peaux-sensibles-s'abstenir/"/>
                                      <b:else/>
                                        <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/04/calorie-restriction-and-endurance.html"'>
                                          <link rel="canonical" href="https://osteo15.com/2014/04/17/Le-sport-est-bon-aussi-pour-votre-flore-intestinale/"/>
                                          <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/04/17/Le-sport-est-bon-aussi-pour-votre-flore-intestinale/"/>
                                        <b:else/>
                                          <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/04/traitement-osteopathique-de-linertie.html"'>
                                            <link rel="canonical" href="https://osteo15.com/2014/04/18/Traitement-osteopathique-de-l'inertie-colique/"/>
                                            <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/04/18/Traitement-osteopathique-de-l'inertie-colique/"/>
                                          <b:else/>
                                            <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/04/methode-de-gasquet-une-methode-douce.html"'>
                                              <link rel="canonical" href="https://osteo15.com/2014/04/18/La-methode-De-Gasquet-pour-se-preparer-a-l'accouchement-et-retrouver-la-forme-apres/"/>
                                              <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/04/18/La-methode-De-Gasquet-pour-se-preparer-a-l'accouchement-et-retrouver-la-forme-apres/"/>
                                            <b:else/>
                                              <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/04/osteopathie-et-dyskinesie-biliaire.html"'>
                                                <link rel="canonical" href="https://osteo15.com/2014/04/19/Osteopathie-et-dyskinesie-biliaire/"/>
                                                <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/04/19/Osteopathie-et-dyskinesie-biliaire/"/>
                                              <b:else/>
                                                <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/04/osteopathie-pour-les-femmes-enceintes.html"'>
                                                  <link rel="canonical" href="https://osteo15.com/Osteopathie-pour-les-femmes-enceintes/"/>
                                                  <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/04/19/Osteopathie-pour-les-femmes-enceintes/"/>
                                                <b:else/>
                                                  <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/06/osteopathie-et-course-pied.html"'>
                                                    <link rel="canonical" href="https://osteo15.com/2014/06/02/Osteopathie-et-jogging/"/>
                                                    <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/06/02/Osteopathie-et-jogging/"/>
                                                  <b:else/>
                                                    <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/06/osteopathie-et-nouveau-ne.html"'>
                                                      <link rel="canonical" href="https://osteo15.com/2014/06/02/Video-sur-le-traitement-osteopathique-d'un-nouveau-ne/"/>
                                                      <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/06/02/Video-sur-le-traitement-osteopathique-d'un-nouveau-ne/"/>
                                                    <b:else/>
                                                      <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/06/la-barriere-intestinale.html"'>
                                                        <link rel="canonical" href="https://osteo15.com/2014/06/11/La-barriere-intestinale/"/>
                                                        <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/06/11/La-barriere-intestinale/"/>
                                                      <b:else/>
                                                        <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/06/etude-ipsos-les-francais-et-leur.html"'>
                                                          <link rel="canonical" href="https://osteo15.com/2014/06/25/Etude-Ipsos-sur-les-Francais-et-leur-alimentation/"/>
                                                          <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/06/25/Etude-Ipsos-sur-les-Francais-et-leur-alimentation/"/>
                                                        <b:else/>
                                                          <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/07/osteopathe-75015-paris-15-entorse.html"'>
                                                            <link rel="canonical" href="https://osteo15.com/2014/07/04/Entorse-de-cheville-et-arthrose-attention-aux-sequelles/"/>
                                                            <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/07/04/Entorse-de-cheville-et-arthrose-attention-aux-sequelles/"/>
                                                          <b:else/>
                                                            <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/07/osteopathe-paris-15-alimentation-bio.html"'>
                                                              <link rel="canonical" href="https://osteo15.com/2014/07/18/Le-bio-est-meilleur-pour-la-sante/"/>
                                                              <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/07/18/Le-bio-est-meilleur-pour-la-sante/"/>
                                                            <b:else/>
                                                              <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/07/plagiocephalie-osteopathe-75015-paris-15.html"'>
                                                                <link rel="canonical" href="https://osteo15.com/2014/07/24/La-plagiocephalie-positionnelle/"/>
                                                                <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/07/24/La-plagiocephalie-positionnelle/"/>
                                                              <b:else/>
                                                                <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/07/osteopathie-et-lombalgie.html"'>
                                                                  <link rel="canonical" href="https://osteo15.com/2014/07/30/Prise-en-charge-osteopathique-de-la-lombalgie/"/>
                                                                  <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/07/30/Prise-en-charge-osteopathique-de-la-lombalgie/"/>
                                                                <b:else/>
                                                                  <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/08/lombalgie-osteopathie-paracetamol.html"'>
                                                                    <link rel="canonical" href="https://osteo15.com/2014/08/08/Lombalgie-paracetamol-et-osteopathie/"/>
                                                                    <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/08/08/Lombalgie-paracetamol-et-osteopathie/"/>
                                                                  <b:else/>
                                                                    <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/08/osteopathe-paris-canal-lacrymal-bouche.html"'>
                                                                      <link rel="canonical" href="https://osteo15.com/2014/08/17/Le-canal-lacrymal-bouche/"/>
                                                                      <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/08/17/Le-canal-lacrymal-bouche/"/>
                                                                    <b:else/>
                                                                      <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/09/flore-intestinale-et-allergie.html"'>
                                                                        <link rel="canonical" href="https://osteo15.com/2014/09/28/Flore-intestinale-et-allergie-alimentaire/"/>
                                                                        <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/09/28/Flore-intestinale-et-allergie-alimentaire/"/>
                                                                      <b:else/>
                                                                        <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/10/blog-post.html"'>
                                                                          <link rel="canonical" href="https://osteo15.com/2014/10/02/Petition-contre-la-vaccination-massive-des-enfants-contre-les-papillomavirus/"/>
                                                                          <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/10/02/Petition-contre-la-vaccination-massive-des-enfants-contre-les-papillomavirus/"/>
                                                                        <b:else/>
                                                                          <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.fr/2014/12/osteopathie-enfin-les-nouveaux-decrets.html"'>
                                                                            <link rel="canonical" href="https://osteo15.com/2015/01/30/Journal-de-l'UFOF-decembre-2014/"/>
                                                                            <meta http-equiv="refresh" content="0; url=https://osteo15.com/2015/01/30/Journal-de-l'UFOF-decembre-2014/"/>
                                                                          <b:else/>
                                                                            <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2014/12/clue-lappli-gratuite-qui-suit-votre.html"'>
                                                                              <link rel="canonical" href="https://osteo15.com/2014/12/23/Une-appli-qui-suit-votre-cycle-menstruel/"/>
                                                                              <meta http-equiv="refresh" content="0; url=https://osteo15.com/2014/12/23/Une-appli-qui-suit-votre-cycle-menstruel/"/>
                                                                            <b:else/>
                                                                              <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2015/01/lallaitement-maternel-les-bienfaits.html"'>
                                                                                <link rel="canonical" href="https://osteo15.com/2015/01/19/Les-bienfaits-de-l'allaitement/"/>
                                                                                <meta http-equiv="refresh" content="0; url=https://osteo15.com/2015/01/19/Les-bienfaits-de-l'allaitement/"/>
                                                                              <b:else/>
                                                                                <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2015/01/osteopathie-une-therapie-manuelle.html"'>
                                                                                  <link rel="canonical" href="https://osteo15.com/2015/01/24/Principes-et-techniques-de-l'osteopathie/"/>
                                                                                  <meta http-equiv="refresh" content="0; url=https://osteo15.com/2015/01/24/Principes-et-techniques-de-l'osteopathie/"/>
                                                                                <b:else/>
                                                                                  <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2015/01/psychanalyse-linterview-de-mme-ramos.html"'>
                                                                                    <link rel="canonical" href="https://osteo15.com/2015/01/30/Interview-de-la-psychanaliste-Cecile-Ramos/"/>
                                                                                    <meta http-equiv="refresh" content="0; url=https://osteo15.com/2015/01/30/Interview-de-la-psychanaliste-Cecile-Ramos/"/>
                                                                                  <b:else/>
                                                                                    <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2015/01/nouveau-journal-de-lufof.html"'>
                                                                                      <link rel="canonical" href="https://osteo15.com/2015/01/30/Journal-de-l'UFOF-decembre-2014/"/>
                                                                                      <meta http-equiv="refresh" content="0; url=https://osteo15.com/2015/01/30/Journal-de-l'UFOF-decembre-2014/"/>
                                                                                    <b:else/>
                                                                                      <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.fr/2015/02/alerte-au-mercure.html"'>
                                                                                        <link rel="canonical" href="https://osteo15.com/2015/02/03/Alerte-au-mercure/"/>
                                                                                        <meta http-equiv="refresh" content="0; url=https://osteo15.com/2015/02/03/Alerte-au-mercure/"/>
                                                                                      <b:else/>
                                                                                        <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2015/02/ergonomie-au-bureau.html"'>
                                                                                          <link rel="canonical" href="https://osteo15.com/2015/02/05/L'ergonomie-au-bureau/"/>
                                                                                          <meta http-equiv="refresh" content="0; url=https://osteo15.com/2015/02/05/L'ergonomie-au-bureau/"/>
                                                                                        <b:else/>
                                                                                          <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/2015/02/petit-dejeuner-et-cereales.html"'>
                                                                                            <link rel="canonical" href="https://osteo15.com/2015/02/25/Petit-dejeuner-et-cereales/"/>
                                                                                            <meta http-equiv="refresh" content="0; url=https://osteo15.com/2015/02/25/Petit-dejeuner-et-cereales/"/>
                                                                                          <b:else/>

                                                                                            <!-- Pages -->

                                                                                            <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/p/accueil_2751.html"'>
                                                                                              <link rel="canonical" href="https://osteo15.com/"/>
                                                                                              <meta http-equiv="refresh" content="0; url=https://osteo15.com/"/>
                                                                                            <b:else/>
                                                                                              <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/search/label/PARIS%2015%20ost%C3%A9opathe"'>
                                                                                                <link rel="canonical" href="https://osteo15.com/blog/"/>
                                                                                                <meta http-equiv="refresh" content="0; url=https://osteo15.com/blog/"/>
                                                                                              <b:else/>
                                                                                                <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/p/votre-osteopathe.html"'>
                                                                                                  <link rel="canonical" href="https://osteo15.com/Votre-osteopathe/"/>
                                                                                                  <meta http-equiv="refresh" content="0; url=https://osteo15.com/Votre-osteopathe/"/>
                                                                                                <b:else/>
                                                                                                  <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/p/losteopathie_5.html"'>
                                                                                                    <link rel="canonical" href="https://osteo15.com/L'osteopathie/"/>
                                                                                                    <meta http-equiv="refresh" content="0; url=https://osteo15.com/L'osteopathie/"/>
                                                                                                  <b:else/>
                                                                                                    <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/p/on-peut-decouper-une-seance.html"'>
                                                                                                      <link rel="canonical" href="https://osteo15.com/La-consultation/"/>
                                                                                                      <meta http-equiv="refresh" content="0; url=https://osteo15.com/La-consultation/"/>
                                                                                                    <b:else/>
                                                                                                      <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/p/tarif-le-montant-dune-consultation.html"'>
                                                                                                        <link rel="canonical" href="https://osteo15.com/Tarif/"/>
                                                                                                        <meta http-equiv="refresh" content="0; url=https://osteo15.com/Tarif/"/>
                                                                                                      <b:else/>
                                                                                                        <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/p/contact_5.html"'>
                                                                                                          <link rel="canonical" href="https://osteo15.com/Contact/"/>
                                                                                                          <meta http-equiv="refresh" content="0; url=https://osteo15.com/Contact/"/>
                                                                                                        <b:else/>
                                                                                                          <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/p/femme-enceinte.html"'>
                                                                                                            <link rel="canonical" href="https://osteo15.com/Osteopathie-pour-les-femmes-enceintes/"/>
                                                                                                            <meta http-equiv="refresh" content="0; url=https://osteo15.com/Osteopathie-pour-les-femmes-enceintes/"/>
                                                                                                          <b:else/>
                                                                                                            <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/p/osteopathie-pour-les-bebes.html"'>
                                                                                                              <link rel="canonical" href="https://osteo15.com/Osteopathie-pour-les-nourrissons/"/>
                                                                                                              <meta http-equiv="refresh" content="0; url=https://osteo15.com/Osteopathie-pour-les-nourrissons/"/>
                                                                                                            <b:else/>
                                                                                                              <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/p/osteopathie-pour-les-sportifs.html"'>
                                                                                                                <link rel="canonical" href="https://osteo15.com/Osteopathie-pour-les-sportifs/"/>
                                                                                                                <meta http-equiv="refresh" content="0; url=https://osteo15.com/Osteopathie-pour-les-sportifs/"/>
                                                                                                              <b:else/>
                                                                                                                <b:if cond='data:blog.url == "http://osteopatheparis15.blogspot.com/p/osteopathie-pour-les-seniors.html"'>
                                                                                                                  <link rel="canonical" href="https://osteo15.com/Osteopathie-pour-les-seniors/"/>
                                                                                                                  <meta http-equiv="refresh" content="0; url=https://osteo15.com/Osteopathie-pour-les-seniors/"/>
                                                                                                                <b:else/>
                                                                                                                  <link rel="canonical" href="https://osteo15.com/"/>
                                                                                                                  <meta http-equiv="refresh" content="0; url=https://osteo15.com/"/>
                                                                                                                </b:if>
                                                                                                              </b:if>
                                                                                                            </b:if>
                                                                                                          </b:if>
                                                                                                        </b:if>
                                                                                                      </b:if>
                                                                                                    </b:if>
                                                                                                  </b:if>
                                                                                                </b:if>
                                                                                              </b:if>
                                                                                            </b:if>
                                                                                          </b:if>
                                                                                        </b:if>
                                                                                      </b:if>
                                                                                    </b:if>
                                                                                  </b:if>
                                                                                </b:if>
                                                                              </b:if>
                                                                            </b:if>
                                                                          </b:if>
                                                                        </b:if>
                                                                      </b:if>
                                                                    </b:if>
                                                                  </b:if>
                                                                </b:if>
                                                              </b:if>
                                                            </b:if>
                                                          </b:if>
                                                        </b:if>
                                                      </b:if>
                                                    </b:if>
                                                  </b:if>
                                                </b:if>
                                              </b:if>
                                            </b:if>
                                          </b:if>
                                        </b:if>
                                      </b:if>
                                    </b:if>
                                  </b:if>
                                </b:if>
                              </b:if>
                            </b:if>
                          </b:if>
                        </b:if>
                      </b:if>
                    </b:if>
                  </b:if>
                </b:if>
              </b:if>
            </b:if>
          </b:if>
        </b:if>
      </b:if>
    </b:if>
  </b:if>
  <!-- ... -->
</head>
```
