Feature: Project Page for logged in user
  A user should see the project, voters and comments

  Background:
    Given There is a project called Project-one decribed by P1-description
    And I'm a registred user
    And I'm logged in
    And There is an user called John Doe with uuid : 84848484-8484-8484-8484-848484848484
    And There is a comment My first comment posted by John Doe for project Project-one
    
  @javascript
  Scenario: I can see other user comments
    When I go to the Project-one project page
    Then I should see a comment containing My first comment

  @javascript
  Scenario: I can see firsts name of project voters
    Given There is an user called Janette Doe with uuid : 84848484-8484-8484-8484-848484848485
    And There is an user called Luke Skywalker with uuid : 84848484-8484-8484-8484-848484848486
    And There is an user called Anakin Skywalker with uuid : 84848484-8484-8484-8484-848484848487
    When User John Doe vote for project called Project-one
    And User Janette Doe vote for project called Project-one
    And User Luke Skywalker vote for project called Project-one
    And User Anakin Skywalker vote for project called Project-one
    And I go to the Project-one project page
    Then I should see voters as John Doe, Janette Doe et une autre personne