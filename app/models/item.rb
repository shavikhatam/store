class Item < ActiveRecord::Base
  validates :name, :description, :price, :presence => true
  validates :category_id, presence: true
  validates_length_of :name, :minimum => 5
  validates :price, :numericality => {:greater_than => 0, :only_integer => true}
  validates :name, uniqueness: true

  belongs_to :category
  has_many :comments, dependent: :nullify
  has_many :item_users, dependent: :destroy
  has_many :item_orders, dependent: :destroy

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/missing_image.png"

end
