# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Criando Moedas"

Coin.find_or_create_by!(
    description: "BTC",
    image: "Qualquer coisa"
)

puts "Moeda Criada"

puts "Criando medidas"
100.times {

  volt = rand(218...230)
  amp = rand(0.1...0.3)
  pow = volt * amp
  ener = (pow * 15)/60

  Measure.create!(

    date: Time.now, 
    voltage: volt.round(2), 
    current: amp.round(2), 
    power: pow.round(2), 
    energy: ener.round(2), 
    frequency: rand(59...60).round(0), 
    pf: rand(0.8...1.0).round(2)
  )
}

puts "Medidas Criadas"