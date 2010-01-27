  Scenario: Listing features
    Given model LectureType exists
    And lecturetype name is "ficzer"
    When I go to "universities" page
    And I follow "Typy zajęć"
    Then I should see "ficzer"
