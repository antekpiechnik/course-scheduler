class Degree < BaseModel
  many_to_one :university

  def validate
    validates_presence :university_id, :message => "Uczelnia jest wymagana"
    validates_presence :name, :message => "Nazwa jest wymagana"
    validates_unique   [:name, :university_id], :message => "Nazwa jest już zajęta"
  end
end
