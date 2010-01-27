require 'machinist'
require 'machinist/sequel'
require 'sham'
require 'faker'

Sham.name { Faker::Name.name }
Sham.boolean(:unique => false) { [true, false].rand }
Sham.text { Faker::Lorem.sentence }
Sham.number(:unique => false) { rand(50) }
Sham.year(:unique => false) { (1..5).to_a.rand }

University.blueprint do
  name { Sham.name }
  pensum { Sham.boolean }
end

Degree.blueprint do
  name { Sham.name }
  it { Sham.boolean }
  university { University.make }
end

Lecture.blueprint do
  name { Sham.name }
  degree { Degree.make }
  year { Sham.year }
  note { Sham.text }
end

LectureType.blueprint do
  name { Sham.name }
  multiplier { Sham.number }
end
