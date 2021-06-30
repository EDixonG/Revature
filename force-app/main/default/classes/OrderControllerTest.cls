@isTest
public class OrderControllerTest {
    
    
    @isTest
    public static void doTest(){
        
        Test.startTest();
        
        List<Custom_Order__c> controllerOrderList = OrderController.getOrders();
        List<Custom_Order__c> co = [SELECT Id, Approved__c, Order_Status__c, Product2__r.Name, 
                                               Quantity__c, Estimated_Recieve_Date_Start__c,Estimated_Recieve_Date_End__c FROM Custom_Order__c];
        
        
        Test.stopTest();
        System.assertEquals(co,controllerOrderList);
    }

}