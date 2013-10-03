# http://pivotal.github.com/jasmine/

matchers = ->
  # https://github.com/pivotal/jasmine/wiki/Matchers
  expect(x).toEqual(y) # compares objects or primitives x and y and passes if they are equivalent
  expect(x).toBe(y) # compares objects or primitives x and y and passes if they are the same object
  expect(x).toMatch(pattern) # compares x to string or regular expression pattern and passes if they match
  expect(x).toBeDefined() # passes if x is not undefined
  expect(x).toBeUndefined() # passes if x is undefined
  expect(x).toBeNull() # passes if x is null
  expect(x).toBeTruthy() # passes if x evaluates to true
  expect(x).toBeFalsy() # passes if x evaluates to false
  expect(x).toContain(y) # passes if array or string x contains y
  expect(x).toBeLessThan(y) # passes if x is less than y
  expect(x).toBeGreaterThan(y) # passes if x is greater than y
  expect(x).toBeCloseTo(y, 0.2) # passes if x is within 0.2 of y
  expect(-> fn()).toThrow(e) # passes if function fn throws exception e when executed

  # custom:
  beforeEach ->
    @addMatchers
      toBeLessThan: (expected) ->
        @actual < expected

jquery_matchers = ->
  # https://github.com/velesin/jasmine-jquery
  toBe(jQuerySelector)
  toBeChecked()
  toBeEmpty()
  toBeHidden()
  toHaveCss(css)
  toBeSelected()
  toBeVisible()
  toContain(jQuerySelector)
  toExist()
  toHaveAttr(attributeName, attributeValue)
  toHaveProp(propertyName, propertyValue)
  toHaveBeenTriggeredOn(selector)
  toHaveBeenTriggered()
  toHaveBeenTriggeredOnAndWith(selector, extraParameters)
  toHaveBeenPreventedOn(selector)
  toHaveBeenPrevented()
  toHaveClass(className)
  toHaveData(key, value)
  toHaveHtml(string)
  toContainHtml(string)
  toContainText(string)
  toHaveId(id)
  toHaveText(string)
  toHaveValue(value)
  toHaveLength(value)
  toBeDisabled()
  toBeFocused()
  toHandle(eventName)
  toHandleWith(eventName, eventHandler)


spies = ->
  foo = new Foo;
  spyOn(foo, 'bar').andReturn('baz')


test_suite = ->
  describe 'some suite', ->

    beforeEach ->
      @suiteWideFoo = 0

    describe 'some nested suite', ->
      nestedSuiteBar = 1
      beforeEach ->
        nestedSuiteBar = 1

      it 'nested expectation', ->
        expect(suiteWideFoo).toEqual(0)
        expect(nestedSuiteBar).toEqual(1)

    it 'top-level describe', ->
      expect(suiteWideFoo).toEqual(0)
      expect(nestedSuiteBar).toEqual(undefined)

setup = ->
###
Setup Jasmine:

    bundle exec jasmine init
    rm lib/tasks/jasmine.rake

in spec/javascripts/support/jasmine.yml:

    # load application.js
    src_files:
      - public/test/assets/application.js

    # detect CoffeeScript specs
    spec_files:
      - '**/*[sS]pec.js.coffee'

edit Guardfile:

    guard 'jasmine-headless-webkit', all_on_start: true do
      watch(%r{^public/test/assets/vendor.js$})                { 'spec/javascripts' }
      watch(%r{^public/test/assets/application.js$})           { 'spec/javascripts' }
      watch(%r{^spec/javascripts/(.*)_spec\..*})               { |m| newest_js_file(spec_location % m[1]) }
      watch(%r{^spec/javascripts/helpers/.*})                  { 'spec/javascripts' }
    end

add a spec: spec/javascripts/models/hello.js.coffee

    describe "Hello World", ->
      it "should say hi", ->
        expect("Hello World").toEqual("Hello World")
###


