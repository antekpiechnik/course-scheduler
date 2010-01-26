  Scenario: Adding new university
    When I go to "dashboard" page
    And I follow "studia"
    And I follow "dodaj nowe"
    And I fill in "Nazwa" with "AGH"
    And I press "Dodaj"
    Then I should see "Dodano uniwersytet"
    And I should be on "universities" page

  Scenario: Adding university fails
    When I go to "dashboard" page
    And I follow "studia"
    And I follow "dodaj nowe"
    And I press "Dodaj"
    Then I should see "Nie dodano uniwersytetu"
    And I should be on "new university" page
