class Category < ActiveRecord::Base
  #attr_accessible :name, :description
  validates :name, presence: true

  has_many :items, dependent: :nullify

end
