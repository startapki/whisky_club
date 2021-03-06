require 'open-uri'
require 'item_image_uploader'

if Rails.env.development? || ENV['STAGING'] == 'true'
  User.destroy_all
  Meeting.destroy_all
  AttributeKind.destroy_all
  Kind.destroy_all

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

  4.times do
    kind = Kind.create!(name: Faker::StarWars.vehicle)
    attribute_kind = AttributeKind.create! name: 'Droid', kind: kind, attribute_meta: 'selectlist'
    4.times { PossibleValue.create! value: Faker::StarWars.droid, attribute_kind: attribute_kind }
  end

  2.times do
    meeting = Meeting.create!(
      title: Faker::StarWars.planet
    )

    images_path = 'test/fixtures/files/item/image/*'
    images = Dir.glob(Rails.root.join(images_path)).sort.cycle

    5.times do
      kind = Kind.all.sample
      attribute_values_attributes = kind.attribute_kinds.reduce([]) do |a, e|
        a << { attribute_kind: e, possible_value: e.possible_values.sample }
      end
      Item.create!(
        title: Faker::StarWars.character,
        description: Faker::StarWars.quote,
        meeting: meeting,
        kind: kind,
        image: File.open(images.next),
        attribute_values_attributes: attribute_values_attributes
      )
    end
  end
end
