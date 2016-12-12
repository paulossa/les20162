package les

import static java.util.Calendar.DAY_OF_WEEK
import grails.transaction.Transactional

@Transactional
class ReminderService {
	static emailService

	def sendReminders(String time) {
		assert time ==~ /\d{2}:\d{2}/
		def reminders = remindersThatShouldBeSent(time)
		reminders?.each { reminder ->
			emailService.sendEmail(
				reminder.email,
				"Ainda há tempo de permanecer focado, ${reminder.user.dName}.",
				"Cadastre o tempo que você investiu nas suas atividades ontem. <a href=\"http://localhost:8080/root/fromYesterday\"> Cadastre as tarefas de ontem </a>"
				)
		}
	}

	// Deve retornar uma lista de objetos Reminder, para os casos onde as pessoas não cadastraram TIs no dia anterior.
	def remindersThatShouldBeSent(String time){
		// Métodos de fazer a query para pesquisar no google
		// executeQuery grails
		// createCriteria grails
		// findAllBy grails # Pior opção na minha opinuao

		Calendar calendar = Calendar.getInstance()
		Calendar yesterday = calendar.time.clearTime() - 1
		def session = RequestContextHolder.currentRequestAttributes().getSession()
		def c = Activity.createCriteria()
		def entries = c.list {
			eq('owner', session.user)
			tis {
				gt(dateCreated, yesterday)
			}
		}

		if (!entries) {
			return Reminder.findAllByOwnerAndTime(session.user, time)
		}

		return false
	}

	def cleanReminders(User u) {
		def r = Reminder.findByUser(u)
        r?.delete()
	}

}
