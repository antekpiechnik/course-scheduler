require File.join(File.dirname(__FILE__), '..', 'test_helper' )

class LectureTypeTest < Test::Unit::TestCase
  def test_name_cannot_be_empty
    lecture_type = LectureType.make
    assert_invalid(lecture_type, :name, "Nazwa jest wymagana") do
      lecture_type.name = ""
    end
  end

  def test_name_must_be_unique
    name = "typed1"
    LectureType.make(:name => name)
    lecture_type = LectureType.make
    assert_invalid(lecture_type, :name, "Nazwa jest już zajęta") do
      lecture_type.name = name
    end
  end

  def test_multiplier_must_be_numeric
    lecture_type = LectureType.make
    assert_invalid(lecture_type, :multiplier, "Przelicznik musi być liczbą większą od zera") do
      lecture_type.multiplier = 0
    end
    assert_invalid(lecture_type, :multiplier, "Przelicznik musi być liczbą większą od zera") do
      lecture_type.multiplier = "test"
    end
  end
end
