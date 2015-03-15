package fitnessapp

class SecurityFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
                if (!session.user && actionName != "login") {
                    redirect(controller: "users", action: "login")
                    return false
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
