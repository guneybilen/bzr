include Faker

namespace :db do
desc "Fill database with sample data"

  task populate: :environment do
    User.delete_all
    Article.delete_all

    admin = User.create!(name: "Guney", last_name: "Bilen", email: "guneybilen@yahoo.com", password: "password")
    admin.toggle!(:admin)

    100.times do |n|
      User.create(name: Name.first_name, last_name: Name.last_name, email:"example#{n}@example.com", password: "password")
    end

    100.times do
      Article.create(body:Lorem.paragraph, excerpt:Lorem.paragraph, location:Address.city, published_at:random_time, title:(Lorem.words(rand(1..3))).join(' '))
    end
  end
end

def random_time from = Time.new(2000), to = Time.now
    rand(from..to)
end
