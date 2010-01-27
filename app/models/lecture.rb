class Lecture < BaseModel
  many_to_one :degree

  def validate
    validates_presence :degree_id, :message => "Kierunek jest wymagany"
    validates_presence :name, :message => "Nazwa jest wymagana"
    validates_unique   [:name, :degree_id, :year], :message => "Nazwa jest już zajęta"
    validates_includes (1..5), :year, :message => "Rok musi być między 1 a 5"
  end
end
