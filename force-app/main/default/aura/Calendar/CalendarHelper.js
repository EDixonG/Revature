({
    updateHelper : function(component, date) {
        let month = date[0];
        let year = date[1];
        
        console.log(date);

        let updateCalendar = component.get("c.getEventListRefresh");
        updateCalendar.setParams({"monthToView" : month, "yearToView" : year});

        let updateBanner = component.get("c.getMonthName");
        updateBanner.setParams({"monthToView" : month});

        updateCalendar.setCallback(this, function(response){
            if(response.getState() === "SUCCESS"){
                component.set("v.eventList", response.getReturnValue());
            }
        });

        updateBanner.setCallback(this, function(response){
            if(response.getState() === "SUCCESS"){
                component.set("v.monthName", response.getReturnValue());
                component.set("v.selectedYear", year);
            }
        })

        $A.enqueueAction(updateCalendar);
        $A.enqueueAction(updateBanner);
    }
})