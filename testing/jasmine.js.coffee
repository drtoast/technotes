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
