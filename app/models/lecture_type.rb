class LectureType < BaseModel
  def validate
    validates_presence :name, :message => "Nazwa jest wymagana"
    validates_unique   :name, :message => "Nazwa jest już zajęta"
  end
end
