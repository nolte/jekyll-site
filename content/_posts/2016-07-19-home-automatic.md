---
layout: post
title: "Hausautomatisierung"
date: 2016-07-19 11:31:11
categories: iot
comments: true
---

 Die wichtiegsten Elemente der Hausautomatisierung sind:
 
* [home-assistant.io](https://home-assistant.io/) als HA Software mit Rest API.
* [Rabbit MQ](https://www.rabbitmq.com/) als MQTT Broker
  * [MQTT Adapter](https://www.rabbitmq.com/mqtt.html)
* [FireTV Server](https://github.com/happyleavesaoc/python-firetv)  
* [Mopidy](https://www.mopidy.com/)
* [Logitech Harmony](http://www.logitech.com/de-de/harmony-remotes)

# Überblick

 Übersicht der Services

{% ditaa %}
{% include /images/homeassistant.ditaa %}
{% endditaa %}

<!--more-->

## Hardware

* 1x RPI2
  * [home-assistant.io](https://home-assistant.io/)
  * [Rabbit MQ](https://www.rabbitmq.com/mqtt.html)
  * [FireTV Server](https://github.com/happyleavesaoc/python-firetv) (optional)
  * InfluxDB (optional)
* 1x RPI2 (optional)
  * [Mopidy](https://www.mopidy.com/)
  * MongoDB
* FireTV (optional)
  * [Kodi](https://kodi.tv/)
* FritzBox als NFS (optional)
* 1x Arduino mit ETHShield 
  * IR-Receiver

## Software

### Home-Assistant.io
  
  [home-assistant](https://home-assistant.io/) ist der Zentrale Punkt über welchen die Steuerung passiert.   
  Die für den Einsatz empfehle ich die [Docker Images](https://hub.docker.com/u/homeassistant/). 
  
### MQTT

  

### Mopidy

## Zugriff

 Der Zugriff auf die Hausautomatisierung muss auf unterschiedliche Arten stattfinden.

### Weboberfläche

 Die Weboberfläche ist mobile fähig :+1: [Online Demo](https://home-assistant.io/demo/).
 
 
### RestAPI

 Genutzt für die Integration von NFC mit Hilfe von den Android Apps:
 
* [Trigger](https://play.google.com/store/apps/details?id=com.jwsoft.nfcactionlauncher)
* [Tasker](https://play.google.com/store/apps/details?id=net.dinglisch.android.taskerm) 

### MQTT Events 
 
 Wird genutzt um die Events von den Mikrocontrollern entgegen zunehmen.
 

## Anwendungsgebiet

### IR Fernbedienung
 
 Für die Einbundung von IR Fernbedienung wurde ein kleines Arduino Projekt verwendet, [platformio-mqtt-ir-receiver](https://github.com/nolte/platformio-mqtt-ir-receiver). 

{% ditaa %}
{% include /images/ir-receiver.ditaa %}
{% endditaa %}

#### Logitech Harmony Integration

 Für die Integration des Logitech Hubs war eine kleine API nötig, um die [XMPP](https://de.wikipedia.org/wiki/Extensible_Messaging_and_Presence_Protocol) Schnittstelle anzusprechen.
 Die API ist auf Github zu finden [nolte/py-harmony](https://github.com/nolte/py-harmony).
 
{% ditaa %}
{% include /images/harmony.ditaa %}
{% endditaa %}


### Steuerung der Musik Anlage

 **UseCase:** Sollte noch kein WLAN Device in 

### Steuerung des NAS Systems

 Da ich faul :relaxed: bin starte ich meine PCs gerne von dem Platz aus wo ich aktuell bin.
 Dafür eignet sich die Homeassistant Komponente [Wake on LAN Switch](https://home-assistant.io/components/switch.wake_on_lan/).  

### Master Power Off

 Ich möchte einge Möglichkeit haben sämtliche Geräte auszuschalten. 
 Dieses geschiet über die Kombination von:  
 
* Logitech Harmony Component, für Geräte wie TV, Verstärker usw...
* [Shell Command](https://home-assistant.io/components/shell_command/) zum herunterfahren von Linux Systemen.
* [usw...](https://home-assistant.io/components/#all)
  
 wobei die Herrausforderung nicht beim auschalten liegt, sondern bei der Problemstellung das viele IR Geräte nur eine
 ``Power Toggle`` Funktion anbieten. Aus diesem Grund muss man beim Auschalten wissen ob das jeweilige Gerät auch gestartet ist.
 Ansonsten würde man den Start inizialisieren...  
 Dafür eignet sich der [nmap scanner](https://home-assistant.io/components/device_tracker.nmap_scanner/) um den Netzwerkstatus abzufragen.  
 Eine weiterre möglichkeit für IR Geräte ist es einen Arduino aufzustellen, welcher die IR Commands entgegen nimmt und über MQTT an die [Hausautomatisierung](https://home-assistant.io/components/sensor.mqtt/) weitergiebt. In 
 diesem Fall kann man den Zustand mit Hilfe von [Switches](https://home-assistant.io/components/switch/) speichern.
   

