class LineItem < ActiveRecord::Base

  belongs_to :cart
  belongs_to :item

  def item_subtotal
    (item.price / 100.00) * quantity
  end

end
