class Article < ActiveRecord::Base

  #validates_presence_of :title, :body
  validates :title, :body, presence: true  # there is nothing wrong here. Tested!

  belongs_to :user

  before_save :clean_data, :remove_nbsp

  has_attached_file :image1, :styles => {
      :thumb => '50x50>',
      :square => '400x400#',
      :medium => '800x800>'
  }

  has_attached_file :image2, :styles => {
      :thumb => '50x50>',
      :square => '400x400#',
      :medium => '800x800>'
  }

  has_attached_file :image3, :styles => {
      :thumb => '50x50>',
      :square => '400x400#',
      :medium => '800x800>'
  }

  has_attached_file :image4, :styles => {
      :thumb => '50x50>',
      :square => '400x400#',
      :medium => '800x800>'
  }

  has_attached_file :image5, :styles => {
      :thumb => '50x50>',
      :square => '400x400#',
      :medium => '800x800>'
  }

  attr_accessor :delete_asset1, :delete_asset2, :delete_asset3, :delete_asset4, :delete_asset5

  before_validation do
    #puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ " + delete_asset1.nil?
    image1.clear if delete_asset1 == '1'
    image2.clear if delete_asset2 == '1'
    image3.clear if delete_asset3 == '1'
    image4.clear if delete_asset4 == '1'
    image5.clear if delete_asset5 == '1'
  end

  private
    def clean_data
      # trim whitespace from beginning and end of string attributes
      attribute_names().each do |name|
      if self.send(name.to_sym).respond_to?(:strip)
        self.send("#{name}=".to_sym, self.send(name).strip)
      end
      end
    end

    def remove_nbsp
      self.body = body.gsub(/[&nbsp;]*\<\/p\>$/i,"")
      self.body = body << "</p>"
    end

end
