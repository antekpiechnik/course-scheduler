  Scenario: Adding lectures to degree
    Given I am logged in
    And a degree exists
    When I go to "degree" page
    And I follow "Dodaj zajęcia"
    And I fill in "Nazwa" with "Wyklad1"
    And I press "Dodaj"
    Then I should see "Dodano zajęcia"
    And I should be on "degree" page

  Scenario: Removing lecture
    Given I am logged in
    And a lecture exists
    And lecture name is "wyklad333"
    When I go to "degree" page
    And I follow "Usuń"
    And I press "Tak"
    And I should be on "degree" page
    And I should see "Zajęcia usunięte"
    And I should not see "wyklad333"

  Scenario: Editing lecture
    Given I am logged in
    And a lecture exists
    And lecture name is "loal"
    When I go to "degree" page
    When I follow "Edytuj"
    And I fill in "Nazwa" with "loal2"
    And I press "Edytuj"
    Then I should be on "degree" page
    And I should see "Zaktualizowano!"
    And I should see "loal2"
