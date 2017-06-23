class Cart < ActiveRecord::Base
  belongs_to :users
  has_many :line_items
  has_many :items, through: :line_items

  def add_item(item_id)
    line_item = self.line_items.find_by(item_id: item_id)
    if line_item
      line_item.quantity += 1
    else
      line_item=self.line_items.build(item_id: item_id)
    end
    line_item
  end

  def total
    line_items.inject(0) { |sum, line_item| sum + line_item.total}
  end

  def checkout
    updateInventory
    update(status: 'submitted')
  end

  def updateInventory
    line_items.each do |line_item|
      line_item.item.remove(line_item.quantity)
    end
  end
end
