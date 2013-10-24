include Faker

namespace :db do
desc "Fill database with sample data"

  task populate: :environment do
    Article.delete_all
    100.times do
      Article.create(body:Lorem.paragraph, excerpt:Lorem.paragraph, location:Address.city, published_at:random_time, title:(Lorem.words(rand(1..3))).join(' '))
    end
  end
end

def random_time from = Time.new(2000), to = Time.now
    rand(from..to)
end
