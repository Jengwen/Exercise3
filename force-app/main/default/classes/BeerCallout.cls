public with sharing class BeerCallout {

    public static HttpResponse addBeers(){
       Http http = new Http();
         HttpRequest request = new HttpRequest();
         request.setHeader('Accept', 'application/json'); 
         request.setHeader('Content-Type','application/json;charset=UTF-8');
         request.setEndpoint('https://api.punkapi.com/v2/beers?page=1&per_page=30');
         request.setMethod('GET');
         HttpResponse response = http.send(request);
         System.debug(response.getBody());
        
      if (response.getStatusCode() == 200){
         List<Object> jsonList = (List<Object>) JSON.deserializeUntyped(response.getBody());
             List<Beer__c> beers = new List<Beer__c>();
 
    
         for(Object o: jsonList){
                 Map<String, Object> results = (Map<String, Object>)o; 
                  Beer__c beer = new Beer__c();
                 beer.External_Id__c = (Decimal)results.get('id');
                 beer.Name = (string)results.get('name');
                 beer.Tagline__c = string.valueOf(results.get('tagline'));
                 beer.Description__c = string.valueOf(results.get('description'));
                 
                 beers.add(beer);
             }
                 upsert beers External_Id__c;
         }
        return response;
     }
     
     
 }
