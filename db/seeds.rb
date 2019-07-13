Admin.create name: "Admin", email: "admin@sun-asterisk.com",
  password: "Aa@123456", password_confirmation: "Aa@123456"

User.create name: "TanThanhLe", email: "le.tan.thanh@sun-asterisk.com",
  password: "Aa@123456", password_confirmation: "Aa@123456", is_admin: true

5.times do
  User.create name: FFaker::Name.name, email: FFaker::Internet.email,
    password: "Aa@123456", password_confirmation: "Aa@123456"
end

25.times do
  Post.create user: User.all.sample, title: FFaker::Lorem.sentence, body: FFaker::Lorem.paragraphs.join() * 5
end

100.times do
  Comment.create user: User.all.sample, post: Post.all.sample, body: FFaker::Lorem.paragraphs.join()
end
