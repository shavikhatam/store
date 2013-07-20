class Comment < ActiveRecord::Base
  validates :message, presence: true
  validates :message, length: {
      minimum: 10,
      maximum: 200,
     too_short: "must have at least %{count} symbols",
     too_long: "must have at most %{count} symbols"
  }


  belongs_to :item

end
