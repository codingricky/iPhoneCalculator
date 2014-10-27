Feature: Taking Pictures of the App
  As an iOS developer
  I want to take pictures of my App
  So I will know if the layout is correct 

Scenario: Taking Pictures of the App
  Given I am on the Welcome Screen
  And take picture
  Then I rotate the device so the home button is on the right
  And take picture


