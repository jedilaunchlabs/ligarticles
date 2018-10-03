class Article < ApplicationRecord
  has_one_attached :image

  validates_presence_of :title
  validates_presence_of :description
  validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
