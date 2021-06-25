({
	doInit : function(component, event, helper) {
        
        let getOrders = component.get("c.getOrders");
        
        getOrders.setCallback(this, function(response){
            
            if(response.getState() === "SUCCESS") {
                component.set("v.orders", response.getReturnValue());
            }
        });
        $A.enqueueAction(getOrders);
		
	}
})