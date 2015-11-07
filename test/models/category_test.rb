require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "should not save a category without a title" do
    category = Category.new
    assert_not category.save
  end
end
