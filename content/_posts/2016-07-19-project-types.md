---
layout: post
title: "Project Types"
date: 2016-07-19 11:31:11
categories: iot
comments: true
---

 Durch den Aufbau der Hausautomatisierung, war es nötig die kleine feine Java Welt zu verlassen. Die Meisten Projekte werden durch die Verwendung von Docker untestützt. 





<!--more-->


# Übersicht

 Durch die Github Webhooks und Keen.io lassen sich die Projekte tracken ;)  

## Projekte nach Typ
<div id="chart"></div>

## Liste der Projekte

<div class="row">
	<div class="col-sm-6">
		<div id="projects"></div>
	</div>
	<div class="col-sm-6">
		<p>Github Projekte</p>
		<span>Alle projekte sind auf <a href="https://github.com/nolte">GitHub</a> zu finden, mit mehr oder wenieger guten Dokumentation...</span>
	</div>
</div>

 

<script>
$( document ).ready(function() {
	
	  var client = new Keen({
	      projectId: "{{ site.keen_projectId }}",
	      readKey: "{{ site.keen_api_readKey }}"
	  });
Keen.ready(function(){
    var el = document.getElementById("chart");
    var chart = new Keen.Dataviz()
        .el(el)
        .chartType('piechart')
        .height(400)
        .prepare();

    client.run('git-push-project-count-by-language', function(err, res){
       chart
           .parseRequest(this)
           .call(function(){
               var ds, df, line;
               ds = new google.visualization.arrayToDataTable(this.data());
               
               var options = {
            	        title: 'Project Count by Languages',
            	      };
               line = new google.visualization.PieChart(this.el());
               line.draw(ds,options);
           });
    });
});
Keen.ready(function(){
    var el = document.getElementById("projects");
    var chart = new Keen.Dataviz()
        .el(el)
        .chartType('piechart')
        .height(400)
        .prepare();

    client.run('git-push-count-by-project', function(err, res){
       chart
           .parseRequest(this)
           .call(function(){
               var ds, df, line;
               ds = new google.visualization.arrayToDataTable(this.data());
               var options = {
            	        sortColumn: 1,
            	        sortAscending: false,
            	        
            	      };
               line = new google.visualization.Table(this.el());
               line.draw(ds,options);
           });
    });
});
});
</script> 