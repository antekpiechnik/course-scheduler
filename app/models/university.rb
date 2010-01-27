class University < BaseModel
  one_to_many :degrees

  def validate
    validates_presence :name, :message => "Nazwa jest wymagana"
    validates_unique   :name, :message => "Nazwa jest już zajęta"
  end

  def before_destroy
    degrees.each { |d| d.destroy }
  end
end
