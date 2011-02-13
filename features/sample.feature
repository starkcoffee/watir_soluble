Feature:
  As a coffee adict
  I want to order a coffee
  So that I can feed my addiction

Scenario: The user successfully orders a coffee
  Given I have browsed to the "sample_app" home page
  When I enter valid coffee preferences
  Then I should have successfully made an order
