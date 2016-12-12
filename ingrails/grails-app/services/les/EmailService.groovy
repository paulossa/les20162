package les

import grails.transaction.*

@Transactional
class EmailService {

	static mailService
	@NotTransactional
	def sendEmail(String email, String subj, String body){
		mailService.sendMail {
			to email
			from 'povmt.noreply@gmail.com'
			subject subj.toString()
			text body.toString()
		}
	}

}
