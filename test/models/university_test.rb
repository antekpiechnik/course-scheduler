require File.join("test", "test_helper")

class UniversityTest < Test::Unit::TestCase
  def test_empty_name_is_invalid
    university = University.make
    assert_invalid(university, :name, "Name is not present") do
      university.name = ""
    end
  end

  def test_name_unique
    name = "unique"
    University.make(:name => name)
    university = University.make
    assert_invalid(university, :name, "Name is already taken") do
      university.name = name
    end
  end
end
