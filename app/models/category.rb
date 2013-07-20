class Category < ActiveRecord::Base
  #attr_accessible :name, :description
  validates :name, presence: true
  validates :name, format: { with: /\A[a-zA-Z]+\z/,
        message: "only allows letters" }

  has_many :items, dependent: :nullify

end
