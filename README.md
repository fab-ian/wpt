[![Maintainability](https://api.codeclimate.com/v1/badges/740f4cdd5d4f1450fd08/maintainability)](https://codeclimate.com/github/fab-ian/wpt/maintainability)

# README

### Setup
```git clone git@github.com:fab-ian/wpt.git```  
```cd wpt```  

WPT is using Ruby 3.0. Check if you have this version available (RVM: ```rvm list```)  
```bundle```  

WPT fetches data from https://api.um.warszawa.pl/. You have to register to get an API key. This is a very easy and fast process. Only username and password required.  

Copy config file  
```cp config/config.yaml_sample config/config.yaml```  

Enter your API key to field `um_waw_api_key` in file `config/config.yaml`  

Setup database and import data  
``` ruby wpt/wpt.rb -s ```  

### Usage (example)  

Stop: Sady Żoliborskie  
Tram: 35  
google maps: [show sample location](https://www.google.pl/maps/place/Sady+%C5%BBoliborskie+03/@52.2648882,20.9690394,17z/data=!4m13!1m7!3m6!1s0x471ecbb8a549d0b7:0x1dbee89c8a8cfc3!2sW%C5%82adys%C5%82awa+Broniewskiego,+Warszawa!3b1!8m2!3d52.268191!4d20.9585716!3m4!1s0x471ecb945f964f19:0xf0c61f6775eb3b94!8m2!3d52.2642958!4d20.9714768)  

First, you need to add at least one-stop. In our example, this is `Sady Żoliborskie 03`. The name of the stop is available on google maps.  
``` ruby wpt/wpt.rb -f ```  

Enter a phrase like `sad` and choose from the list the right stop.  

Run ``` ruby wpt/wpt.rb -d ``` to observe the distance of arriving vehicle.  
  
### Others

Show all functions
```ruby wpt/wpt.rb -h ```


