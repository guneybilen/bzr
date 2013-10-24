class Article < ActiveRecord::Base

  #validates_presence_of :title, :body
  validates :title, :body, presence: true  # there iss nothing wrong here. Tested!

end
