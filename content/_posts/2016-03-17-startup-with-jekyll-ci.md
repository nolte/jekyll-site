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
 Alle Build Jobs nutzen [htmlproofer](https://github.com/gjtorikian/html-proofer) zum überprüfen der generierten Links.
 
<div class="row">
	<div class="col-sm-4">
	<div>
    <strong><a href= "https://travis-ci.org/" >Travis-Ci</a></strong>
    </div>
    <div>
      <a href="https://travis-ci.org/nolte/jekyll-site"><img src="https://travis-ci.org/nolte/jekyll-site.svg?branch=master" alt="status" ></a>
    </div>
    <div>
    <p> Deploy To Github Pages</p>
    </div>
    </div>
	<div class="col-sm-4">
	<div>
    <strong><a href= "https://circleci.com/" >Circle CI</a></strong>
    </div>
    <div>
    <a href="https://circleci.com/gh/nolte/jekyll-site/tree/master"><img src="https://circleci.com/gh/nolte/jekyll-site.svg?style=shield&circle-token=:circle-token" alt="status"></a>
    </div>
    </div>
	<div class="col-sm-4">
	<div>
    <strong><a href= "https://snap-ci.com/" >Snap CI</a></strong>
    </div>
    <div>
    <a href="https://snap-ci.com/nolte/jekyll-site/branch/master"><img src="https://snap-ci.com/nolte/jekyll-site/branch/master/build_image" alt="status"></a>
    </div>
    </div>
</div>


{% ditaa %}
/----+  DAAP /-----+-----+ Audio  /--------+
| PC |<------| RPi | MPD |------->| Stereo |
+----+       +-----+-----+        +--------+
   |                 ^ ^
   |     ncmpcpp     | | mpdroid /---------+
   +--------=--------+ +----=----| Nexus S |
                                 +---------+
{% endditaa %}


### Publishing
 
 Das fertige Artefakt soll auf zwei unterschiedliche weisen Publiziert werden.
 

### to FTP

 Upload auf einen Remote FTP.

### to GitHub Page

 Commit and Publish to GitHub Page Branche.
