class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :item_users, dependent: :destroy
  has_many :orders, dependent: :destroy

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/missing.png"


  # возвращает полное имя пользователя в зависимости от того, заполнены ли у него какие-то поля или нет
  # @return String
  def full_name
    if !first_name.blank? && !last_name.blank?
      return first_name + ' ' + last_name[0] + '.'
    end

    if !first_name.blank?
      return first_name
    end

    if !last_name.blank?
      return last_name
    end

    email.split('@')[0]

  end

end
