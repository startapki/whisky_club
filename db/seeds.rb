require 'open-uri'
require 'item_image_uploader'

if Rails.env.development? || ENV['STAGING'] == 'true'
  User.destroy_all
  Meeting.destroy_all

  User.create!(
    email: 'admin@example.com',
    admin: true,
    password: 'password',
    password_confirmation: 'password',
    name: Faker::Name.name
  )

  User.create!(
    email: 'user@example.com',
    password: 'password',
    password_confirmation: 'password',
    name: Faker::Name.name
  )

  2.times do
    meeting = Meeting.create!(
      title: Faker::StarWars.planet
    )

    images_path = 'test/fixtures/files/item/image/*'
    images = Dir.glob(Rails.root.join(images_path)).sort.cycle

    5.times do
      Item.create!(
        title: Faker::StarWars.character,
        description: Faker::StarWars.quote,
        meeting: meeting,
        image: File.open(images.next)
      )
    end
  end
end
