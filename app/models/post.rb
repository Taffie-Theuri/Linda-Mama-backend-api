class Post < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  # Active Storage attachment
  has_one_attached :image
end
