# mocking a service in a spec
# https://gist.github.com/jamesBrennan/6170376

myProvider = (AssetService) ->
  class MyModel
    constructor: (x) ->
      AssetService.find(1)

myProvider.$inject = ['AssetService']
angular.module('me', []).factory 'MyModel', myProvider

describe 'Provider', ->
  beforeEach module 'me'

  beforeEach ->
    @assetServiceMock = jasmine.createSpyObj('AssetService', ['find'])

    module ($provide) =>
      $provide.value 'AssetService', @assetServiceMock
      null

    inject (@MyModel) =>

  it 'provides', ->
    new @MyModel()
    expect(@assetServiceMock.find).toHaveBeenCalledWith(1)



# https://groups.google.com/forum/#!msg/angular/56sdORWEoqg/b8hdPskxZXsJ
# Lets look at the simplest scenario

provide.value('a', 123)

Controller = (a) ->
  expect(a).toEqual 123

# in this case the injector simple returns the value as is.
# But what if you want to compute the value. Then use a factory

provide.factory "b", (a) ->
  a * 2

Controller = (b) ->
  expect(a).toEqual 246

# So factory is a function which is responsible for creating the value.
# Notice that the factory function can ask for other dependencies.
# But what if you want to be more OO and have a class called Greeter

Greeter = (a) ->
  @greet = ->
    "Hello " + a

# then to instantiate you would have to write

provide.factory "greeter", (a) ->
  new Greeter(a)

# Then we could ask for 'greeter' in controller like this

Controller = (greeter) ->
  expect(greeter instanceof Greeter).toBe true
  expect(greeter.greet()).toEqual "Hello 123"

# But that is way too wordy a shorter way to write this would be

provider.service('greeter', Greeter)

# But what it we wanted to configure the Greeter class
# before the injection then we could write

provide.provider "greeter2", ->
  Greeter = (a) ->
    @greet = ->
      salutation + " " + a
  salutation = "Hello"
  @setSalutation = (s) ->
    salutation = s

  @$get = (a) ->
    new Greeter(a)

# we can then do this

Controller = (greeter2) ->
  expect(greeter.greet()).toEqual "Halo 123"
angular.module("abc", []).configure (greeter2Provider) ->
  greeter2Provider.setSalutation "Halo"

# But it turns out that angular only understands provide.provider,
# all other ones are derived.

provider.service = (name, Class) ->
  provider.provide name, ->
    @$get = ($injector) ->
      $injector.instantiate Class

provider.factory = (name, factory) ->
  provider.provide name, ->
    @$get = ($injector) ->
      $injector.invoke factory

provider.value = (name, value) ->
  provider.factory name, ->
    value
