  Scenario: Listing lecture types
    Given I am logged in
    And model LectureType exists
    And lecturetype name is "ficzer"
    When I go to "universities" page
    And I follow "Typy zajęć"
    Then I should see "ficzer"

  Scenario: Adding lecture type
    Given I am logged in
    When I go to "lecture types" page
    And I follow "Dodaj typ"
    And I fill in "Nazwa" with "tajp"
    And I fill in "Przelicznik" with "12"
    And I press "Dodaj"
    Then I should see "Dodano typ"
    And I should be on "lecture types" page

  Scenario: Adding lecture type fails
    Given I am logged in
    When I go to "lecture types" page
    And I follow "Dodaj typ"
    And I press "Dodaj"
    Then I should see "Wystąpiły błędy"
    And I should be on "new lecture type" page

  Scenario: Editing lecture
    Given I am logged in
    And a lecture_type exists
    And lecture_type name is "loal"
    When I go to "lecture types" page
    When I follow "Edytuj"
    And I fill in "Nazwa" with "loal2"
    And I fill in "Przelicznik" with "13"
    And I press "Edytuj"
    Then I should be on "lecture types" page
    And I should see "Zaktualizowano!"
    And I should see "loal2"
