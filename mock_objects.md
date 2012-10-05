http://martinfowler.com/articles/mocksArentStubs.html

DOUBLES - generic term. any kind of object that stands in for another in a test. kinds of doubles:
DUMMY - passed around but never used, just fill in parameter lists
FAKES - have working implementations but take shortcuts and are not suitable for production
MOCKS - test what something is doing. pre-programmed with expectations of what they should receive.
STUBS - test what something is returning. pre-programmed with responses to specific calls.

# State verification vs Behavior verification (mocks)

Of these kinds of doubles, only mocks insist upon behavior verification. The other doubles can, 
and usually do, use state verification. Mocks actually do behave like other doubles 
during the exercise phase, as they need to make the SUT believe it's talking with 
its real collaborators - but mocks differ in the setup and the verification phases.
