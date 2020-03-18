# Osteo15 blog

[osteo15.com](https://osteo15.com/)

```Shell
xcode-select --install # Installation de Xcode command line developer tools
sudo gem install bundler

bundle install
bundle update

bundle exec jekyll serve --host 0.0.0.0 --port 4000
open http://localhost:4000

bundle exec rake -T # Liste des tasks Rake
bundle exec rake clean # Supprime les fichiers générés
bundle exec rake build # Build sans minification (=dev)
bundle exec rake checkstyle # Vérifie diverses règles en rapport avec le style
bundle exec rake build[production] # Build avec minification du code HTML et CSS (=production)
bundle exec rake deploy # Déploiement sur Amazon S3
```

```Shell
brew install vnu
vnu --skip-non-html _site

sudo gem install html-proofer
htmlproofer ./_site --check-html --check-favicon --check-opengraph

sudo gem install validate-website
cd _site && validate-website-static --site 'https://osteo15.com' --verbose --markup --not-found && cd ..
validate-website --site 'https://osteo15.com' --verbose --markup --not-found

sudo gem install site_validator
site_validator https://osteo15.com site_validator-report.html
open site_validator-report.html
```

Git hooks:
```Shell
ln -s -f ../../git-hooks/pre-commit .git/hooks/pre-commit
ln -s -f ../../git-hooks/pre-push .git/hooks/pre-push
```

## Utilisation de post_url

Pour générer un lien vers un post, il faut utiliser la fonction [post_url](http://jekyllrb.com/docs/templates/#post-url) de Jekyll :
```HTML
{% post_url 2014-08-08-Lombalgie-paracetamol-et-osteopathie %}
voir [l'article sur la lombalgie et le paracétamol]({% post_url 2014-08-08-Lombalgie-paracetamol-et-osteopathie %})
```

## Le problème des caractères spéciaux

### Nom des fichiers

Windows interdit les caractères [`\/:*?"<>|`](https://msdn.microsoft.com/en-us/library/aa365247), exemple :
- KO : `2014-04-18-La-methode-"De-Gasquet"-pour-se-preparer-a-l'accouchement-et-retrouver-la-forme-apres.md`
- OK : `2014-04-18-La-methode-De-Gasquet-pour-se-preparer-a-l'accouchement-et-retrouver-la-forme-apres.md`

Le caractère `?` est replacé par `%3F` dans les URLs, ce qui est à éviter :
- KO : `2014-08-21-Bebe-:-quand-consulter-un-osteopathe-?.md` => `/2014/08/21/Bebe-:-quand-consulter-un-osteopathe-%3F/`
- OK : `2014-08-21-Bebe-quand-consulter-un-osteopathe.md` => `/2014/08/21/Bebe-quand-consulter-un-osteopathe/`

[Jekyll crash](https://github.com/jekyll/jekyll/issues/2834) si le nom d'un fichier comporte `:` :
- KO : `2014-02-10-Jogging-:-le-pied-amortisseur.md`
- OK : `2014-02-10-Jogging-le-pied-amortisseur.md`

Liste des caractères valides pour une URL : [`ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~:/?#[]@!$&'()*+,;=`](https://stackoverflow.com/q/1547899)

### URLs

Par exemple, les espaces ne sont pas autorisés : [HTML href syntax: is it okay to have space in file name?](https://stackoverflow.com/q/4172579).
Il faut utiliser [cgi_escape](http://jekyllrb.com/docs/templates/).

Exemple :
```HTML
<!-- site.address_short = "7 rue de Langeac Paris 15" -->
<a href="http://maps.apple.com/?q={{ site.address_short | cgi_escape }}">{{ site.address_short }}</a>
<!--
  URL générée : "http://maps.apple.com/?q=7+rue+de+Langeac+Paris+15"
  au lieu de : "http://maps.apple.com/?q=7 rue de Langeac Paris 15"
-->
```

post_url ne fonctionne pas avec des accents, exemple :
```Markdown
<!-- KO -->
[la micronutrition]({% post_url 2014-03-25-Introduction-à-la-micronutrition %})

<!-- OK -->
[la micronutrition]({% post_url 2014-03-25-Introduction-a-la-micronutrition %})
```

Pareil pour les assets (images et autres fichiers) (problème détecté sous Ubuntu 14.10 x64, Ruby 2.1.0, Jekyll 2.4.0) :
```Markdown
<!-- KO -->
![Schéma déroulement consultation](/assets/2014-08-20/Déroulement consultation.png)

<!-- OK -->
![Schéma déroulement consultation](/assets/2014-08-20/Deroulement-consultation.png)
```

## Formats des images

- Le format non destructeur [PNG](http://fr.wikipedia.org/wiki/Portable_Network_Graphics) (.png) adapté pour les images simples comprenant des aplats de couleurs
- Le format destructeur [JPEG](http://fr.wikipedia.org/wiki/JPEG) (.jpg) pour la photographie

## Figures

```HTML
{% include figure.html src="/assets/2014-03-15/Le-ventre-notre-deuxieme-cerveau.jpg" caption='Affiche du documentation "Le ventre, notre deuxième cerveau"' href="http://future.arte.tv/fr/le-ventre" %}
```

```HTML
{% include figure.html src="/assets/2014-04-15/Gel-douche,-peaux-sensibles-s'abstenir.jpg" caption="Affiche du documentation \"Gel douche, peaux sensibles s'abstenir\"" href="http://www.france5.fr/emission/gel-douche-peaux-sensibles-sabstenir/diffusion-du-13-04-2014-20h35" %}
```

```HTML
<figure>
  <img src="/assets/2014-07-30/Lombalgies-symptomatiques.png" alt="Lombalgies symptomatiques">
  <figcaption markdown="1">
  Lombalgies symptomatiques [^2]
  </figcaption>
</figure>
```

## Grille HTML

Voir la documentation de Bootstrap : http://getbootstrap.com/css/#grid

## Intégration d'une vidéo

```HTML
{% include embed-responsive-4by3.html src="https://www.youtube.com/embed/VJo5z11rUYQ" %}
```

## Intégration d'une carte Google Maps

```HTML
<div class="row">
  <div class="col-md-10">
    <div class="embed-responsive embed-responsive-4by3">
      <iframe src="https://www.google.com/maps/embed?..."></iframe>
    </div>
  </div>
</div>
```

## Caractères alacon

- ’ -> '
- “ ” « » -> "
- … -> ...
- oe -> œ
- °

Voir Character Entities Cheat Sheet : http://brajeshwar.github.io/entities/

## Conventions de style

- http://fr.wikipedia.org/wiki/Wikip%C3%A9dia:Conventions_de_style
- http://en.wikipedia.org/wiki/Wikipedia:Manual_of_Style

## Tags/hashtags

Règles sur Twitter :
- 1 seul mot court en lowercase : #sport
- Accents autorisés : #ostéopathie #osteopathie
- Mot composé sans espace ni ponctuation : #FemmeEnceinte
- Les hashtags sont insensibles à la case : #sport #Sport
- Pas plus de 2 tags par tweet
- Ne pas utiliser un hashtag controversé ou lié à une polémique
- Jekyll YAML Front Matter: `tags: [ostéopathie, TMS]`

## Favicon

- [FaviconTest](https://github.com/tkrotoff/FaviconTest)

## Sitemap

- [Jekyll Sitemap Generator Plugin](https://github.com/jekyll/jekyll-sitemap)
- [Building a Better Sitemap.xml with Jekyll](http://davidensinger.com/2013/11/building-a-better-sitemap-xml-with-jekyll/)
- [Sitemaps XML format](http://www.sitemaps.org/protocol.html)
- [Rakefile example for Jekyll](https://github.com/chrisanthropic/slim-pickins-jekyll-theme/blob/master/Rakefile)

## Hébergement

Amazon Simple Storage Service (S3), Route 53 DNS, CloudFront CDN

- [Hosting a Static Website on Amazon Web Services](http://docs.aws.amazon.com/gettingstarted/latest/swh/website-hosting-intro.html)
- [Hosting a static (Jekyll) blog on Amazon S3](http://www.savjee.be/2013/02/howto-host-jekyll-blog-on-amazon-s3/)
- [Enable gzip for Jekyll blogs on Amazon S3](http://www.savjee.be/2014/03/Jekyll-to-S3-deploy-script-with-gzip/)
- [Static website on S3, CloudFront and Route 53, the right way!](http://www.michaelgallego.fr/blog/2013/08/27/static-website-on-s3-cloudfront-and-route-53-the-right-way/)
- [Avoiding the Duplicate Content Penalty with AWS S3 and CloudFront](https://bryce.fisher-fleig.org/blog/avoiding-duplicate-content-penalty-with-aws-s3-and-cloudfront/)

## SEO

### Outils

- [Google Webmaster](https://www.google.com/webmasters/)
- [Bing Webmaster Tools](http://www.bing.com/toolbox/webmaster)
- [WebPage Test - Test a website's performance](http://www.webpagetest.org/)
- [GTmetric - Perfomance Analysis](http://gtmetrix.com/)
- [Pingdom Speed Test](http://tools.pingdom.com/fpt/)
- [Improving your Blog visibility](http://blog.penso.info/2015/03/21/improve-blog-visibility/)
- [24 outils pour mesurer et optimiser les temps de chargement de votre site web](http://korben.info/23-outils-pour-mesurer-et-optimiser-les-temps-de-chargement-de-votre-site-web.html)

### Documentation

- [Google - Search Engine Optimization Starter Guide](https://www.google.com/webmasters/docs/search-engine-optimization-starter-guide.pdf)
- [OpenClassrooms - Améliorez la visibilité de votre site grâce au référencement](http://openclassrooms.com/courses/ameliorez-la-visibilite-de-votre-site-grace-au-referencement)
- [SEO Best Practices 2014](http://www.slideshare.net/PierreMFioriniPhD/seo-best-practices-for-2014-beyond-dd)

## Minification

- [Octopress Minify Html](https://github.com/octopress/minify-html)
- [Speeding up Jekyll site](http://dmytro.github.io/2013/10/29/optimizing_jekyll.html)
- [How I use Reduce to Minify and Optimize Assets for Production](http://davidensinger.com/2013/08/how-i-use-reduce-to-minify-and-optimize-assets-for-production/)

## Optimisation des images

- [ImageOptim](https://imageoptim.com/)
- [image_optim](https://github.com/toy/image_optim)
- [image_optim-jekyll-plugin](https://github.com/chrisanthropic/image_optim-jekyll-plugin)

## Validation du site

- [Jekyll - The Test script](http://jekyllrb.com/docs/continuous-integration/#the-test-script)
- [HTML::Proofer](https://github.com/gjtorikian/html-proofer)
- [validate-website](https://github.com/spk/validate-website)

## Multilingue

- [Jekyll: Multilingual](http://kleinfreund.de/en/2014/08/jekyll-multilingual/)

## Meta data

- [GitHub davidensinger.github.io](https://github.com/davidensinger/davidensinger.github.io/blob/source/app/_includes/header.html)
- [Adding schema.org metadata to Jekyll](http://veithen.github.io/2014/11/17/jekyll-schema-org-metadata.html)

### Outils

- [Google Structured Data Testing Tool](https://developers.google.com/structured-data/testing-tool/)
- [Google+ Snippet](https://developers.google.com/+/web/snippet/)
- [Facebook Debugger](https://developers.facebook.com/tools/debug/)
- [Twitter card validator](https://cards-dev.twitter.com/validator)
- [Structured Data Linter](http://linter.structured-data.org/)
- [Yandex Structured data validator](https://webmaster.yandex.com/microtest.xml)

## Emuler Android stock browser

Installer Android Studio

```Shell
./Library/Android/sdk/tools/android
./Library/Android/sdk/tools/android avd
```
