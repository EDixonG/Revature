({
	doInit : function(component, event, helper) {
        
        let getOrders = component.get("c.getOrders");
        
        getOrders.setCallback(this, function(response){
            
            if(response.getState() === "SUCCESS") {
                component.set("v.orders", response.getReturnValue());
            }
        });
        $A.enqueueAction(getOrders);
		
	},
    
    detailView : function(component, event, helper) {
        
       component.set("v.displayButton", false);
       component.set("v.displayForm", true);
       component.set("v.displayButton2", true);
		
	},
    
    closeView : function(component, event, helper) {
        
       component.set("v.displayButton", true);
       component.set("v.displayForm", false);
       component.set("v.displayButton2", false);
		
	}    
 
})