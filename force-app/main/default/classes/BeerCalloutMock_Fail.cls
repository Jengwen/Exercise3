global class BeerCalloutMock_Fail implements HttpCalloutMock{
    
        global HTTPResponse respond (HTTPRequest request){
        
            HttpResponse response = new HttpResponse();
            response.setHeader('Content-Type', 'application/json');
            response.setStatus('OK');
            response.setStatusCode(400);
            response.setBody('[{"id": 192, "name": "Punk IPA 2007 - 2010",' +
                             '"tagline": "Post Modern Classic. Spiky. Tropical. Hoppy.",' +
                             '"description": "This is James and Martin\'s original take on an American IPA."}]');
            
            return response;
    
    }
}
