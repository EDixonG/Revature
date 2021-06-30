public class ProductOutOfStockApexController {
 @AuraEnabled
    public static List<Product2> getProducts(){
        return [SELECT Id, Name, ProductCode, Description, Total_to_sell__c FROM Product2 WHERE Total_in_Stock__c = 0];
    }
}