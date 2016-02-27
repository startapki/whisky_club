User.create!(
  email: 'user@example.com',
  password: 'password',
  password_confirmation: 'password'
)

meeting = Meeting.create!(
  title: 'Hello'
)

images_path = 'test/fixtures/files/item/image/*'
images = Dir.glob(Rails.root.join(images_path)).sort.cycle

Item.create!(
  title: 'Example item',
  description: 'Lorem ipsum **dolore** sit amet',
  meeting: meeting,
  image: File.open(images.next)
)
