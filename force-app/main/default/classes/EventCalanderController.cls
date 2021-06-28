public class EventCalanderController {

    public EventCalanderController() {
        DateTime tmp = System.now();
        yearToView = tmp.year();
        monthToView = tmp.month();
    }
    public void updateCalander(){
        //causes page refresh
        
    }
    @AuraEnabled
    public static Integer yearToView{
        get {
            if (yearToView == null){
                DateTime tmp = System.now();
                yearToView = tmp.year();
            }
            return yearToView;
        } set;
    }
    @AuraEnabled
    public static Integer monthToView{
        get {
            if (monthToView == null){
                DateTime tmp = System.now();
                monthToView = tmp.month();
            }
            return monthToView;
        } set;
    }
    @AuraEnabled
    public static CalanderClass getEventList(){ 
            CalanderClass Calander = new CalanderClass(yearToView, monthToView);
            return Calander;
    }
    @AuraEnabled
    public static CalanderClass getEventListRefresh(Integer monthToView, Integer yearToView){ 
            CalanderClass Calander = new CalanderClass(yearToView, monthToView);
            return Calander;
    }
}