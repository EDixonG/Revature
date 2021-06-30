public class ProductFormApexController {

    @AuraEnabled
    public static List<Product2> getProducts(){
        return [SELECT Id, Name, ProductCode, Description, Total_to_sell__c FROM Product2];
    }
}