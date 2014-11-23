# Osteo15 blog

Jekyll version 2.5.1

```Shell
gem install jekyll
gem install i18n # Dates en français
jekyll serve
open http://localhost:4000
```

## Les URLs ne doivent pas contenir certains caractères

Par exemple, les espaces ne sont pas autorisés : [HTML href syntax: is it okay to have space in file name?](http://stackoverflow.com/questions/4172579).
Il faut utiliser [cgi_escape](http://jekyllrb.com/docs/templates/).

Exemple :
```HTML
<!-- site.address = "8 rue Desnouettes Paris 15" -->
<a href="http://maps.apple.com/?q={{ site.address | cgi_escape }}">{{ site.address }}</a>
<!--
  URL générée : "http://maps.apple.com/?q=8+rue+Desnouettes+Paris+15"
  au lieu de : "http://maps.apple.com/?q=8 rue Desnouettes Paris 15"
-->
```

## Utilisation de post_url

Pour générer un lien vers un post, il faut utiliser la fonction [post_url](http://jekyllrb.com/docs/templates/#post-url) de Jekyll.

## Les fichiers ne doivent pas contenir d'accents

post_url ne fonctionne pas avec des accents (:-/), exemple :
```Markdown
<!-- Fonctionne -->
[la micronutrition]({% post_url 2014-03-25-Introduction-a-la-micronutrition %})

<!-- Ne fonctionne pas -->
[la micronutrition]({% post_url 2014-03-25-Introduction-à-la-micronutrition %})
```

Pareil pour les assets (images et autres fichiers) (problème détecté sous Ubuntu 14.10 x64, Ruby 2.1.0, Jekyll 2.4.0) :
```Markdown
<!-- Fonctionne -->
![Schéma déroulement consultation](/assets/2014-08-20/Deroulement-consultation.png)

<!-- Ne fonctionne pas -->
![Schéma déroulement consultation](/assets/2014-08-20/Déroulement consultation.png)
```

## Formats des images

- Le format non destructeur [PNG](http://fr.wikipedia.org/wiki/Portable_Network_Graphics) (.png) adapté pour les images simples comprenant des aplats de couleurs
- Le format destructeur [JPEG](http://fr.wikipedia.org/wiki/JPEG) (.jpg) pour la photographie

## Intégration d'une video YouTube

```HTML
<div class="responsive-iframe">
  <iframe src="//www.youtube.com/embed/VJo5z11rUYQ" frameborder="0" allowfullscreen></iframe>
</div>
```

## Caractères alacon

- ’ -> '
- … -> ...
- oe -> œ

## Favicon

- https://github.com/audreyr/favicon-cheat-sheet
- [Apple - Configuring Web Applications](https://developer.apple.com/library/iad/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html)
- [Chrome - Add to Homescreen](https://developer.chrome.com/multidevice/android/installtohomescreen)
- [W3C HTML5 - Link type "icon"](http://www.w3.org/TR/html5/links.html#rel-icon)

```Shell
# Pour créer une image ICO avec ImageMagick
convert hand-16.png hand-32.png hand-48.png hand-16-32-48.ico
```
