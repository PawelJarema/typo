Feature: Merge Articles
  As an admin
  So that I can put similar articles in one place
  I want to merge articles at will

  Background:
    Given the blog is set up
    And two articles exist
    And a regular, non admin user exists

  Scenario: A non-admin cannot merge two articles
    Given I'm not logged in as admin 
    And I am on the edit article page of first article
    Then I should not see "Merge Articles"

  Scenario: When articles are merged, the merged arrticle should contain the text of both articles
    Given I am logged into the admin panel
    And I am on the edit article page of first article
    When I merge article1 with article2
    Then the new article should consist of article1 and article2
