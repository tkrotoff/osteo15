# Osteo15 blog

Jekyll version 2.5.1

```Shell
sudo gem install bundler
bundle install
bundle update

bundle exec jekyll serve --host 0.0.0.0 --port 4000
open http://localhost:4000

bundle exec rake build # Build sans minification (=dev)
bundle exec rake build[production] # Build avec minification du code HTML et CSS (=production)
bundle exec rake test # Lance The Nu HTML Checker (v.Nu), validate-website et HTML::Proofer
bundle exec rake deploy # Déploiement sur Amazon S3
```

## Utilisation de post_url

Pour générer un lien vers un post, il faut utiliser la fonction [post_url](http://jekyllrb.com/docs/templates/#post-url) de Jekyll :
```HTML
{% post_url 2014-08-08-Lombalgie-paracetamol-et-osteopathie %}
```

## Le problème des caractères spéciaux

### Nom des fichiers

Windows interdit les caractères `\/:*?"<>|`, exemple :
- OK : `2014-04-18-La-methode-De-Gasquet-pour-se-preparer-a-l'accouchement-et-retrouver-la-forme-apres.md`
- KO : `2014-04-18-La-methode-"De-Gasquet"-pour-se-preparer-a-l'accouchement-et-retrouver-la-forme-apres.md`

Le caractère `?` est replacé par `%3F` dans les URLs, ce qui est à éviter :
- OK : `2014-08-21-Bebe-:-quand-consulter-un-osteopathe-?.md` => `/2014/08/21/Bebe-:-quand-consulter-un-osteopathe-%3F/`
- KO : `2014-08-21-Bebe-quand-consulter-un-osteopathe.md` => `/2014/08/21/Bebe-quand-consulter-un-osteopathe/`

[Jekyll crash](https://github.com/jekyll/jekyll/issues/2834) si le nom d'un fichier comporte `:` :
- OK : `2014-02-10-Jogging-le-pied-amortisseur.md`
- KO : `2014-02-10-Jogging-:-le-pied-amortisseur.md`

### URLs

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

post_url ne fonctionne pas avec des accents, exemple :
```Markdown
<!-- OK -->
[la micronutrition]({% post_url 2014-03-25-Introduction-a-la-micronutrition %})

<!-- KO -->
[la micronutrition]({% post_url 2014-03-25-Introduction-à-la-micronutrition %})
```

Pareil pour les assets (images et autres fichiers) (problème détecté sous Ubuntu 14.10 x64, Ruby 2.1.0, Jekyll 2.4.0) :
```Markdown
<!-- OK -->
![Schéma déroulement consultation](/assets/2014-08-20/Deroulement-consultation.png)

<!-- KO -->
![Schéma déroulement consultation](/assets/2014-08-20/Déroulement consultation.png)
```

## Formats des images

- Le format non destructeur [PNG](http://fr.wikipedia.org/wiki/Portable_Network_Graphics) (.png) adapté pour les images simples comprenant des aplats de couleurs
- Le format destructeur [JPEG](http://fr.wikipedia.org/wiki/JPEG) (.jpg) pour la photographie

## Grille HTML

Voir la documentation de Bootstrap : http://getbootstrap.com/css/#grid

## Intégration d'une video YouTube

```HTML
<div class="row">
  <div class="col-sm-2"></div>
  <div class="col-sm-8">
    <p>
      <div class="embed-responsive embed-responsive-4by3">
        <iframe src="https://www.youtube.com/embed/VJo5z11rUYQ" allowfullscreen></iframe>
      </div>
    </p>
  </div>
  <div class="col-sm-2"></div>
</div>
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

Voir Character Entities Cheat Sheet: http://brajeshwar.github.io/entities/

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
