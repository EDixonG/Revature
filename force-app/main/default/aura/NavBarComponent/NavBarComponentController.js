({
	updateMessage : function(component, event, helper) {
        
        component.find('updatedMessage').showToast({
            "header": "Success",
            "message": "Your Case has been created"
                         })
	}
})