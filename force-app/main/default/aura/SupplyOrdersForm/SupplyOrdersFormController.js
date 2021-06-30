({
    doInit : function(cmp, event){
        let getAllPicklistOptions = cmp.get("c.getPicklistOptions");
       
        
        getAllPicklistOptions.setCallback(this, function(res){
            let state = res.getState();
            if(state == "SUCCESS"){
                console.log(res.getReturnValue());
                cmp.set("v.statusOptions", res.getReturnValue()[0]);
                cmp.set("v.productOptions", res.getReturnValue()[1]);
                cmp.set("v.contactOptions", res.getReturnValue()[2]);
            }
        });
        
        $A.enqueueAction(getAllPicklistOptions);
        
    },
    
    save : function(cmp, event){
        //Checking that user selected values for each picklist
        let hasSelected = cmp.get("v.newOrder.Order_Status__c") != 'Order' &&
                          cmp.get("v.newOrder.Product2__c") != 'Product' &&
                          cmp.get("v.newOrder.Contact__c") != 'Contact';
        
        if(hasSelected){
            console.log('options selected...');
        }
        
        let action = cmp.get("c.saveOrder");
        
        action.setParams({
            "order" : cmp.get("v.newOrder")
        });
        
        action.setCallback(this, function(res){
            let state = res.getState();
            if(state === "SUCCESS"){
                let emptyOrder = {"sobject" : "Custom_Order__c"};
                cmp.set("v.message", res.getReturnValue());
                cmp.set("v.newOrder", emptyOrder);
            }
        });
        
        $A.enqueueAction(action);
    },
    
    getPrice : function(cmp, event){
        
        let action = cmp.get("c.getPriceOfProduct");
        console.log(cmp.get("v.newOrder.Product2__c"));
        action.setParams({
            "product" : cmp.get("v.newOrder.Product2__c")
        });
        
        action.setCallback(this, function(res){
            let state = res.getState();
            if(state === "SUCCESS"){
                cmp.set("v.pricebookValue", res.getReturnValue());
            }
        });
        
        $A.enqueueAction(action);
    }
})