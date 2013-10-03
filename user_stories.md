# http://dannorth.net/introducing-bdd/
# http://dannorth.net/whats-in-a-story/
# Writing stories for behavior-driven development (BDD):

Title

As a [role]
I want [feature]
So that [benefit]

Acceptance criteria: # (presented as Scenarios)

Scenario 1:
Given [context]
And [some more context]
When [event]
Then [outcome]
And [another outcome]


# Bugs are different:

Scenario 1: Reproducing [bug]

Given [context]
And [some more context]
When [event]
Then [bad things happen]



# http://www.agilemodeling.com/artifacts/userStory.htm

# Informal user stories

examples:

* Students can purchase monthly parking passes online.
* Parking passes can be paid via PayPal.
* Professors can input student remarks.

considerations:

* Much smaller than other usage requirement artifacts such as use cases or usage scenarios
* Stakeholders write user stores, not developers
* Use the simplest tool - index cards, etc
* Indicate the estimated size
* Indicate the priority

# Formal user stories

As a (role) I want (something) so that (benefit)

e.g.

As a (student) I want (to purchase a parking pass) so that (I can drive to school)

# User stories and planning

* User stories are addressed in priority order
* Stakeholders determine the priority of each story
* Developers estimate the size of each story
* Each iteration, developers ship top priority stories
