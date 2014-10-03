###
http://www.ng-newsletter.com/posts/how-to-learn-angular.html
http://angularjs.org
http://docs.angularjs.org/api/
http://jsfiddle.net/api/post/library/pure/
###

### index.html.slim
html ng-app="Allocations"
div ng-view=""
###


###
STARTUP
* Angular looks for `ng-app` directive
* Module specified in ng-app is used to configure the $injector
* The $injector is used to create the $compile service and $rootScope
* The $compile service is used to compile the DOM and link it with $rootScope
* The `ng-init` directive runs
###

###
COMPILATION
* add listeners, etc
* any {{name}} interpolation sets up a $watch
###

###
RUN LOOP
* $scope.apply(func) - Enter Angular execution context
* `func` modifies application state
* enter $digest loop:
  * process $evalAsync queue
  * process $watch list
  * repeat until no changes detected
* re-render DOM to reflect any changes
###

###
CONTROLLER
###

### VIEW
* browser parses HTML template into DOM
* compiler looks for directives which set up watches on the model
###

### DIRECTIVE

###


# MODULE
angular.module 'Allocations', ['aDirectives', 'aModels', 'aControllers', 'aServices']

# ROUTER
$routeProvider
  .when '/phones',
    templateUrL: 'partials/phone-list.html'
    controller: PhoneListController
  .when '/phones/:phoneId',
    templateUrl: 'partials/phone-detail.html'
    controller: PhoneDetailController

# CONTROLLER
App.PhoneDetailController = ($scope, $routeParams) ->
  $http.get "phones#{$routeParams.phoneId}.json")
    .success (data) ->
      $scope.phone = data
      $scope.mainImageUrl = data.images[0]

# need this if assets are minified
App.PhoneDetailCtrl.$inject = ['$scope', '$routeParams'];

# DIRECTIVE
# http://docs.angularjs.org/guide/directive

App.MyDirective = ($timeout) ->
  template: "<span ng-show='isVisible' ng=click='hideThing()'>thing</span>"
  replace: true
  link: (scope, el, attrs) ->
    scope.isVisible = true
    scope.hideThing = ->
      scope.isVisible = false

App.MyDirective.$inject = ['$timeout']
angular.module('app').directive 'myDirective', App.MyDirective


# SCOPE

# inspect element, then:
angular.element($0).scope()


# SERVICE
# singletons that carry out specific tasks common to webapps
# http://docs.angularjs.org/guide/dev_guide.services.understanding_services
# http://docs.angularjs.org/guide/dev_guide.services.creating_services

# MODELS
# A model is any data that is reachable as a property of an angular Scope object.


### TEMPLATE with event bindings
app/partials/phone-detail.html

img ng-src="{{mainImageUrl}}"
ul
  li ng-repeat="img in phone.images"
    img ng-src="{{img}}" ng-click="setImage(img)"
###


# REST
App.
