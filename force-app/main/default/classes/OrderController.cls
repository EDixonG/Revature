public without sharing class OrderController {
    
    static String id;
    
    @AuraEnabled
    public static List<Custom_Order__c> getOrders() {
        
        try
        {
            
            
            if(!Schema.SObjectType.Custom_Order__c.isAccessible()){
                throw new AuraHandledException('You do not have access to this Object');
                
            }
            /*
            //If Product2 has records it will delete them, that way we can start with a fresh batch as dummy data
            List<Product2> deleteCurrent = [SELECT Name FROM Product2];
            if(!(deleteCurrent == null)){
            	delete deleteCurrent;
            }
            
            //Creating dummy Product2 records for the Custom_Order__c object
            Product2 prod;
            List<String> prodName = new List<String>{'Gameboy Advance SP','Gameboy Advance','PlayStation','PlayStation 2',
                                                     'Sony PSP','Sony PSP Vita','GameCube','Nintendo 64','Microsoft Xbox',
                                                      'Vintage Atari 2600'};
            Custom_Order__c order;
            List<Product2> products = new List<Product2>();
            
            for(String p:prodName){
                
                prod = new Product2(Name = p);
                
                products.add(prod);
                
            }
            
            insert products;
            */
            /*
            
            //creating Custom_Order__c records as dummy dat
            List<Custom_Order__c> orders = new List<Custom_Order__c>();
            Boolean checkboxVal = false;
            for(Product2 p:products){
  
                order = new Custom_Order__c(Product2__c = p.Id, Approved__c = checkboxVal, Order_Status__c = 'pending',Quantity__c = 500,
                                            Estimated_Recieve_Date_Start__c = System.now()+5, Estimated_Recieve_Date_End__c = System.now() + 15);
                
                orders.add(order);
                checkboxVal = !checkboxVal;
               
            }
           
            
            
            insert orders;
            
            */
            
       
            
            List<Custom_Order__c> newOrders = [SELECT Id, Approved__c, Order_Status__c, Product2__r.Name, 
                                               Quantity__c, Estimated_Recieve_Date_Start__c,Estimated_Recieve_Date_End__c FROM Custom_Order__c];
            return newOrders;
            
        }
        catch (Exception e){
            
            throw new AuraHandledException(e.getMessage());
        }
    }
    
   
    

}