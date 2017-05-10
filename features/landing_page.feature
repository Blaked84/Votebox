Feature: Landing Page for not logged in user
  A user should see recent projects

  Background:
    Given There is a project called Project-one decribed by P1-description
    And   There is a project called Project-two decribed by P2-description

  Scenario: I see the welcome message
    When I go to the homepage
    Then I should see the welcome message

  @javascript
  Scenario: I see projects
    When I go to the homepage
    Then I should see a project named Project-one
    And I should see a project described by P1-description
    And I should see a project named Project-two
    And I should see a project described by P2-description

  @javascript
  Scenario: I am redirected to login if i want to vote for a project
    When I go to the homepage
    And  I click on vote for first project
    Then I should be redirected to login page

  @javascript
  Scenario: I am redirected to login if i want to join a project
    When I go to the homepage
    And  I click on join for first project
    Then I should be redirected to login page