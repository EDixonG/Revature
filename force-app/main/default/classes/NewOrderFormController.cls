public class NewOrderFormController {
    
    @AuraEnabled
    public static List<SelectOptionAE> getOptions(){
        
        List<SelectOptionAE> options = new List<SelectOptionAE>();
        options.add(new SelectOptionAE('None', 'Product'));
        
        for(Product2 product : [SELECT Name, Id FROM Product2]){
            options.add(new SelectOptionAE(product.Id, product.Name));
        }
        
        return options;
    }
    
    @AuraEnabled
    public static String saveOrder(Custom_Order__c order){
        
        String message = 'Order submitted successfully!';
        order.Tracking_Reference__c = EncodingUtil.convertToHex(Crypto.generateDigest('MD5', Blob.valueOf(DateTime.now().getTime().format())));
        
        order.RecordTypeId = Schema.SObjectType.Custom_Order__c.getRecordTypeInfosByName().get('Outbound Order').getRecordTypeId();
        order.Order_Status__c = 'pending';
        //order.Contact__c = [SELECT Name FROM Contact WHERE Name =: UserInfo.getName() LIMIT 1].id;
      
        try{
            Database.SaveResult success = Database.insert(order);
            message = 'Order submitted successfully!';
            
        } catch(DmlException e ){
            return 'Your order could not be sumbitted.';
        }
           
        return message;
        
    }
    
    @AuraEnabled
    public static String getPriceOfProduct(String product){
        
        String price = String.valueOf(0.00);
        system.debug('Product2 Id : ' + product);
        
        try{
            PricebookEntry priceBookEnttry = [SELECT UnitPrice FROM PricebookEntry WHERE Product2Id =:product LIMIT 1];
            price = String.valueOf(priceBookEnttry.UnitPrice);
        }
        catch (Exception ex) {
            //    this.unitPrice = String.valueOf(0.00);
        }
        
        system.debug(price);
        
        return price;
        
    }

}