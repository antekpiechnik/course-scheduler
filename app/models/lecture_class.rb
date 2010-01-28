class LectureClass < BaseModel
  SUMMER = "letni".freeze
  WINTER = "zimowy".freeze

  many_to_one :lecture_type
  many_to_one :lecture

  def validate
    validates_includes [SUMMER, WINTER], :semester, :message => "Semestr wymagany: zimowy lub letni"
    validates_positive_integer :billing_hours, :message => "Godziny rozliczeniowe muszą być dodatnie"
    validates_positive_integer :total_hours, :message => "Całkowite godziny muszą być dodatnie"
    validates_positive_integer :class_hours, :message => "Godziny zajęciowe muszą być dodatnie"
  end
end
