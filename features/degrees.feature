  Scenario: Adding degree to university
    Given I am logged in
    And model University exists
    And university name is "South Karolina"
    When I go to "university" page
    And I follow "Dodaj nowy"
    And I fill in "Nazwa" with "IT"
    And I press "Dodaj"
    Then I should see "Dodano kierunek"
    And I should be on "university" page

  Scenario: Adding degree to university fails
    Given I am logged in
    And model University exists
    And university name is "South Karolina 2"
    When I go to "university" page
    And I follow "Dodaj nowy"
    And I press "Dodaj"
    Then I should see "Wystąpiły błędy"

  Scenario: Removing degree
    Given I am logged in
    And a degree exists
    And university name is "Toniemy Uni"
    And degree name is "ToNieMy Deg"
    When I go to "university" page
    Then I should see "ToNieMy Deg"
    When I follow "Usuń"
    And I press "Tak"
    Then I should be on "university" page
    And I should see "Kierunek usunięty"
    And I should not see "ToNieMy Deg"

  Scenario: Editing degree
    Given I am logged in
    And a degree exists
    And degree name is "Lol"
    When I go to "university" page
    When I follow "Edytuj"
    And I fill in "Nazwa" with "Olo"
    And I press "Edytuj"
    Then I should be on "university" page
    And I should see "Zaktualizowano!"
    And I should see "Olo"
