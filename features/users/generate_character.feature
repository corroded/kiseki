Feature: Generate character
  In order to play
  As a user
  I want to be able to sign up and automatically generate a character

  Scenario: User signs up with valid data
    Given I am not logged in
    When I go to the sign up page
    And I fill in "Email" with "imacaterpillar@gmail.com"
    And I fill in "Password" with "tester"
    And I fill in "Password confirmation" with "tester"
    And I press "Sign up"
    Then I should see "Welcome! You have signed up successfully."
    And I should have a character with name "imacaterpillar@gmail.com's avatar"