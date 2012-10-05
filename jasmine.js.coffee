###
http://pivotal.github.com/jasmine/
http://johnbintz.github.com/jasmine-headless-webkit/


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


# SPIES

foo = new Foo;
spyOn(foo, 'bar').andReturn('baz')
