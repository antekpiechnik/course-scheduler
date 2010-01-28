  Scenario: Adding new university
    When I go to "dashboard" page
    And I follow "studia"
    And I follow "dodaj studia"
    And I fill in "Nazwa" with "AGH"
    And I press "Dodaj"
    Then I should see "Dodano uniwersytet"
    And I should be on "universities" page

  Scenario: Adding university fails
    When I go to "dashboard" page
    And I follow "studia"
    And I follow "dodaj studia"
    And I press "Dodaj"
    Then I should see "Wystąpiły błędy"
    And I should be on "new university" page

  Scenario: Removing university
    Given one model University exists
    And university name is "Michal"
    When I go to "universities" page
    Then I should see "Michal"
    When I follow "Usuń"
    And I press "Tak"
    Then I should be on "universities" page
    And I should not see "Michal"

  Scenario: Showing university goes to degrees
    Given model University exists
    And university name is "Testin"
    When I go to "universities" page
    And I follow "Testin"
    Then I should be on "university" page
    And I should see "Kierunki: Testin"

  @wip
  Scenario: Editing university
    Given one model University exists
    And university name is "Michal"
    When I go to "universities" page
    Then I should see "Michal"
    When I follow "Edytuj"
    And I check "Pensum?"
    And I fill in "Nazwa" with "Jacek"
    And I press "Aktualizuj"
    Then I should see "Zaktualizowano!"
    And I should see "Jacek"
