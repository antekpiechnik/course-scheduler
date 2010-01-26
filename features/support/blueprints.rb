require 'machinist'
require 'machinist/sequel'
require 'sham'
require 'faker'

Sham.name { Faker::Name.name }
Sham.boolean(:unique => false) { [true, false].rand }

University.blueprint do
  name Sham.name
  pensum Sham.boolean
end
