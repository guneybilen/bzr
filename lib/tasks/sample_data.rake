include Faker

namespace :db do
desc "Fill database with sample data"

  task populate: :environment do
    User.delete_all
    Article.delete_all

    admin = User.create!(name: "Guney", last_name: "Bilen", email: "guneybilen@yahoo.com", password: "password")
    admin.toggle!(:admin)

    10.times do |n|
      u = User.create(name: Name.first_name, last_name: Name.last_name, email:"example#{n}@example.com", password: "password")

      10.times do
      Article.create(body:Lorem.paragraph,
                     user_id:u.id,
                     country:Faker::Address.country,
                     city:Faker::Address.city,
                     phone:Faker::PhoneNumber.phone_number,
                     cell:Faker::PhoneNumber.phone_number,
                     published_at:random_time,
                     price:rand(100..100000),
                     title:(Lorem.words(rand(1..3))).join(' '))
      end
    end
  end
end

def random_time from = Time.new(2000), to = Time.now
    rand(from..to)
end
