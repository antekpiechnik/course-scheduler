  Scenario: Listing lecture types
    Given model LectureType exists
    And lecturetype name is "ficzer"
    When I go to "universities" page
    And I follow "Typy zajęć"
    Then I should see "ficzer"

  Scenario: Adding lecture type
    When I go to "lecture types" page
    And I follow "Dodaj typ"
    And I fill in "Nazwa" with "tajp"
    And I fill in "Przelicznik" with "12"
    And I press "Dodaj"
    Then I should see "Dodano typ"
    And I should be on "lecture types" page

  Scenario: Adding lecture type fails
    When I go to "lecture types" page
    And I follow "Dodaj typ"
    And I press "Dodaj"
    Then I should see "Wystąpiły błędy"
    And I should be on "new lecture type" page
