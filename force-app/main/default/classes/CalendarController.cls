public with sharing class CalendarController {
    
    static DateTime now = System.now();

    @AuraEnabled
    public static String getMonth(){
        String month;
        switch on now.month() {
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

    @AuraEnabled
    public static Integer getYear(){
        Integer year = now.year();
        return year;
    }
}
