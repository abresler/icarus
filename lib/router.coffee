Router.configure
  templateNameConverter: "upperCamelCase"
  routeControllerNameConverter: "upperCamelCase"
  layoutTemplate: "layout"
  notFoundTemplate: "notFound"
  loadingTemplate: "loading"

Router.map ->
  @route "home",
    path: "/"
    controller: "HomeController"

  @route "about",
    path: "/about"
    controller: "AboutController"

  return



# Transitioner.transition
#   fromRoute: "home"
#   toRoute: "about"
#   velocityAnimation:
#     in: animation
#     out: animation
