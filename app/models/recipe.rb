class Recipe < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "400x400#"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :name, presence: true
  has_many :directions, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :directions, :allow_destroy => true
  accepts_nested_attributes_for :ingredients, :allow_destroy => true

end
