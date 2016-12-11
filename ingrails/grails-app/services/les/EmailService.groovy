package les

import grails.transaction.*

@Transactional
class EmailService {

	static mailService
	@NotTransactional
	def sendEmail(String email, String subj, String body){
		println "Sending mail ? ${mailService.class}"

		mailService.sendMail {
			to email
			from 'povmt.noreply@gmail.com'
			subject subj.toString()
			text body.toString()
		}
	}
}
