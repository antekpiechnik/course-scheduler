class University < Sequel::Model
  plugin :validation_helpers

  def self.tabular(order, page, fields)
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
    page = page.to_i
    page = 0 if page <= 0
    offset = page * self.per_page
    limit(self.per_page, offset).order(order).all
  end

  def self.per_page
    10
  end

  def validate
    validates_presence :name, :message => "Nazwa jest wymagana"
    validates_unique   :name, :message => "Nazwa jest już zajęta"
  end
end
