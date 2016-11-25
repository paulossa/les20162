package les

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TimeInvestedController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TimeInvested.list(params), model:[timeInvestedCount: TimeInvested.count()]
    }

    def show(TimeInvested timeInvested) {
        respond timeInvested
    }

    def create() {
        respond new TimeInvested(params)
    }

    @Transactional
    def save(TimeInvested timeInvested) {
        if (timeInvested == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (timeInvested.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond timeInvested.errors, view:'create'
            return
        }

        timeInvested.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'timeInvested.label', default: 'TimeInvested'), timeInvested.id])
                redirect timeInvested
            }
            '*' { respond timeInvested, [status: CREATED] }
        }
    }

    def edit(TimeInvested timeInvested) {
        respond timeInvested
    }

    @Transactional
    def update(TimeInvested timeInvested) {
        if (timeInvested == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (timeInvested.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond timeInvested.errors, view:'edit'
            return
        }

        timeInvested.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'timeInvested.label', default: 'TimeInvested'), timeInvested.id])
                redirect timeInvested
            }
            '*'{ respond timeInvested, [status: OK] }
        }
    }

    @Transactional
    def delete(TimeInvested timeInvested) {

        if (timeInvested == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        timeInvested.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'timeInvested.label', default: 'TimeInvested'), timeInvested.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'timeInvested.label', default: 'TimeInvested'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
