class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

       // "/"(view:"/competition/competition")
        "/"(controller: "competition")
        "500"(view:'/error')
	}
}
