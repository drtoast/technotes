// http://tinnedfruit.com/2011/03/03/testing-backbone-apps-with-jasmine-sinon.html
// http://tinnedfruit.com/2011/03/25/testing-backbone-apps-with-jasmine-sinon-2.html
// http://tinnedfruit.com/2011/04/26/testing-backbone-apps-with-jasmine-sinon-3.html

//  ANONYMOUS SPIES

it("should fire a callback when 'foo' is triggered", function() {
  // Create an anonymous spy
  var spy = sinon.spy();
  
  // Create a new Backbone 'Episode' model
  var episode = new Episode({
    title: "Hollywood - Part 2"
  });
  
  // Call the anonymous spy method when 'foo' is triggered
  episode.bind('foo', spy); 
  
  // Trigger the foo event
  episode.trigger('foo'); 
  
  // Expect that the spy was called at least once
  expect(spy.called).toBeTruthy(); 
});



// FAKE SERVERS

describe("Episode model", function() {
  beforeEach(function() {
    this.server = sinon.fakeServer.create();
  });
    
  afterEach(function() {
    this.server.restore();
  });
  
  it("should fire the change event", function() {
    var callback = sinon.spy();
    
    // Set how the fake server will respond
    // This reads: a GET request for /episode/123 
    // will return a 200 response of type 
    // application/json with the given JSON response body
    this.server.respondWith("GET", "/episode/123",
      [200, {"Content-Type": "application/json"},
      '{"id":123,"title":"Hollywood - Part 2"}']);

    var episode = new Episode({id: 123});
    
    // Bind to the change event on the model
    episode.bind('change', callback);
    
    // makes an ajax request to the server
    episode.fetch(); 
    
    // Fake server responds to the request
    this.server.respond();
    