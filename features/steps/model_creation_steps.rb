Given /^(one )?model (.*) exists$/ do |count, model|
  klass = Object.full_const_get(model)
  klass.destroy if count == "one "
  o = klass.make
  instance_variable_set(("@%s" % [model.downcase]).to_sym, o)
end

Given /^([0-9a-z_]+) ([0-9a-z_]+) is "([^\"]*)"$/ do |instance_name, field, value|
  o = instance_variable_get(("@%s" % [instance_name]).to_sym)
  assert o, "No instance %p" % [instance_name]
  o.send(("%s=" % [field]).to_sym, value)
  o.save
end
