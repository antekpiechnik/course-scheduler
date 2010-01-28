require File.join(File.dirname(__FILE__), '..', 'test_helper' )

class LectureTest < Test::Unit::TestCase
  def test_degree_is_mandatory
    lecture = Lecture.make
    assert_invalid(lecture, :degree_id, "Kierunek jest wymagany") do
      lecture.degree_id = nil
    end
  end

  def test_name_cannot_be_empty
    lecture = Lecture.make
    assert_invalid(lecture, :name, "Nazwa jest wymagana") do
      lecture.name = ""
    end
  end

  def test_name_must_be_unique
    name = "unique333"
    degree = Degree.make
    Lecture.make(:name => name, :degree => degree, :year => 1)
    lecture = Lecture.make(:degree => degree, :year => 1)
    assert_invalid(lecture, [:name, :degree_id, :year], "Nazwa jest już zajęta") do
      lecture.name = name
    end
  end

  def test_name_unique_across_one_university
    name = "the same"
    degree = Degree.make
    Lecture.make(:name => name, :degree => degree, :year => 1)
    Lecture.make(:name => name, :degree => degree, :year => 2)
  end

  def test_year_is_valid_from_1_to_5
    lecture = Lecture.make
    assert_invalid(lecture, :year, "Rok musi być między 1 a 5") do
      lecture.year = 6
    end
    assert_invalid(lecture, :year, "Rok musi być między 1 a 5") do
      lecture.year = 0
    end
  end
end
