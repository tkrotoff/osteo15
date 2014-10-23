# Osteo15 blog

Jekyll version 2.4.0

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
