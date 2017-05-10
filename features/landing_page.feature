Feature: Landing Page
  A user should see recent projects

Background:
  Given There is a project called Project-one decribed by P1-description
  And   There is a project called Project-two decribed by P2-description

Scenario: I sees the welcome message
  When I go to the homepage
  Then I should see the welcome message

@javascript
Scenario: I sees projects
  When I go to the homepage
  Then I should see a project named Project-one
  And I should see a project described by P1-description
  And I should see a project named Project-two
  And I should see a project described by P2-description
