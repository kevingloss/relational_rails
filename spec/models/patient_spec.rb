require 'rails_helper'

RSpec.describe Patient do
  it {should belong_to :pediatrician}
end
