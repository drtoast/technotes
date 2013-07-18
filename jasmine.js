// http://pivotal.github.com/jasmine/


// EXAMPLE SUITE

describe('Calculator', function () { // suite name
  var counter = 0

  it('can add a number', function () {
    counter = counter + 2;   // counter was 0 before
    expect(counter).toEqual(2);
  });

  it('can multiply a number', function () {
    counter = counter * 5;   // counter was 2 before
    expect(counter).toEqual(10);
  });
});


// NESTED DESCRIBE

describe('some suite', function () {

  var suiteWideFoo;

  beforeEach(function () {
    suiteWideFoo = 0;
  });

  describe('some nested suite', function() {
    var nestedSuiteBar;
    beforeEach(function() {
      nestedSuiteBar=1;
    });

    it('nested expectation', function () {
      expect(suiteWideFoo).toEqual(0);
      expect(nestedSuiteBar).toEqual(1);
    });

  });

  it('top-level describe', function () {
    expect(suiteWideFoo).toEqual(0);
    expect(nestedSuiteBar).toEqual(undefined);
  });
});


// MATCHERS

expect(x).toEqual(y);           // compares objects or primitives x and y and passes if they are equivalent
expect(x).toBe(y);              // compares objects or primitives x and y and passes if they are the same object
expect(x).toMatch(pattern);     // compares x to string or regular expression pattern and passes if they match
expect(x).toBeDefined();        // passes if x is not undefined
expect(x).toBeNull();           // passes if x is null
expect(x).toBeTruthy();         // passes if x evaluates to true
expect(x).toBeFalsy();          // passes if x evaluates to false
expect(x).toContain(y);         // passes if array or string x contains y
expect(x).toBeLessThan(y);      // passes if x is less than y
expect(x).toBeGreaterThan(y);   // passes if x is greater than y
expect(fn).toThrow(e);          // passes if function fn throws exception e when executed


// CUSTOM MATCHERS


