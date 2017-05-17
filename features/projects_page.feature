Feature: Project Page for not logged in user
  A user should see recent projects

  Background:
    Given There is a project called Project-one described by P1-description
    And   There is a project called Project-two described by P2-description

  @javascript
  Scenario: I see projects
    When I go to the projects index page
    Then I should see a project named Project-one
    And I should see a project described by P1-description
    And I should see a project named Project-two
    And I should see a project described by P2-description
