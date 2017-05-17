Feature: Landing Page for logged user

  Background:
    Given There is a project called Project-one described by P1-description
    And I'm a registred user
    And I'm logged in
    And I go to the homepage

  @javascript
  Scenario: I want to vote for Project-one
    When I click on vote for first project
    #todo add wait for ajax
    And  I go to the homepage
    Then I had voted for the first project

  @javascript
  Scenario: I want to cancel my vote for Project-one
    Given I click on vote for first project
    And I go to the homepage
    When I click on vote for first project
    And I go to the homepage
    Then I had not voted for the first project
    And I had not voted against the first project


  @javascript
  Scenario: I want to vote against Project-one
    When I click on vote against first project
    #todo add wait for ajax
    And  I go to the homepage
    Then I had voted against the first project

  @javascript
  Scenario: I want to cancel my vote against Project-one
    Given I click on vote against first project
    And I go to the homepage
    When I click on vote against first project
    And I go to the homepage
    Then I had not voted for the first project
    And I had not voted against the first project

  @javascript
  Scenario: I want to vote against Project-one and change my mind
    Given I click on vote against first project
    When I click on vote for first project
    And I go to the homepage
    Then I had voted for the first project
    And I had not voted against the first project

  @javascript
  Scenario: I want to join a project
    When I click on join for first project
    #todo add wait for ajax
    And  I go to the homepage
    Then I am member of the first project

  @javascript
  Scenario: I want to leave a project
    Given I click on join for first project
    #todo add wait for ajax
    And  I go to the homepage
    When I click on join for first project
    And  I go to the homepage
    Then I am not member of the first project
    
