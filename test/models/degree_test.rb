require File.join(File.dirname(__FILE__), '..', 'test_helper' )

class DegreeTest < Test::Unit::TestCase
  def test_university_is_mandatory
    degree = Degree.make
    assert_invalid(degree, :university_id, "Uczelnia jest wymagana") do
      degree.university_id = nil
    end
  end

  def test_name_cannot_be_empty
    degree = Degree.make
    assert_invalid(degree, :name, "Nazwa jest wymagana") do
      degree.name = ""
    end
  end
end
