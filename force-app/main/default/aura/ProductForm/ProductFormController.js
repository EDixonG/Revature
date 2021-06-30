({
	init : function(component, event, helper) {
        component.set('v.columns', [
            {label: 'Product Name', fieldName: 'Name', type: 'text'},
            {label: 'Product Code', fieldName: 'accountName', type: 'text'},
            {label: 'Description', fieldName: 'closeDate', type: 'text'},
            {label: 'Total to sell', fieldName: 'confidence', type: 'number'}
            
        ]);

        let action = component.get("c.getProducts");
        action.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.data", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
		});
         $A.enqueueAction(action);
    }
})