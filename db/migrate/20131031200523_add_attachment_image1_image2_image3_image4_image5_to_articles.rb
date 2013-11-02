class AddAttachmentImage1Image2Image3Image4Image5ToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :image1
      t.attachment :image2
      t.attachment :image3
      t.attachment :image4
      t.attachment :image5
    end
  end

  def self.down
    drop_attached_file :articles, :image1
    drop_attached_file :articles, :image2
    drop_attached_file :articles, :image3
    drop_attached_file :articles, :image4
    drop_attached_file :articles, :image5
  end
end
