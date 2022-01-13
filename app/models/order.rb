class Order < ApplicationRecord
  belongs_to :user
  belongs_to :menu

  enum status: [:in_cart, :uncart, :preparing, :shipping, :complete]
  after_initialize :set_default_status, :if => :new_record?

  def set_default_status
    self.status ||= :in_cart
  end
end
