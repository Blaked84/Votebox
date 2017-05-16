Feature: Project Page for logged in user
  A user should see the project and comments

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