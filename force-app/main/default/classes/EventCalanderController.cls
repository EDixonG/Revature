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

    @AuraEnabled
    public static String getMonthName(Integer monthToView){
        String month;
        switch on monthToView {
            when 1 {
                month = 'January';
            }
            when 2{
                month = 'February';
            }
            when 3{
                month = 'March';
            }
            when 4{
                month = 'April';
            }
            when 5{
                month = 'May';
            }
            when 6{
                month = 'June';
            }
            when 7{
                month = 'July';
            }
            when 8{
                month = 'August';
            }
            when 9{
                month = 'September';
            }
            when 10{
                month = 'October';
            }
            when 11{
                month = 'November';
            }
            when 12{
                month = 'December';
            }
            when else {
                month = 'OUT OF RANGE';
            }
        }
        return month;
    }
}