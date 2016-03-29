class Cart < ActiveRecord::Base

  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user


  def total
    line_items.inject(0) {|total, line_item| total + line_item.item_subtotal }
  end

  def add_item(item_id)
    if item_ids.include?(item_id.to_i)
      line_item = line_items.find_by(item_id)
      line_item.update(quantity: line_item.quantity + 1)
      line_item
    else
      line_items.build(item_id: item_id, quantity: 1)
    end
  end

end
