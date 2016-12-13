package les

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON

@Transactional(readOnly = true)
class TimeInvestedController {

    static allowedMethods = [save: "GET", update: "PUT", delete: "DELETE"]

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
    def addTiYesterday() {
      def a = Activity.findById(params["activity.id"])
      if (a && params.double('hours') <= 24){
          def t = new TimeInvested(hours: params.double('hours'), activity: a)

          t.save(flush: true)
          t.dateCreated = (t.dateCreated - 1)
          t.save(flush: true)

          response.setContentType("application/json")
          response.status = 200
          render '{"message": "Sucesso"}'
          return
      } else {
        response.status = 401
        response.setContentType("application/json")
        render '{"message": "Parametros de criação inválidos. O tempo não pode ultrapassar 24 horas"}'
        return
      }
    }

    def createTi() {
      def a = Activity.findById(params["activity.id"])
      if (a && params.double('hours') <= 24){
          def t = new TimeInvested(hours: params.double('hours'), activity: a)

          t.save(flush: true)

          response.setContentType("application/json")
          response.status = 200
          render '{"message": "Sucesso"}'
          return
      } else {
        response.status = 401
        response.setContentType("application/json")
        render '{"message": "Parametros de criação inválidos. O tempo não pode ultrapassar 24 horas"}'
        return
      }
    }

    @Transactional
    def save(TimeInvested timeInvested) {
        if (timeInvested == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        println "Saving time invested"

        if (timeInvested.hasErrors()) {
            println " jAS errros "
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
