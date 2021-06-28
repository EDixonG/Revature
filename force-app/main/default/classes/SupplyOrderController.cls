public class SupplyOrderController {
    
    @AuraEnabled
    public static List<List<SelectOptionAE>> getPicklistOptions() {
        
        //Adding picklist options for order status, products, and contacts
        List<List<SelectOptionAE>> allPicklistOptions = new List<List<SelectOptionAE>>();
        List<SelectOptionAE> listOptions = new List<SelectOptionAE>();
        
        //Creating options for order status.....
        SelectOptionAE listOption = new SelectOptionAE('None', 'Order');
        ListOptions.add(listOption);
        
        Schema.DescribeFieldResult field = Custom_Order__c.Order_Status__c.getDescribe();
        List<Schema.PicklistEntry> picklist = field.getPicklistValues();
        
        for( Schema.PicklistEntry f : picklist){
            SelectOptionAE opt = new SelectOptionAE(f.getLabel(), f.getValue());
            ListOptions.add(opt);
        }
        
        allPicklistOptions.add(ListOptions);
        
        //Creating options for products....
        ListOptions = new List<SelectOptionAE>();
        ListOptions.add(new SelectOptionAE('None', 'Product'));
        
        for(Product2 p: [SELECT Id, Name FROM Product2]){
            ListOptions.add(new SelectOptionAE(p.Id, p.Name));
        }
        
        allPicklistOptions.add(ListOptions);
        
        ListOptions = new List<SelectOptionAE>();
        ListOptions.add(new SelectOptionAE('None', 'Contact'));
        
        for(Contact c : [SELECT Id, Name from Contact ]){
            ListOptions.add(new SelectOptionAE(c.Id, c.Name));
        }
        
        allPicklistOptions.add(ListOptions);
        
        return allPicklistOptions;
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
    
    @AuraEnabled
    public static String saveOrder(Custom_Order__c order){
        String message = 'Order submitted successfully!';
        
        order.Tracking_Reference__c = EncodingUtil.convertToHex(Crypto.generateDigest('MD5', Blob.valueOf(DateTime.now().getTime().format())));
       
        try{
            Database.SaveResult success = Database.insert(order);
            message = 'Order submitted successfully!';
            
        } catch(DmlException e ){
            return 'Your order could not be sumbitted.';
        }
           
        return message;
    }
}