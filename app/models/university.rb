class University < Sequel::Model
  plugin :validation_helpers

  def self.tabular(order, fields)
    if order.nil?
      order = fields.first.asc
    else
      field, asc_desc = order.split(".")
      field, asc_desc = field.to_sym, asc_desc.to_sym
      if fields.include?(field) and [:asc, :desc].include?(asc_desc)
        order = field.to_sym.send(asc_desc.to_sym)
      else
        order = fields.first.asc
      end
    end
    limit(10).order(order).all
  end

  def validate
    validates_presence :name, :message => "Nazwa jest wymagana"
    validates_unique   :name, :message => "Nazwa jest już zajęta"
  end
end
