@isTest
public class SupplyOrderControllerTester {
    
    @isTest
    public static void testGetPicklistOptions(){
        
        List<List<SelectOptionAE>> options = SupplyOrderController.getPickListOptions();
        system.assertEquals(options.size(), 3);
        
    }
    
    @isTest
    public static void testGetPriceOfProduct(){
        
        String v1 = SupplyOrderController.getPriceOfProduct('');
        system.assertEquals(v1, '0.00');
        
        //id for GenWatt Diesel 10kW, should be price 5000.00
        String product = '01t5e000001yGnoAAE';
        test.startTest();
        String v2 = SupplyOrderController.getPriceOfProduct(product);
        test.stopTest();
        
        //system.assertEquals(v2, '5000.00');
    }
    
    @isTest
    public static void testSaveOrder(){
        
        Custom_Order__c newOrder = new Custom_Order__c();
        String message;
        
        test.startTest();
        message = SupplyOrderController.saveOrder(newOrder);
        test.stopTest();
        
        system.assertEquals('Your order could not be sumbitted.', message);
    }
    
}