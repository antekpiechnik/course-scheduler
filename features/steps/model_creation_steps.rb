Given /^(one )?model (.*) exists$/ do |count, model|
  klass = Object.full_const_get(model)
  if count == "one "
    LectureClass.all.each { |o| o.destroy }
    klass.all.each { |o| o.destroy }
  end
  o = klass.make
  instance_variable_set(("@%s" % [model.downcase]).to_sym, o)
end

Given /^([0-9a-z_]+) ([0-9a-z_]+) is "([^\"]*)"$/ do |instance_name, field, value|
  o = instance_variable_get(("@%s" % [instance_name]).to_sym)
  assert o, "No instance %p" % [instance_name]
  o.send(("%s=" % [field]).to_sym, value)
  o.save
end

Given /^a degree exists$/ do
  @university ||= University.make
  @degree = Degree.make(:university => @university)
end

Given /^a lecture exists$/ do
  Given "a degree exists"
  @lecture = Lecture.make(:degree => @degree)
end

Given /^a lecture_type exists$/ do
  @lecture_type = LectureType.make
end

Given /^a lecture_class exists$/ do
  Given "a lecture exists"
  Given "a lecture_type exists"
  @lecture_class = LectureClass.make(:lecture_id => @lecture.pk,
                                     :lecture_type_id => @lecture_type.pk,
                                     :semester => LectureClass::SUMMER,
                                     :billing_hours => 10,
                                     :class_hours => 10,
                                     :total_hours => 20
                                    )
end
