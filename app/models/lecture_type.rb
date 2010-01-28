class LectureType < BaseModel
  def validate
    validates_presence :name, :message => "Nazwa jest wymagana"
    validates_unique   :name, :message => "Nazwa jest już zajęta"
    validates_positive_integer :multiplier, :message => "Przelicznik musi być liczbą większą od zera"
  end

  def multiplier=(multiplier)
    super(multiplier.to_i)
  end
end
