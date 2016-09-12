---
layout: post
title: "Lokaler Build"
date: 2016-07-16 11:31:11
categories: docker
comments: true
---

# Docker Compose File
 
 Zum leichten starten giebt es ein Docker Compose File im Repository, dieses verbindet die Docker Container.
 
{% ditaa %}
     +----------+
     |          |
     | busybox  |
     |          |
     +-----+----+
           ^
           |
    +------+-------------+
    |                    |
+---+---+       +--------+-----+
|       |       |              |
| nginx |       | jekyll build |
|       |       |              |
+-------+       +--------------+
{% endditaa %}

<!--more-->

## Docker Build

```bash
 
  docker build -t nolte/jekyll . 
  docker run -e JEKYLL_DESTINATION=/tmp nolte/jekyll -c "html_proofer"
  docker run -v /tmp/content:/tmp/jekyll -e JEKYLL_DESTINATION=/tmp/jekyll nolte/jekyll -c "html_proofer"

```