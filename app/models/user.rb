class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :carts

  def current_cart
    carts.find_by(status: 'active')
  end

  def current_cart=(cart)
    if !!cart
      cart.update(status: 'active') 
    end 
  end 

end
