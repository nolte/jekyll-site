---
layout: post
title:  "Jekyll Ci Playground"
date:   2016-03-17 20:31:11
categories: jekyll update
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
 
### Build
 
 Der Build soll auf unterschiedlichen Plattformen ausgeführt werden.

#### Travis CI
 
 **URL:** [Travis-Ci](https://travis-ci.org/){:target="_blank"}

 [![Build Status](https://travis-ci.org/nolte/jekyll-site.svg?branch=master)](https://travis-ci.org/nolte/jekyll-site)

#### Circle CI
  
  **URL:** [CircleCi](https://circleci.com){:target="_blank"}
  
  [![Build Status](https://circleci.com/gh/:owner/:repo.svg?style=shield&circle-token=:circle-token)](https://circleci.com/gh/nolte/jekyll-site)
 

#### Snap CI

  **URL:** [snap-ci](https://snap-ci.com){:target="_blank"}

 [![Build Status](https://snap-ci.com/nolte/jekyll-site/branch/master/build_image)](https://snap-ci.com/nolte/jekyll-site/branch/master) 



### Publishing
 
 Das fertige Artefakt soll auf zwei unterschiedliche weisen Publiziert werden.
 

### to FTP

 Upload auf einen Remote FTP.

### to GitHub Page

 Commit and Publish to GitHub Page Branche.
