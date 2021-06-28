({
    updateHelper : function(component, date) {
        let month = date[0];
        let year = date[1];
        
        console.log(date);

        let updateCalendar = component.get("c.getEventListRefresh");
        updateCalendar.setParams({"monthToView" : month, "yearToView" : year});

        updateCalendar.setCallback(this, function(response){
            if(response.getState() === "SUCCESS"){
                component.set("v.eventList", response.getReturnValue());
            }
        });

        $A.enqueueAction(updateCalendar);
    }
})
