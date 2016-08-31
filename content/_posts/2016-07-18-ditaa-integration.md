---
layout: post
title: "Ditaa Integration"
date: 2016-07-16 11:31:11
categories: jekyll
comments: true
---

 Die integration von [Ditaa](http://ditaa.sourceforge.net/) benötigt eine lauffähige java Umgebung. Um dieses zu Realisieren wurde ein eigenes [Dockerfile](https://github.com/nolte/jekyll-site/blob/master/Dockerfile) angelegt.  
 Die integration in die Jekyll Site findet mit [jekyll-ditaa](https://github.com/matze/jekyll-ditaa) von [matze](https://github.com/matze) in leicht mo­di­fi­zie­rter Version statt. 

<!--more-->

 hüpsche Diagramme aus ascii code :+1:

{% ditaa %}

    +--------+   +-------+    +-------+
    |        | --+ ditaa +--> |       |
    |  Text  |   +-------+    |diagram|
    |Document|   |!magic!|    |       |
    |     {d}|   |       |    |       |
    +---+----+   +-------+    +-------+
        :                         ^
        |       Lots of work      |
        +-------------------------+
{% endditaa %}

 original: 
 
```

    +--------+   +-------+    +-------+
    |        | --+ ditaa +--> |       |
    |  Text  |   +-------+    |diagram|
    |Document|   |!magic!|    |       |
    |     {d}|   |       |    |       |
    +---+----+   +-------+    +-------+
        :                         ^
        |       Lots of work      |
        +-------------------------+
```