({
    doInit : function(component, event, helper) {
        let currentDate = new Date();
        let month = currentDate.getMonth() + 1;
        let year = currentDate.getFullYear();
        component.set("v.currentMonth", month);
        component.set("v.currentYear", year);
        let getEventList = component.get("c.getEventList");
        let getMonthName = component.get("c.getMonthName");
        getMonthName.setParams({"monthToView": month})

        getEventList.setCallback(this, function(response){
            if(response.getState() === "SUCCESS"){
                component.set("v.eventList", response.getReturnValue());
            }
        });

        getMonthName.setCallback(this, function(response){
            if(response.getState() === "SUCCESS"){
                component.set("v.monthName", response.getReturnValue());
                component.set("v.selectedYear", year);
            }
        });

        $A.enqueueAction(getEventList);
        $A.enqueueAction(getMonthName);
    },

    handleCalendarButton : function(component, event, helper) {
        let monthField = component.find("monthInput");
        let yearField = component.find("yearInput");
        let month = parseInt(monthField.get("v.value"));
        let year = parseInt(yearField.get("v.value"));
        let updateCalendar = [month, year];
        helper.updateHelper(component, updateCalendar);
    }
})
