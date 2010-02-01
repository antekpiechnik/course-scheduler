  Scenario: Adding lecture_class to a lecture
    Given a lecture exists
    Given a lecture_type exists
    And lecture_type name is "jacek"
    When I go to "lecture" page
    And I follow "dodaj klasy"
    And I fill in "BH" with "10"
    And I fill in "CH" with "10"
    And I fill in "TH" with "10"
    And I select "jacek" from "Typ"
    And I select "letni" from "Semestr"
    And I press "Dodaj"
    Then I should see "Dodano klasy"
    And I should be on "lecture" page

  Scenario: Removing lecture_class
    Given a lecture_class exists
    And lecture_class semester is "zimowy"
    When I go to "lecture" page
    And I follow "Usuń"
    And I press "Tak"
    And I should be on "lecture" page
    And I should see "Klasa usunięta"

  Scenario: Editing lecture_class
    Given a lecture_class exists
    And lecture_type name is "jaceklol"
    And lecture_class semester is "zimowy"
    When I go to "lecture" page
    When I follow "Edytuj"
    And I select "jaceklol" from "Typ"
    And I select "letni" from "Semestr"
    And I fill in "TH" with "666"
    And I press "Edytuj"
    Then I should be on "lecture" page
    And I should see "Zaktualizowano!"
    And I should see "666"
    And I should see "letni"
