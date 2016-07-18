---
layout: post
title:  "Jekyll Ci Playground"
date:   2016-03-17 20:31:11
categories: jekyll
---

# My First Post
 
 Spielprojekt um Jekyll besser kennenzulernen. :+1:  

## Ziel
 
 Das **Ziel** ist es einen Ort zu finden, wo Projektübergreifender *Kram*, gelagert wird.

 * Git Repositories
 * Build Jobs
 * Öffentliche Zugriffspunkte
 * Allgemeine Informationen
  
  
## Bestandteile

 Der Blog Basiert auf:

 * [jekyll](https://jekyllrb.com/){:target="_blank"}
 * [reveal.js](http://lab.hakim.se/reveal-js/){:target="_blank"}
 * [bootstrap](https://getbootstrap.com/){:target="_blank"}
 * [ditaa](http://ditaa.sourceforge.net/){:target="_blank"} 
 * [lightbox2](http://www.lokeshdhakar.com/projects/lightbox2){:target="_blank"} 
 
 
### Build
 
 Der Build soll auf unterschiedlichen Plattformen ausgeführt werden.  
 Alle Build Jobs nutzen [htmlproofer](https://github.com/gjtorikian/html-proofer) zum überprüfen der generierten Links.

<div class="row" markdown="1">
<div class="col-sm-4" markdown="1">
 **[Travis-Ci](https://travis-ci.org/)**  
 [![Build Status](https://travis-ci.org/nolte/jekyll-site.svg?branch={{ site.branche }})](https://travis-ci.org/nolte/jekyll-site)  
 Deploy To Github Pages
</div>
<div class="col-sm-4" markdown="1">
 **[Circle CI](https://circleci.com/)**  
 [![Build Status](https://circleci.com/gh/nolte/jekyll-site/tree/{{ site.branche }}.svg?style=shield&circle-token=:circle-token)](https://circleci.com/gh/nolte/jekyll-site/tree/{{ site.branche }})
</div>  
<div class="col-sm-4" markdown="1">
 **[Snap CI](https://snap-ci.com/)**  
 [![Build Status](https://snap-ci.com/nolte/jekyll-site/branch/{{ site.branche }}/build_image)](https://snap-ci.com/nolte/jekyll-site/branch/{{ site.branche }} )  
 Leider nicht mehr nutzbar seit der umstellung auf Docker Builds :-1: 
</div>
</div>

#### Docker als Buildumgebung

 die Umstellung hat die Builds sehr verlangsamt ...

{:.table}
| CI System | ohne docker | mit docker und ditaa | mit docker image und ditaa | 
|-----------|-------------|----------------------|----------------------|
| Snap CI   | ~ 40 sec    | /                    | /                    |
| Travis-Ci | ~ 1:09 Min  | ~ 3:20 Min           | ~ 1:20 Min           |
| Circle CI | ~ 3:08 Min  | ~ 5:22 Min           | ~ 3:22 Min           |


### Publishing
 
 Das fertige Artefakt soll auf zwei unterschiedliche weisen Publiziert werden.

### to FTP

 Upload auf einen Remote FTP.

### to GitHub Page

 Commit and Publish to GitHub Page Branche.
