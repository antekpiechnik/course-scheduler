  Scenario: Adding feature to degree
    Given a degree exists
    When I go to "degree" page
    And I follow "Dodaj wykład"
    And I fill in "Nazwa" with "Wyklad1"
    And I press "Dodaj"
    Then I should see "Dodano wykład"
    And I should be on "degree" page
