require File.join(File.dirname(__FILE__), '..', 'test_helper' )

class LectureClassTest < Test::Unit::TestCase
  def test_semester_must_be_one_of_two
    lecture_class = LectureClass.make
    assert_invalid(lecture_class, :semester, "Semestr wymagany: zimowy lub letni") do
      lecture_class.semester = "słaby"
    end
  end

  def test_billing_hours_positive_integer
    lecture_class = LectureClass.make
    assert_invalid(lecture_class, :billing_hours, "Godziny rozliczeniowe muszą być dodatnie") do
      lecture_class.billing_hours = 0
    end
  end

  def test_total_hours_positive_integer
    lecture_class = LectureClass.make
    assert_invalid(lecture_class, :total_hours, "Całkowite godziny muszą być dodatnie") do
      lecture_class.total_hours = 0
    end
  end

  def test_class_hours_positive_integer
    lecture_class = LectureClass.make
    assert_invalid(lecture_class, :class_hours, "Godziny zajęciowe muszą być dodatnie") do
      lecture_class.class_hours = 0
    end
  end
end
