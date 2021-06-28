({
    doInit : function(component, event, helper) {
        let currentDate = new Date();
        component.set("v.currentMonth", currentDate.getMonth() + 1);
        component.set("v.currentYear", currentDate.getFullYear());
        let getEventList = component.get("c.getEventList");

        getEventList.setCallback(this, function(response){
            if(response.getState() === "SUCCESS"){
                component.set("v.eventList", response.getReturnValue());
            }
        });

        $A.enqueueAction(getEventList);
    },

    handleCalendarButton : function(component, event, helper) {
        let monthField = component.find("monthInput");
        let yearField = component.find("yearInput");
        let month = monthField.get("v.value");
        let year = yearField.get("v.value");
        let updateCalendar = [month, year];
        helper.updateHelper(component, updateCalendar);
    }
})
