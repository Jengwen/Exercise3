@isTest
global class BeerCalloutTest {
    @isTest
    public  static  void AddBeerTest() {
        // test mock response
        
         Test.setMock(HttpCalloutMock.class, new BeerCalloutMock());
        
        HttpResponse response= BeerCallout.addBeers();
         List<Object> jsonList = (List<Object>) JSON.deserializeUntyped(response.getBody());
            List<Beer__c> beers = new List<Beer__c>();

        List<Object> resValue = new List<Object>{'[{"id": 192, "name": "Punk IPA 2007 - 2010",' +
        '"tagline": "Post Modern Classic. Spiky. Tropical. Hoppy.",' +
        '"description": "This is James and Martin\'s original take on an American IPA."}]'};

        System.assertEquals(resValue, jsonList);
       
      }

    @IsTest
    public static void testAddBeerFail(){
    //set mock to test 
    Test.setMock(HttpCalloutMock.class, new BeerCalloutMock_Fail());
    Test.startTest();
    HttpResponse response = BeerCallout.addBeers();
    System.assertEquals(400, response.getStatusCode());
   // List<Beer__c> beers = [SELECT Name FROM Beer__c];
    //System.assertEquals(0, beers.size() );   
    Test.stopTest();

    }  
   
    
}