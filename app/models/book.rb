class Book < ApplicationRecord
  belongs_to :author
  validates_presence_of :name, :rating

  def self.read?
    where(read: true)
  end
end
