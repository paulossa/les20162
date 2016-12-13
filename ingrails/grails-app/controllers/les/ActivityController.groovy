package les

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ActivityController {

    def utilService

    static allowedMethods = [save: "POST", update: "POST", delete: "GET"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Activity.list(params), model:[activityCount: Activity.count()]
    }

    def show(Activity activity) {
        respond activity
    }

    def create() {
        def a = new Activity(params)
        a.owner = session.user
        respond a
    }

    @Transactional
    def save(Activity activity) {
      println "Tryign to save $activity ${session.user.id}"
        if (activity == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        activity.owner = User.findById(session.user.id)

        if (activity.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond activity.errors, view:'create'
            return
        }



        activity.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'activity.label', default: 'Activity'), activity.id])
                redirect uri: '/'
            }
            '*' { respond activity, [status: CREATED] }
        }
    }

    def edit(Activity activity) {
        respond activity
    }

    @Transactional
    def update(Activity activity) {
        if (activity == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (activity.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond activity.errors, view:'edit'
            return
        }

        activity.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'activity.label', default: 'Activity'), activity.id])
                chain controller: "root", action:"index", model: [usr: session.user, activities: utilService.getActivities(session.user)]
            }
            '*'{ respond activity, [status: OK] }
        }
    }

    @Transactional
    def delete(Activity activity) {

        if (activity == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        TimeInvested.executeUpdate("delete from TimeInvested where activity.id=${activity.id}")
        Activity.executeUpdate("delete from Activity where id=${activity.id}")
        chain controller: "root", action:"index", model: [usr: session.user, activities: utilService.getActivities(session.user)]
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'activity.label', default: 'Activity'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def activityImage(Activity activity) {
      response.setHeader("Content-disposition", "attachment;")
      response.setContentType("image/png")
      response.outputStream << activity?.avatar //'myphoto.jpg' will do too
      response.outputStream.flush()
    }
}
