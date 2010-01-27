class LectureType < BaseModel
  def validate
    validates_presence :name, :message => "Nazwa jest wymagana"
    validates_unique   :name, :message => "Nazwa jest już zajęta"
    validates_integer  :multiplier, :message => "Przelicznik musi być liczbą większą od zera"
    if multiplier <= 0
      errors.add(:multiplier, "Przelicznik musi być liczbą większą od zera")
    end
  end

  def multiplier=(multiplier)
    super(multiplier.to_i)
  end
end
