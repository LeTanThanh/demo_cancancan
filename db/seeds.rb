5.times do
  user = User.create name: FFaker::Name.name, email: FFaker::Internet.email,
    password: "Aa@123456", password_confirmation: "Aa@123456"

  5.times do
    user.posts.create title: FFaker::Lorem.sentence, body: FFaker::Lorem.paragraphs.join() * 5
  end
end
