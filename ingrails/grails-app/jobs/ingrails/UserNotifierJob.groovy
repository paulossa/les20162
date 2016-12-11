package ingrails

class UserNotifierJob {
    static triggers = {
      //Example: simple name: 'mySimpleTrigger', startDelay: 60000, repeatInterval: 1000
      simple name: 'printTest', startDelay: 5000l, repeatInterval: 5000l // execute job once in 5 seconds
    }

    def execute() {
        print "1, 2, 3, testando..."
    }
}
