require 'bcrypt'
class User < ActiveRecord::Base

  has_many :items
  has_many :buyer_relationships,
            class_name: 'Bid',
            foreign_key: 'buy_id'

  has_many :buyers, through: :buyer_relationships

  validates :username, :email, :password, presence: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6 }


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
