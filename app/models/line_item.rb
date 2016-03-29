class LineItem < ActiveRecord::Base

  belongs_to :cart
  belongs_to :item

  def item_subtotal
    item.price * quantity
  end

end
