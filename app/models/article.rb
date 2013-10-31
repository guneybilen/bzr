class Article < ActiveRecord::Base

  #validates_presence_of :title, :body
  validates :title, :body, presence: true  # there is nothing wrong here. Tested!

  belongs_to :user

  before_save :clean_data

  def clean_data
    # trim whitespace from beginning and end of string attributes
    attribute_names().each do |name|
    if self.send(name.to_sym).respond_to?(:strip)
      self.send("#{name}=".to_sym, self.send(name).strip)
    end
    end
  end


end
