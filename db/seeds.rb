# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

City.destroy_all
50.times do |index|
  City.create(
    city_name: Faker::Address.city,
  )
end

Specialty.destroy_all

arr_spec = ["immunologie", "anesthésiologie", "andrologie", "cardiologie", "chirurgie", "chirurgie_cardiaque", "chirurgie_esthétique", "chirurgie_générale", "chirurgie_maxillo-faciale", "chirurgie_pédiatrique", "chirurgie_thoracique", "chirurgie_vasculaire", "neurochirurgie", "dermatologie", "endocrinologie", "gastro-entérologie", "gériatrie,gynécologie", "hématologie", "hépatologie", "infectiologie", "médecine_générale", "néonatologie", "néphrologie", "neurologie", "odontologie", "oncologie", "obstétrique", "ophtalmologie", "orthopédie", "oto_rhino_laryngologie", "pédiatrie", "pneumologie", "psychiatrie", "radiologie", "radiothérapie", "rhumatologie", "urologie"]

15.times do |s|
  Specialty.create(
    specialty: arr_spec[s],
  )
end

Doctor.destroy_all

25.times do |index|
  Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    zip_code: Faker::Address.zip_code,
    city_id: City.ids.sample,
  )
end

Patient.destroy_all

35.times do |index|
  Patient.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city_id: City.ids.sample,
  )
end

Appointment.destroy_all

60.times do |index|
  Appointment.create(
    doctor: Doctor.all.sample,
    patient: Patient.all.sample,
    city_id: City.ids.sample,
    specialty_id: Specialty.ids.sample,
    date: Faker::Date.between(from: "2010-01-01", to: "2024-01-01"),
  )
end
