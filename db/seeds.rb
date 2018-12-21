# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Array.new(5).each_with_index { |val,i|
    building = Building.create({title: "BuildingTitle#{i}", code: "BuildingCode#{i}"})

    Array.new(5).each_with_index { |val,i|
        building.rooms << Room.create({title: "RoomTitle#{i}", code: "RoomCode#{i}"})
    }

    building.save!
}
