package les

class UserNotifierJob {

    static emailService
    static reminderService
    static triggers = {
      //Example: simple name: 'mySimpleTrigger', startDelay: 60000, repeatInterval: 1000
      simple name: 'printTest', startDelay: 100l, repeatInterval: 60000l // execute job once in 5 seconds
    }

    def execute() {
      Calendar cal=Calendar.getInstance();//it return same time as new Date()
      int hour = cal.get(Calendar.HOUR_OF_DAY)
      int minute = cal.get(Calendar.MINUTE)
      String key = String.format("%02d:%02d", hour, minute)
      println key
      reminderService.sendReminders(key)
      //  println emailService.pleseWork()
    }
}
