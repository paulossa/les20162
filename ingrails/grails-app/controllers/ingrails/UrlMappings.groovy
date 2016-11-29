package ingrails

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "root", view:"/index")
        "/newtask"(view:"/newTask")
        "/addTi"(view:"/addTime")
        "500"(view:'/error')
        "404"(view:'/notFound')
        "/foo/bar"(view: "/home")
    }
}
